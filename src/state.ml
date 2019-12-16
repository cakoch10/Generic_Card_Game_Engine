open Ast
open Command
open Yojson.Basic.Util
(* open Base *)

exception ParserError
exception AstParseError
exception MoveError of string

let ranks = ["2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"; "10"; "J"; "K"; "Q"; "A"]

let suits = ["C"; "D"; "H"; "S"]

(* cards are of the form (rank, suit) *)
type card = string * string [@@deriving sexp, compare, equal, hash]

type location = string [@@deriving sexp, compare, equal, hash]

type player = {
  name: string;
  turns: int;
  has_won: bool;
  score: int;
  is_ai: bool;
} [@@deriving sexp, compare, equal, hash]

type card_location =
  (location * (card list)) [@@deriving sexp, compare, equal, hash]

(* [state] represents the current state of the card game. *)
type state = {
  players: player list;
  last_player: player;
  curr_player: player;
  next_player: player;
  card_locations: card_location list;
  curr_cards_played: int;
  curr_cards_drawn: int;
  curr_cards_taken: int;
  static_dat: static_data;
  winners: string list;
  last_move: Command.command;
  last_command: Command.command;
  highscore: int;
}

and static_data = {
  win_conditions: (state -> bool) list;
  card_points: ((state -> bool) * (state -> int)) list;
  rules: ((state -> bool) * (Command.command -> state -> bool)) list;
  loc_show: (location * bool) list;
  help_message: string;
  intro_message: string;
  default_play_loc: string;
  default_draw_loc: string;
  default_take_loc: string;
} [@@deriving sexp, compare, equal, hash]


(* [topCard_func loc st] is the singleton of the card on the top of the card 
 * stack labelled [loc] in state [st]. 
 * Requires: 
 * - [loc] is a valid location in state [st]. 
 * - [st] is a valid state. *)

(* [rank_to_int rank] converts a [rank] string to an integer *)
let rank_to_int rank =
  match rank with
  | "A" -> 1
  | "K" -> 13
  | "Q" -> 12
  | "J" -> 11
  | s -> int_of_string s

(* [card_to_int card] maps a card to a unique integer between 1 and 52 *)
let card_to_int ((rk, suit):card) = 
  match suit with
  | "C" -> 4*(rank_to_int rk)
  | "D" -> 4*(rank_to_int rk) - 1
  | "H" -> 4*(rank_to_int rk) - 2 
  | "S" -> 4*(rank_to_int rk) - 3
  | _ -> ~-1

(* [card_from_int i] maps an int to a card *)
let card_from_int i = 
  let suit = (~-1*((i mod 4) - 4)) mod 4 in
  let rank = (i+suit) / 4 in
  let suit_str = if suit = 0 then "C"
                 else if suit = 1 then "D"
                 else if suit = 2 then "H"
                 else "S" in
  let rank_str = if rank = 1 then "A"
                 else if rank = 11 then "J"
                 else if rank = 12 then "Q"
                 else if rank = 13 then "K"
                 else string_of_int rank in
  (rank_str, suit_str)

(* [sublist n l] is the list of the first n elements of l. If [l] is less than
   [n] elements the rest of the entries will be 0 
   - requires: [l] is an int list *)
let rec sublist n l =
  if n = 0 then []
  else match l with
  | [] -> 0::(sublist (n-1) [])
  | h::t -> h::(sublist (n-1) l)

(* [pow a b] is an int a^b where a and b are ints *)
let pow a b =
  let p = (float_of_int a) ** (float_of_int b) in
  int_of_float p


(* [hash_state st] creates a hash for a given st *)
let hash_state st =
  (* let p = 524288 *)
  let pl = st.curr_player.name in
  (* get hand of pl, assume at most 7 cards *)
  let cards = List.assoc pl st.card_locations in
  let card_ints = List.map (fun card -> card_to_int card) cards in
  let card_ints_truncated = sublist 7 card_ints in
  let hash_vec = card_ints_truncated @ [
    st.curr_cards_played;
    st.curr_cards_drawn;
    st.curr_cards_taken;
    st.highscore;
  ] in
  (* hash as x1+ax2+a^2x+a^3x3+... mod p *)
  let p = 524288 in
  let a = 14514 in
  let (hash_val, idx) = List.fold_left (fun (vl, i) x ->
    ((vl + x*(pow a i)) mod p, i+1)
  ) (0,0) hash_vec in
  hash_val


(* maps moves to ints *)
let ints_from_moves moves =
  let f move =
    match move with
    | Draw (_) -> 104
    | Play(card,_) -> (card_to_int card) - 1
    | Take(card,_) -> (card_to_int card) + 51
    | _ -> 105 in
  List.map f moves


(* 
STATE HELPER FUNCTIONS
  topCard : state -> location -> card
  Size : state -> location -> int
  Contains : state -> location -> card list -> bool
  CardsPlayed : state -> int
  Score : state -> player -> int
*)

(* [topCard_func loc st] is the singleton of the card on the top of the card 
 * stack labelled [loc] in state [st]. 
 * Requires: 
 * - [loc] is a valid location in state [st]. 
 * - [st] is a valid state. *)
let topCard_func (loc:Ast.location) st : Ast.card list =
  try let cards = List.assoc loc st.card_locations in
    match cards with
    | [] -> [("", "")]
    | (f, s)::t -> [(f, s)]
  with Not_found -> [("","")]

(* [size loc st] is the size/number of cards in the card stack labeled [loc] in
 * the state [st]. 
 * Requires:
 * - [loc] is a valid location in state [st]. 
 * - [st] is a valid state. *)
let size (loc:Ast.location) st =
  try let cards = List.assoc loc st.card_locations in
    List.length cards
  with Not_found -> 0 

(* [cards_played st] is the number of cards played in the current player's turn 
 * in state [st]. 
 * Requires:  
 * - [st] is a valid state. *)
let cards_played st = st.curr_cards_played

(* [cards_drawn st] is the number of cards drawn in the current player's turn 
 * in state [st]. 
 * Requires:  
 * - [st] is a valid state. *)
let cards_drawn st = st.curr_cards_drawn

(* [cards_taken st] is the number of cards drawn in the current player's turn 
 * in state [st]. 
 * Requires:  
 * - [st] is a valid state. *)
let cards_taken st = st.curr_cards_taken

(* [high_score st] is the high score in state [st] 
 * Requires:  
 * - [st] is a valid state. *)
let high_score st = st.highscore

let default_draw_l st = st.static_dat.default_draw_loc

let default_take_l st = st.static_dat.default_take_loc

let default_play_l st = st.static_dat.default_play_loc


(* [get_player p_list p_name] is the player in [p_list] with name [p_name] *)
let rec get_player p_list p_name =
  match p_list with
  | [] -> failwith "No such player name"
  | h::t -> if h.name = p_name then h else get_player t p_name

(* [score s bool_lst] is x iff the current score of state [s] according
 * to the conditions and point values in [bool_lst] is x 
 * Requires:
 * - [s] is a valid state. *)
 let score s player_nme =
  let player = get_player s.players player_nme in
  let new_state = {s with curr_player = player} in 
  let bool_lst = new_state.static_dat.card_points in
  let f num (bl, i) = if bl new_state then (i new_state) + num else num in
  List.fold_left f 0 bool_lst

(* [lst_index elm index lst] is the index of [elm] in [lst] *)
let rec lst_index elm index = function
| [] -> raise Not_found
| h::t -> if h = elm then index
          else lst_index elm (index + 1) t

(* [next_rank rnk] is the next rank, following [rnk].
 * Requires:
 * - [rnk] <> "A" *)          
let next_rank rnk = 
  (lst_index rnk 0 ranks) + 1 |> List.nth ranks

(* [next_suit suit] is the next suit, following [suit].
 * Requires:
 * - [suit] <> "S" *)   
let next_suit suit = 
  (lst_index suit 0 suits) + 1 |> List.nth suits

(* [create_deck deck] returns a card list of 52 cards representing a deck 
 * Requires:
 * - [deck] is initially empty *)
let rec create_deck deck =
  if List.length deck = 52 then deck
  else 
    match deck with
    | [] -> create_deck ([("2", "C")])
    | (rnk, suit)::t -> if suit = "S" then 
                          create_deck (((next_rank rnk), "C")::(rnk, suit)::t)
                        else create_deck ((rnk, next_suit suit)::(rnk, suit)::t)

(* [shuffle card_lst num rand_lst] will return a pair the first element of which
 * is a card list of length [num] 
 * where cards are in random order and are taken from [card_lst]. The second
 * pair element is the remaining cards in [card_lst] 
 * - Requires: 
 * [num] >= 0, <= len(card_lst) *)
let rec shuffle card_lst num rand_lst =
if List.length rand_lst = num then (rand_lst, card_lst)
else
  let new_card = Random.self_init ();
                 Random.int (List.length card_lst) |> List.nth card_lst in
  shuffle (List.filter (fun cd -> cd <> new_card) card_lst)
          num
          (new_card::rand_lst)

(* [create_empty_card_lst] recursively creates a card list that is filled with 
 * [Empty|Empty], which is how we represent an empty card.  *)
let rec create_empty_card_lst = function
| [] -> []
| h::t -> (h, [])::(create_empty_card_lst t)

(* [set_card_locs js_lst cd_lst cards] distributes the cards to their respective
 * locations as specified by the dealings in the JSON 
 * requires: [cards] is a valid card list *)
let rec set_card_locs js_lst cd_lst cards =
match js_lst with
| [] -> cd_lst
| h::t -> 
  let loc = (h |> member "location" |> to_string |> String.lowercase_ascii) in
  let n = (h |> member "number_of_cards" |> to_int) in
  let (loc_cards, new_deck) = shuffle cards n [] in
  set_card_locs t
                (List.remove_assoc loc cd_lst |> List.cons (loc, loc_cards))
                new_deck

(* [set_vis_locs js_lst acc] parses the visibility of locations from a 
 * json list and returns a list with locations mapped to a bool representing
 * their visibility in the gui 
 * requires: js_lst contains a list of json objects represnting locs and 
 * visibility *)  
let rec set_vis_locs js_lst acc =
  match js_lst with
  | [] -> acc
  | h::t -> 
    let loc = (h |> member "location" |> to_string |> String.lowercase_ascii) in
    let v = (h |> member "visible" |> to_bool) in
    (set_vis_locs t ((loc,v)::acc))

(*============================================*)
(* WILD CARD FUNCTIONS *)
(*============================================*)

(* [remove_wild] takes a single card which may have a wildcard 
 * character and returns a list of cards matching that wildcard *)
let rec remove_wild = function
  | ("*", "*") -> create_deck []
  | ("*", s) -> List.combine ranks [s; s; s; s; s; s; s; s; s; s; s; s; s]
  | (r, "*") -> List.combine [r; r; r; r] suits
  | (r, s) -> [(r, s)]

(* [remove_wildcards wilcards nonwilds] returns a list of cards without any 
* wildcard characters according to what was initially given in [wildcards]
* requires:
* - [nonwilds] is initially empty *)
let rec remove_wildcards wildcards nonwilds =
  match wildcards with
  | [] -> nonwilds
  | h::t -> remove_wildcards t ((remove_wild h)@nonwilds)

(* [remove_c_from_h card hand] will remove [card] from the list [hand] *)
let rec remove_c_from_h card hand =
  match hand with
  | [] -> []
  | h::t -> if h = card then t else h::(remove_c_from_h card t)

(* [subset sub set] is true iff [sub] is contained in [set] *)
let rec subset sub set =
  match sub with
  | [] -> true
  | h::t -> if List.mem h set then subset t (remove_c_from_h h set)
            else false

(* [contains_helper clist cards] is true iff [clist] is contained in [cards] *)
let rec contains_helper clist cards = 
  match clist with 
  | [] -> true
  | h::t -> 
    let cand_lst = remove_wildcards [h] [] in
    try
      let matched_card = List.find (fun cd -> List.mem cd cards) cand_lst in
      contains_helper t (remove_c_from_h matched_card cards)
    with Not_found -> false

(* [contains l clist s] is true iff the list of cards [clist] is contained in 
 * the list of cards in location [l] in state [s] *) 
let contains l clist s =
  try let cards = List.assoc l s.card_locations in
  contains_helper clist cards 
  with Not_found -> false

(**jsonparse.ml**)

(* [parse_to_ast s] is the ast form of Card Language code of [s]. *) 
let parse_to_ast s =
  let lexbuf = Lexing.from_string s in
  try let ast = Parser.prog Lexer.read lexbuf in ast
  with exn -> raise AstParseError

(*** EVAL RULE FUNCTION AND HELPERS***)
(** [eval_bool rule st] : expr -> state -> (state -> 'a)*)

(* [equal lst1 lst2] is true iff ei=ei' for all i=1,...,n where
 * lst1 = [e1;...;en] and lst2 = [e1';...;en'] and we remove wildcards from 
 * ei' when necessary 
 * requires: 
 * - none of ei contain a wildcard *)
let rec equal lst1 lst2 = 
  match lst1, lst2 with
  | [], [] -> true
  | h1::t1, h2::t2 -> (contains_helper [h2] [h1]) && (equal t1 t2)
  | _ -> false

(* [eval rule] is the state function of a rule boolean. 
 * requires: 
 * - [rule] is an Ast.expr that evaluates to type bool when executed. *)
let rec eval rule : (state -> bool) = 
  eval_bool rule

(* [eval_int rule] is a state function of an integer expression. It translates
 * [rule] into an anonymous function that takes state and returns an int. 
 * requires:
 * - [rule] is an Ast.expr that evaluates to type int when executed. *)
and eval_int rule : (state -> int) = 
  match rule with
  | Int i -> (fun st -> i)
  | Size (loc) -> size_helper loc
  | CardsPlayed () -> (fun st -> cards_played st)
  | CardsDrawn () -> (fun st -> cards_drawn st)
  | CardsTaken () -> (fun st -> cards_taken st)
  | Score p -> score_helper p
  | Turns p -> turns_helper p 
  | Neg e -> (fun st -> ~-1*((eval_int e) st))
  | Add (e1, e2) -> (fun st -> ((eval_int e1) st) + (eval_int e2) st)
  | Mult (e1, e2) -> (fun st -> ((eval_int e1) st) * (eval_int e2) st)
  | HighScore () -> (fun st -> high_score st)
  | _ -> failwith "eval_int"

(* [eval_bool rule] is a state function of a boolean expression. It translates
 * [rule] into an anonymous function that takes a state and returns a bool. 
 * requires:
 * - [rule] is an Ast.expr that evaluates to type bool when executed. *)
and eval_bool rule : (state -> bool) = 
  match rule with
  | Bool b -> (fun st -> b)
  | Eq (e1, e2) -> bin_helper_int e1 e2 (=)
  | DoubleEq (e1, e2) -> card_helper e1 e2 (equal)
  | Neq (e1, e2) -> bin_helper_int e1 e2 (<>)
  | DoubleNeq (e1, e2) -> card_helper e1 e2 (fun x y -> not (equal x y))
  | Gt (e1, e2) -> bin_helper_int e1 e2 (>)
  | Lt (e1, e2) -> bin_helper_int e1 e2 (<)
  | Geq (e1, e2) -> bin_helper_int e1 e2 (>=)
  | Leq (e1, e2) -> bin_helper_int e1 e2 (<=)
  | And (e1, e2) -> bin_helper' e1 e2 (&&)
  | Or (e1, e2) -> bin_helper' e1 e2 (||)
  | Contains (loc, card) -> contains_helper loc card
  | _ -> failwith "eval_bool"

(* [eval_loc rule] is a state function of a location expression. It translates
 * [rule] into an anonymous function that takes a state and returns a location.
 * "t", "n", & "p" are evaluated/desugared here to their corresponding meaning. 
 * requires:
 * - [rule] is an Ast.expr that evaluates to type loc when executed. *)
and eval_loc rule =
  match rule with
  | Location loc -> 
    (match loc with 
    | "t" -> (fun st -> st.curr_player.name)
    | "n" -> (fun st -> st.next_player.name)
    | "p" -> (fun st -> st.last_player.name)
    | _ -> (fun st -> loc))
  | _ -> failwith "eval_loc"

(* [eval_card rule] is an extraction function that pulls a card type out of its
 * Ast Card expression. 
 * requires:
 * - [rule] is a Card. *)
and eval_cards_primitive = function
  | Card c -> c
  | _ -> failwith "eval_cards_primitive"

(* [eval_cards rule] is a state function of a card expression. It translates
 * [rule] into an anonymous function that takes a state and returns a card list. 
 * requires:
 * - [rule] is an Ast.expr that evaluates to type card when executed. *)
and eval_cards rule =
  match rule with
  | Card c -> (fun st -> [c])
  | CardList lst -> (fun st -> List.map eval_cards_primitive lst)
  | TopCard loc -> (topCard_helper loc)
  | _ -> failwith "eval_cards"

(* [eval_player rule] is a state function of a player expression. It translates
 * [rule] into an anonymous function that takes a state and returns a player. 
 * requires:
 * - [rule] is an Ast.expr that evaluates to type player when executed. *)
and eval_player rule =
  match rule with
  | Player p -> 
    (match p with 
    | "t" -> (fun st -> st.curr_player.name)
    | "n" -> (fun st -> st.next_player.name)
    | "p" -> (fun st -> st.last_player.name)
    | _ -> (fun st -> p))
  | _ -> failwith "eval_player"

(* [bin_helper_int e1 e2 op] is a state function of the result of evaluating
 * expressions [e1] and [e2] in a given state with operation [op].
 * requires:
 * - [e1] & [e2] are Ast expressions that represent expressions that evaluate to
        values of type int
 * - [op] is a binary operator. *)  
and bin_helper_int e1 e2 op = 
  let f1 = eval_int e1 in
  let f2 = eval_int e2 in
  fun st -> op (f1 st) (f2 st)

(* [bin_helper' e1 e2 op] is a state function of the result of evaluating
 * expressions [e1] and [e2] in a given state with operation [op].
 * requires:
 * - [e1] & [e2] are Ast expressions that represent expressions that evaluate to
        values of type bool
 * - [op] is a binary operator. *)  
and bin_helper' e1 e2 op =
  let f1 = eval_bool e1 in
  let f2 = eval_bool e2 in
  fun st -> op (f1 st) (f2 st)

(* [card_helper e1 e2 op] is a state function of the result of evaluating
 * expressions [e1] and [e2] in a given state with operation [op].
 * requires:
 * - [e1] & [e2] are Ast expressions that represent expressions that evaluate to
        values of type card
 * - [op] is a binary operator. *)  
and card_helper e1 e2 op =
  let f1 = eval_cards e1 in
  let f2 = eval_cards e2 in
  fun st -> op (f1 st) (f2 st)

(* [topCard_helper e] is the state function of the top card in the location 
 * resulting from evaluation of [e]. 
 * requires:
 * - [e] is an Ast expression that represents an expression that evaluates to a 
 *   location. *)
and topCard_helper e = 
  let f = eval_loc e in
  (fun st -> topCard_func (f st) st)

(* [size_helper e] is the state function of the size/# of cards of the location 
 * resulting from evaluation of [e]. 
 * requires:
 * - [e] is an Ast expression that represents an expression that evaluates to a 
 *   location. *)
and size_helper e = 
  let f = eval_loc e in
  (fun st -> size (f st) st)
  
(* [contains_helper e1 e2] is the state function of a bool that represents 
 * if the location resulting from evaluation of [e1] contains all the cards in
 * the card list resulting from evaluation of [e2] with a given state. 
 * requires:
 * - [e] is an Ast expression that represents an expression that evaluates to a 
 *   location. *)
and contains_helper e1 e2 = 
  let f1 = eval_loc e1 in
  let f2 = eval_cards e2 in
  (fun st -> contains (f1 st) (f2 st) st)

(* [score_helper e] is the score of a player resulting from the evaluation 
 * of [e] given a given state, in a given state. 
 * requires: 
 * - [e] is an Ast expression that represents an expression that evaluates to a
 *   player. *)
and score_helper e =
  let f = eval_player e in
  try
  (fun st -> (get_player st.players (f st)).score)
  with _ -> failwith "score_helper"

(* [turns_helper p] is the number of turns of a player resulting from the
 * evaluation of [p] given a state, in a given state [st]. 
 * requires: 
 * - [p] is an Ast expression that represents an expression that evaluates to a 
 *   player. *)
and turns_helper p = 
  try
  (fun st -> (get_player st.players (eval_player p st)).turns)
  with _ -> failwith "turns_helper"
  
(* [card_to_unicode (r,s)] is the unicode representation of a given card. 
 * requires: 
 * - [r] is a valid rank, [s] is a valid suit.*)
let card_to_unicode (r,s) =
  match s with 
  | "C" -> "[" ^ r ^ "|" ^ "♣" ^ "]"
  | "S" -> "[" ^ r ^ "|" ^ "♠" ^ "]"
  | "H" -> "[" ^ r ^ "|" ^ "♥" ^ "]"
  | "D" -> "[" ^ r ^ "|" ^ "♦" ^ "]"
  | _ -> "[Empty]"
  
let card_lst_to_unicode' cl =
  List.fold_left (fun acc c -> acc ^ card_to_unicode c ^ " ") "" cl

(* [card_to_string c] is the string representaiton of card c 
 * Requires: none *)
let card_to_string' (r,s) = "[" ^ r ^ "|" ^ s ^ "]"

(* [card_lst_to_string cl] is the string representative of card list [cl]
 * Require: cl contains a list of (string * string) tuples *)
let card_lst_to_string' cl =
  List.fold_left (fun acc c -> acc ^ card_to_string' c ^ " ") "" cl

(* [play_eval e1 e2] is the command state function of a Play command. The
 * output function should match an input command with the evaluated state 
 * functions of [e1] and [e2], [e1] representing the cards, [e2] representing
 * the locations. If the input command [cmd] and state [st] match, the output
 * function evaluates to true. 
 * requires: 
 * - [e1] is an Ast expression that reps an expression that evals to a cardlist.
 * - [e2] is an Ast expression that reps an expression that evals to a loc.  *)
let play_eval e1 e2 = 
  let cards = eval_cards e1 in
  let loc = eval_loc e2 in
  fun com st -> 
    match com with
    | Play (c, l) -> let l = if l = "" then st.static_dat.default_play_loc 
                             else l in
                     let new_cards = remove_wildcards (cards st) [] in
                     List.mem c new_cards && (l = (loc st))
    | _ -> false

(* [draw_eval e1] is the command state function of a Draw command. The output
 * function should match an input command with the evaluated state function of
 * [e1], which represents a location. If the input command [cmd] and state [st]
 * match with the command data, the output function evaluates to true, false 
 * otherwise. 
 * requires: 
 * - [e1] is an Ast expression that reps an expression that evals to a loc.*)
let draw_eval e1 = 
  let loc = eval_loc e1 in
  (fun x st -> match x with 
  | (Draw(l)) -> let l = if l = "" then st.static_dat.default_draw_loc 
                         else l in
      ((loc st) = l) || ((loc st) = "*")
  | _ -> false)

(* [take_eval e1 e2] is the command state function of a Take command. The
 * output function should match an input command with the evaluated state 
 * functions of [e1] and [e2], [e1] representing the cards, [e2] representing
 * the locations. If the input command [cmd] and state [st] match, the output
 * function evaluates to true. 
 * requires: 
 * - [e1] is an Ast expression that reps an expression that evals to a cardlist.
 * - [e2] is an Ast expression that reps an expression that evals to a loc. *)
 let take_eval e1 e2 = 
  let cards = eval_cards e1 in
  let loc = eval_loc e2 in
  (fun x st -> match x with 
              | (Take(c, l)) ->
                let l = if l = "" then st.static_dat.default_take_loc 
                        else l in
                ((loc st) = l || (loc st) = "*") && 
                ((List.filter (fun (s1,s2) -> (s1,s2) = (fst c, snd c)) 
                              (cards st)) = [])
              | _ -> false)

(* [shuffle_help e1 e2] is the command state function of a Shuffle command. The
 * output function should match an input command with the evaluated state 
 * functions of [e1] and [e2], [e1] representing the target loc, [e2] 
 * representing the result loc. If the input command [cmd] and state [st] match,
 * the output function evaluates to true. 
 * requires: 
 * - [e1] is an Ast expression that reps an expression that evals to a loc]].
 * - [e2] is an Ast expression that reps an expression that evals to a loc. *)
let shuffle_help e1 e2 =
  let loc1 = eval_loc e1 in
  let loc2 = eval_loc e2 in
  fun c st -> match c with
              | Shuffle (l1, l2) -> (loc1 st) = l1 && (loc2 st) = l2
              | _ -> false

(* [end_eval] is the command state function of an End command. The output 
 * function is always the same, since End has no parameters.*)
let end_eval = 
  (fun x st -> match x with
  | End -> true
  | _ -> false)

(* [eval_cmd e] is a function that takes a Ast expression and matches it to a
 * corresponding command state bool function that matches an input command to 
 * a saved command that is the evaluated form of [e], and returns true if they
 * match in a given state, false otherwise. 
 * requires: 
 * - [e] is an Ast expression that reps a Command. *)
let eval_cmd (e:Ast.expr) : (Command.command -> state -> bool) = 
  match e with
  | Play (e1, e2) -> play_eval e1 e2
  | Draw (e) -> draw_eval e
  | Take (e1, e2) -> take_eval e1 e2
  | End _ -> end_eval 
  | Shuffle (e1, e2) -> shuffle_help e1 e2
  | _ -> failwith "eval_cmd"

(* [eval_wins winlist st] is a list of win boolean functions. 
 * requires:
 * - [winlist] is a list of Ast expressions that eval to expressions of bool.
 * - [st] is a valid state. *)
let eval_wins winlist = 
  let astList = List.map parse_to_ast winlist in
  let f a = match a with
    | (Ast.WinCondition (b)) -> 
    (eval_bool b) 
    | _ -> failwith "a should be WC" in
  List.map f astList 

(* [eval_bools rulelist st] is the bool-command state function dictionary from
 * the parsed rule list of the json. 
 * requires: [rulelist] is a list of Ast expressions representing Rules.*)
let eval_rules rulelist = 
  let f a = match a with
    | (Ast.Rule (b, cmd)) -> (eval b, eval_cmd cmd) 
    | _ -> failwith "a should be R" in
  let astList = List.map parse_to_ast rulelist in
  List.map f astList

(* [eval_score scorelist] is the list of state boolean function - int dict that
 * maps booleans to score values. 
 * requires: 
 * - [scorelist] is a list of Ast expressions representing CardPoints. *)
let eval_score scorelist = 
  let f a = match a with 
    | (Ast.Rule (b, scr)) -> (eval b, eval_int scr) 
    | _ -> failwith "a should be Score" in
  let astlist = List.map parse_to_ast scorelist in
  List.map f astlist

(* ===================================================== *)

(* INIT STATE FUNCTIONS *)

(** [init_wins j] initializes the win conditions from [j], the json made by a 
 * user. It returns a condition -> bool list, representing the win conditions 
 * and the boolean required to meet that condition. 
 * Requires: [j] a YoJson.Basic.Json *)
let init_wins j = 
  let winslist = 
    (j |> member "win_conditions" |> to_list |> List.map to_string) in
  eval_wins winslist
 
(** [init_wins j] initializes the win conditions from [j], the json made by a 
 * user. It returns a (condition -> bool)*location list, representing the rule 
 * and when that rule is in place and the location that rule will take place in.
 * Requires: [j] a YoJson.Basic.Json *)
let init_rules j = 
  let rulelist = 
    (j |> member "rules" |> to_list |> List.map to_string) in
  eval_rules rulelist

(** [init_points j] initializes the card points from [j], the json made by a 
 * user. It returns a (condition -> bool)*integer list, representing the card 
 * point for a specific card in the deck and when that card point is supposed to 
 * be taken into account (based off of the condition). 
 * Requires: [j] a YoJson.Basic.Json *)
let init_points j =
  let pointlist = 
    (j |> member "card_points" |> to_list |> List.map to_string) in
  eval_score pointlist

(** [plyer nme] takes in a string [nme] and initializes and returns a player, 
 * with turns and score initialized to 0 and has_won set to false.  
 * Requires: [nme] is a valid player name string *)
let plyer nme = { name = nme; turns = 0; 
                  score = 0; has_won = false; is_ai = false; }

(** [pl_lst_hlp num_pl lst] takes in an int and a player list and dependent on 
 * the number of players, returns a list of valid formatted players
 * Requires: [num_pl] is an integer
 * [lst] is a valid player list *)
let rec pl_lst_hlp num_pl lst = 
  if num_pl = 0 then 
    lst
  else
    pl_lst_hlp (num_pl - 1) ((plyer ("p" ^ (string_of_int num_pl)))::lst)

let rec check_ais p_lst j =
  match p_lst with
  | [] -> []
  | h::t -> 
    let ai = (j |> member (h.name ^ "_is_ai") |> to_bool) in
    {h with is_ai = ai}::(check_ais t j)

 (* [init_state j] is the starting state of card game represented by json [j] *)
let init_state j =
  let low = String.lowercase_ascii in
  let num_players = (j |> member "players" |> to_int) in
  let hlp = (j |> member "help_message" |> to_string) in
  let intro_msg = (j |> member "intro_message" |> to_string) in
  let win_lst = init_wins j in
  let card_pnts = init_points j in
  let rls = init_rules j in
  let def_ply_loc = (j |> member "default_play_location" |> to_string |> low) in
  let def_drw_loc = (j |> member "default_draw_location" |> to_string |> low) in
  let def_tke_loc = (j |> member "default_take_location" |> to_string |> low) in
  let loc_visibility = set_vis_locs (j |> member "show" |> to_list) [] in
  let static_dt = {
                    win_conditions = win_lst;
                    card_points = card_pnts;
                    rules = rls;
                    loc_show = loc_visibility;
                    help_message = hlp;
                    intro_message = intro_msg;
                    default_play_loc = def_ply_loc;
                    default_draw_loc = def_drw_loc;
                    default_take_loc = def_tke_loc
                  } in
  let player_lst = (pl_lst_hlp num_players []) in
  let player_lst_ai = check_ais player_lst j in
  let locs = (j |> member "locations" 
                |> to_list |> List.map to_string |> List.map low) in
  let c_locations = set_card_locs (j |> member "deal" |> to_list)
                                  (create_empty_card_lst locs)
                                  (create_deck []) in

  {
    players = player_lst_ai;
    last_player = List.hd (List.rev player_lst_ai);
    curr_player = List.hd player_lst_ai;
    next_player = List.hd (List.tl player_lst_ai);
    card_locations = c_locations;
    curr_cards_played = 0;
    curr_cards_drawn = 0;
    curr_cards_taken = 0;
    static_dat = static_dt;
    winners = [];
    last_move = End;
    last_command = End;
    highscore = 0
  }

(* END INIT STATE FUNCTIONS *)

(* ===================================== *)
  
(* HELPER STRING FUNCTIONS *)

(* [num_players st] is the number of players in state [st] *)
let num_players st = List.length st.players

(* [players s] is a simple getter for the list of players in state [s] *)
let players s = s.players

(* [topcard_lst_to_cd c] unwraps the topcard list (which is always a singleton 
 * list) into a single card 
 * requires: c is a singleton tuple list *)
let topcard_lst_to_cd = function
  | [] -> ("","")
  | c::t -> c

(* [card_lst_to_unicode cl] is the given card list transformed into a string
 * list where the suits are represented by their unicode symbols *)
let card_lst_to_unicode cl =
  List.fold_left (fun acc c -> acc ^ card_to_unicode c ^ " ") "" cl

(* [card_to_string c] is the string representaiton of card c 
 * Requires: none *)
let card_to_string (r,s) = "[" ^ r ^ "|" ^ s ^ "]"

(* [card_lst_to_string cl] is the string representative of card list [cl]
 * Require: cl contains a list of (string * string) tuples *)
let card_lst_to_string cl =
  List.fold_left (fun acc c -> acc ^ card_to_string c ^ " ") "" cl 

(* [cardlist_to_hidden_string cl] is the string representation of card list 
 * [cl] with all the cards hidden 
 * Requires: none*)
let cardlist_to_hidden_string cl =
  cl |> List.rev_map (fun (r,s) -> ("X", "X")) |> List.rev |>
  card_lst_to_string

let get_cards_from_loc l st =
  List.find 
    (fun (l',cl) -> String.lowercase_ascii l' = String.lowercase_ascii l)
    st.card_locations |> snd

(* [location_to_string l] is the prettified version of location l 
 * requires: none *)
let location_to_string l = 
  "{ " ^ String.capitalize_ascii l ^ " }"

(* [loc_pile_to_string st l] is the pile representation of a location. Shows
 * the topcard at that location
 * requires: none *)
let loc_pile_to_string st l = 
  let visible = List.assoc l st.static_dat.loc_show in
  if visible then
    let top_card = topCard_func l st |> topcard_lst_to_cd |> 
    card_to_unicode in location_to_string l ^ " [" ^ top_card ^ "]"
  else
    location_to_string l ^ " [[X|X]]"

(* [nonhand_loc l] is true if the given location [l] is not one of the player
 * hands *)
let nonhand_loc l =
  match l with
  | "p1" | "p2" | "p3" | "p4" -> false
  | _ -> true

(* [sort_locations ls] sorts the list of given locations [ls]
 * requires: ls is a string list *)
let sort_locations ls = 
  List.sort (String.compare) ls

(* [locations_to_string st] is the string representation of all the 
 * nonhand locations in state [st] *)
let locations_to_string st =
  let locations = List.rev_map (fun (l,cl) -> l) st.card_locations 
                  |> List.rev |> List.filter (nonhand_loc) |> sort_locations
  in List.fold_left 
      (fun acc l -> acc ^ "   " ^ (loc_pile_to_string st l))
      "[LOCATIONS]: " locations
  

(* [player_status_to_string acc ps] is the status of player ps appended to
 * acc. *)
let player_status_to_string acc ps =
  if ps.has_won then 
    acc ^ "\n" ^  ps.name ^ ": [WON]; \n" 
  else if ps.score >= 0 then
  acc ^ "\n" ^  ps.name ^ ": [PLAYING] Score: " ^ string_of_int ps.score ^ "\n"
  else 
    acc ^ "\n" ^  ps.name ^ ": [PLAYING]"

(* [player_status s] is the current status of all players in the game in 
 * state [s]. *)
let player_status s = 
  let players = s.players in
  List.fold_left player_status_to_string "" players

 (* [turns s] is the number of turns each player has taken in state [s] *)
let turns s = 
  List.fold_left (fun acc p -> acc ^ p.name ^ ": " ^ (string_of_int p.turns) 
    ^ " ") "" s.players  

(* [hand s p] is the hand of player ["p"] in card game state [s] *)
let hand s p = List.assoc p.name s.card_locations

(* [hand_from_name s p] is the hand of player with name [p] in state [s] *)
let hand_from_name s p = List.assoc p s.card_locations

(* [hidden_hand_from_name s p] is the hand of player with name [p] in state
 * [s] where all the cards are hidden *)
let hidden_hand_from_name s p = 
  (hand_from_name s p) |> cardlist_to_hidden_string

(* [curr_player_hand_to_string s] is the hand of the current player with name 
 * [p] in state [s] *)
let curr_player_hand_to_string s =
  let curr_player_name = s.curr_player.name in
  let curr_hand = hand s s.curr_player in
  curr_player_name ^ ": " ^ card_lst_to_unicode curr_hand

(* [get_player_names s] is the list of players in the current game *)
let get_player_names s = 
  List.map (fun p -> p.name) s.players

(* [build_player_hands s] is the players names coupled with their
 * hands in current state [s]  *)
let build_player_hands s ps =
  List.map (fun p -> let hand = hand s p in (p.name, hand)) ps

(* [hide_non_curr_hand s] is the list of hands with everything but the 
 * current hand hidden *)
let hide_non_curr_hand s hl =
  List.map (fun (p,cl) -> 
    if p = s.curr_player.name then 
      (p, card_lst_to_unicode cl)
    else
      (p, cardlist_to_hidden_string cl)) hl

(** [all_hands_to string s] is the string output of the hands of all the 
  * players in the current state [s]. Hides any that are not the current 
  * player *)
let all_hands_to_string s =
  let player_hands = build_player_hands s s.players in
  hide_non_curr_hand s player_hands
  |> List.fold_left (fun acc (p,h) -> acc ^ "\n" ^ p ^ " : " ^ h) ""

(* [play_location s] is the place where the player can play their card *)
let play_location s = s.static_dat.default_play_loc |> location_to_string

(* [draw_location s] is the place where the player can draw a card *)
let draw_location s = s.static_dat.default_draw_loc |> location_to_string

(* [take_location s] is the place where the player can take a card *)
let take_location s = 
  let take_loc = s.static_dat.default_take_loc in
  let cards = List.assoc (take_loc) s.card_locations |> card_lst_to_string in
  (location_to_string take_loc) ^ " Cards: " ^ cards

(* [card_locations s] is the list of locations that contain cards. This 
 * includes things like the central play area, player hands, and trash piles *)
let card_locations s =
  let cl = s.card_locations in 
  List.filter 
  (fun cardloc -> List.length (snd cardloc) <> 0) cl 
  |> List.map (fun (l, c) -> l) |>
  List.fold_left (fun acc l -> acc ^ "\n- " ^ l) "Card locations:" 

(* [turn_message s] is the message that outputs at the beginning of each 
 * players' turn *)
let turn_message s =
  "It's " ^ s.curr_player.name ^ "'s turn."

(** [help_message s] is the message that displays when the player inputs the   
  * Help command *)
let help_message s =
  s.static_dat.help_message

(** [intro_message s] is the message that displays when the player inputs the   
  * Help command *)
let intro_message s =
  s.static_dat.intro_message
 
(* [last_moves s] is the last move taken in state [s] *)
let last_move s =
  let player = s.curr_player.name in
  match s.last_move with
  | Play (c, l) -> "Last Move: " ^ player ^ ": Played " ^ (card_to_unicode c)
  | Draw (l) -> if l = "" then
                  "Last Move: " ^ player ^ ": Drew from " 
                         ^ (location_to_string s.static_dat.default_draw_loc)
                else
                  "Last Move: " ^ player ^ ": Drew from " 
                   ^ (location_to_string l)
  | Take (c,l) -> if l = "" then
                    "Last Move: " ^ player ^ ": Took " ^ (card_to_unicode c) 
                    ^ " from " ^ 
                    (location_to_string s.static_dat.default_take_loc)
                  else
                    "Last Move: " ^ player ^ ": Took " ^ (card_to_unicode c) ^ 
                    " from " ^ (location_to_string l)
  | End -> "Last Move:"
  | _ -> "Error Last Move"

(** [last_command s] is the command of state [st] *)
let last_command s =
  s.last_command 

let command_to_string cmd = 
  match cmd with
  | End -> "End"
  | Play (c, l) -> "Play " ^ card_to_unicode c
  | Draw (_) -> "Draw"
  | Take (c, l) -> "Take " ^ card_to_unicode c
  | _ -> ""

(** [last_cmd_to_str s] is the last command of state [s] represented as a
  * string *)
let last_cmd_to_str s =
  match s.last_command with 
  | Play (c, l) -> "You played " ^ card_to_unicode c
  | Draw (l) -> if l = "" then 
                    "You drew from " 
                    ^ location_to_string (s.static_dat.default_draw_loc)
                  else
                  "You drew from " ^ location_to_string l
  | Take (c, l) -> if l = "" then 
                    "You took " ^ card_to_unicode c ^ " from " 
                    ^ location_to_string (s.static_dat.default_take_loc)
                  else
                  "You took " ^ card_to_unicode c ^ " from " 
                  ^ location_to_string l
  | Shuffle (l1, l2) -> "[SHUFFLE] You shuffled " ^ location_to_string l1 
                        ^ "and put all its cards into " ^ location_to_string l2
  | End -> ""
  | Hand -> "[HAND] " ^ curr_player_hand_to_string s
  | Look -> "[LOOK] " ^ card_locations s
  | Turns -> "[TURNS] " ^ turns s
  | Status -> "[STATUS] " ^ player_status s
  | Help -> "[HELP] " ^ help_message s 
            ^ "\nTo play a card: type \"play Rank|Suit\" ex: \"play K|S\"  "
            ^ "\nTo draw from a location: type \"draw l\" ex: \"draw deck\""
            ^ "\nTo take a card from a location: type \"take Rank|Suit loc\""
            ^ "\nRanks = 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A"
            ^ "\nSuits = D : ♦, C : ♣, H : ♥, S : ♠"
  | Quit -> "Qutting..."
  | Err (str) -> "Error: " ^ str

(* END HELPER STRING FUNCTIONS *)
(* ========================================================  *)

(* [winner s] is the winner of the card game at state [s]. If there has been
 * no winner, then this function returns the empty string 
 * requires: [s] is a valid state *)
let winner s =
  match s.winners with 
  | [] -> ""
  | lst -> List.hd (List.rev lst) 
  (* this assumes that the winner list is populated according to the most recent
  winner being first and the "best" winner being last in the list. thus: rev. *)

(** [winners_to_str s] is the string of who has won in state [s]. If no one has 
 * currently won the game, returns "No one has won yet"
 * requires: [s] is a valid state *)
let winners_to_str s =
  let winner = winner s in
  if winner = "" then
    "No one has won yet"
  else 
    "[WINNER] " ^ winner ^ " has won!"

(** [win_checker s] returns true if some player in the game has the necessary
 * conditions to meet a win condition. If a player does, this function returns
 * true. If no player has the necessary win conditions, returns false. 
 * requires: [s] is a valid state *)
let win_checker s =
  let bool_list = s.static_dat.win_conditions in
  let app e = e s in
  let app_list = List.filter app bool_list in
  app_list <> []

(** [win_update st] updates that has_won field of the state [st], if some player
 * has met the conditions to meet a win condition. If so, updates the state 
 * has_won field and returns the updated state. If not, just returns [st]
 * requires: [st] is a valid state *)
let win_update st : state = 
  if win_checker st then 
    let cp = st.curr_player in
    let cp = {cp with has_won = true} in
    let winners' = (cp.name) :: (st.winners) in
    {st with curr_player = cp; winners = winners'}
  else st

(* [move_card st card from to] returns the card_locations resulting from moving 
 * card [card] from location [from] to location [to_d] in state [st] *)  
let move_card st card from to_d = 
  let cards_from = List.assoc from st.card_locations in
  let removed_cards = remove_c_from_h card cards_from in
  let new_cards = card::(List.assoc to_d st.card_locations) in
  let rem = List.remove_assoc in
  let new_card_locs = (st.card_locations |> rem from |> rem to_d) in
  (to_d, new_cards)::(from, removed_cards)::(new_card_locs)

(** [play_helper_new st card loc cmd] plays [card] into [loc] in the state [st].
 * It removes the card from the current players hand and inserts it into the 
 * card list found at location [loc]. Raise an error if any of this is invalid.
 * requires: [st] is a valid state 
 * [card] is a valid card 
 * [loc] is a valid location 
 * [cmd] is a valid command *) 
let play_helper_new st card loc cmd =
  try
    if List.mem (card) (hand st st.curr_player) &&  List.exists 
    (fun (nme, lst) -> ((String.lowercase_ascii nme) = String.lowercase_ascii loc)) 
    (st.card_locations) then 
    let new_locs = move_card st card (st.curr_player.name) loc in
    {
      st with
      curr_cards_played = st.curr_cards_played + 1;
      card_locations = new_locs;
      last_move = cmd;
      last_command = cmd;
      curr_player = {st.curr_player with has_won = (win_checker st)};
    }
    else {st with last_command = 
    Command.Err("Either card is not in players hand or invalid location")}
  with
  | _ -> raise (MoveError ("Invalid play move"))

(** [draw_helper_new st card loc cmd] draws the top card from [loc] in [st].
 * It removes the card from the locations card list and inserts it into the 
 * current player's hand. Raise an error if any of this is invalid.
 * requires: [st] is a valid state 
 * [loc] is a valid location 
 * [cmd] is a valid command *) 
let draw_helper_new st loc cmd =
  try
  if List.exists 
  (fun (nme, lst) -> ((String.lowercase_ascii nme) = String.lowercase_ascii loc)) 
  (st.card_locations) then 
    let card = List.hd (List.assoc loc st.card_locations) in
    let new_locs = move_card st card loc st.curr_player.name in
    {
      st with
      card_locations = new_locs;
      last_move = cmd;
      last_command = cmd;
      curr_cards_drawn = st.curr_cards_drawn + 1;
      curr_player = {st.curr_player with has_won = (win_checker st)};
    }
    else {st with last_command = Command.Err("Invalid draw location")}
  with _ -> raise (MoveError ("Invalid draw"))

(** [take_helper_new st card loc cmd] takes [card] from [loc] in the state [st].
 * It places the card into the current players hand and removes it from the 
 * card list found at location [loc]. Raise an error if any of this is invalid.
 * requires: [st] is a valid state 
 * [card] is a valid card 
 * [loc] is a valid location 
 * [cmd] is a valid command *) 
let take_helper_new st card loc cmd = 
  try
  if List.exists 
  (fun (nme, lst) -> ((String.lowercase_ascii nme) = String.lowercase_ascii loc)) 
  (st.card_locations) && List.mem (card) (get_cards_from_loc loc st) && 
  not (List.mem (card) (get_cards_from_loc st.curr_player.name st)) then 
    let new_locs = move_card st card loc st.curr_player.name in
    {
      st with
      card_locations = new_locs;
      last_move = cmd;
      last_command = cmd;
      curr_cards_taken = st.curr_cards_taken + 1;
      curr_player = {st.curr_player with has_won = (win_checker st)};
    }
    else {st with last_command = Command.Err("No card at that location")}
  with _ -> raise (MoveError ("Invalid take"))

(* [cycle_player st] is the next player in state [st] *)
let cycle_player st = 
  if (List.length st.players) = 2 then st.curr_player else
  let index = (lst_index st.next_player 0 st.players) + 1 in
  print_endline "cycle: ";
  print_int index; print_endline st.next_player.name;
  List.nth st.players (index mod (List.length st.players))

(* [update_turns st p] is the updated turns for player [p]. Increments their
 * turn count by one. *)
let update_turns st p =
  print_string "turns";
  let p = try List.find (fun p' -> p' = p) st.players 
          with Not_found -> p
  in
  {p with turns = p.turns + 1}

(** [end_helper st c] is state after a player has ended their turn. This 
  * will cycle the players to the next player. 
  * requires: [st] is a valid state *)
let end_helper st c = 
  print_string "end";
  let st' =
  {st with last_command = c; 
  last_move = c; 
  curr_cards_played = 0; 
  curr_cards_drawn = 0;
  curr_cards_taken = 0;
  last_player = update_turns st st.curr_player;
  curr_player = st.next_player;
  next_player = cycle_player st
  } in
  print_string st.next_player.name;
  { st' with
    players = List.map (fun p -> if p.name = st'.last_player.name then 
    update_turns st' p else p) st'.players
  }

(** [is_valid in_cmd st] returns true if the input command can currently be 
  * inputted into the REPL at the time. Returns false otherwise.  
  * requires: [in_cmd] is a valid Command.command
  [st] is a valid state *)
let is_valid in_cmd st = 
  match in_cmd with
  | Play _ | Draw _ | Take _ | End | Shuffle _ -> 
    let rule_lst = st.static_dat.rules in
    let f (rl, cmd_fun) = 
      (rl st, cmd_fun in_cmd st) in
    let mapped = List.map f rule_lst in
    let g (k, v) = k && v in
    let filtered = List.filter g mapped in
    filtered <> []
  | _ -> true

(* [shuffle_helper_ex st l1 l2] is the resutling state from shuffling all the
 * cards in location [l1] in [st] and moving those cards to location [l2] *)
let shuffle_helper_ex st l1 l2 c = 
  let cards1 = List.assoc l1 (st.card_locations) in
  let cards2 = List.assoc l2 (st.card_locations) in
  let (new_l1, new_l2) = shuffle cards1 (List.length cards1) cards2 in
  let rem = List.remove_assoc in
  let new_card_locs = (st.card_locations |> rem l1 |> rem l2) in
  {
    st with
    last_command = c;
    card_locations = (l1, new_l2)::(l2, new_l1)::new_card_locs
  }

(* [valid_move_exists st] returns true if a valid move can be made in [st]
 * requires: st is a valid state *)
let valid_move_exists (st:state) = 
  let apply (b, c) = b st in
  let l = List.map (apply) (st.static_dat.rules)
  |> List.filter (fun x -> x = true) in
  l <> []

(* [update_plyer_lst p_lst p] is the list of players resulting from replacing
 * the player in [p_lst] with the same name as player [p] with [p] *)
 let update_plyer_lst p_lst p =
  let p_name = p.name in
  let new_lst = List.filter (fun pl -> pl.name <> p_name) p_lst in
  p::new_lst

(* [update_score s] is state resulting from updating the score of the current 
 * player in [s] *)
let update_score s =
  let new_player = {s.curr_player with score = score s s.curr_player.name} in
  let f pnts p = if p.score > pnts then p.score else pnts in
  let new_highscore = List.fold_left f 0 s.players in
  let new_sc = if (new_player.score > new_highscore) then new_player.score
               else new_highscore in
  (* let new_p_lst = update_plyer_lst s.players new_player in *)
  let st' = {
              s with 
              curr_player = new_player;
              highscore = new_sc;
            } in  
  {
    st' with
    players = (List.map 
               (fun p -> if p.name = st'.curr_player.name then st'.curr_player
                         else p)
               st'.players)
  }

(* [execute c s s'] is the resulting state [s'] after command [c] has been
 * executed in state [s] 
 * requires: [st] is a valid state *)
let execute (c : command) st =
  let stc = st.static_dat in
  let c = if valid_move_exists st then c else
    Err ("No possible action.") in
  let c = if is_valid c st then c else
  Err ("Not valid command.") in
  let newst = 
    try 
      match c with 
      (*actions*)
      | Play (card, "") -> play_helper_new st card stc.default_play_loc c
      | Play (card, loc) -> play_helper_new st card loc c
      | Draw ("") -> draw_helper_new st stc.default_draw_loc c
      | Draw (loc) -> draw_helper_new st loc c
      | Take (card, "") -> take_helper_new st card stc.default_take_loc c
      | Take (card, loc) -> take_helper_new st card loc c
      | Shuffle (l1, l2) -> shuffle_helper_ex st l1 l2 c
      (*observers*)
      | End -> end_helper st c
      | Hand -> {st with last_command = c}
      | Look -> {st with last_command = c}
      | Turns -> {st with last_command = c}
      | Status -> {st with last_command = c}
      | Help -> { st with last_command = c }
      | Err (str) -> {st with last_command = c}
      | Quit -> {st with last_command = c}
    with MoveError msg -> {st with last_command = Command.Err (msg)}
    in 
  let newst' = update_score newst in
  win_update newst'


(* [compute_valid_draw st] is a list of a valid draw command from the 
 * default draw location, if drawing from the default location is invalid, then
 * is the empty list *)
let compute_valid_draw st = 
  if (is_valid (Draw (st.static_dat.default_draw_loc)) st) then 
    [Draw (st.static_dat.default_draw_loc)]
  else []

(* [compute_valid_take st] is a list of valid take commands relative to the 
 * current players hand in state [st] *)
let rec compute_valid_take st =
  let dflt = st.static_dat.default_take_loc in 
  let rec f hand = 
    match hand with
    | [] -> []
    | h::t -> if is_valid (Take (h, dflt)) st then (Take (h, dflt))::(f t)
              else f t
    in
  f (hand st st.curr_player)

(* [compute_valid_take st] is a list of valid play commands relative to the 
 * current players hand in state [st] *)
let compute_valid_plays st =
  let dflt = st.static_dat.default_play_loc in 
  let rec f hand = 
    match hand with
    | [] -> []
    | h::t -> if is_valid (Play (h, dflt)) st then (Play (h, dflt))::(f t)
              else f t
    in
  f (hand st st.curr_player)


let compute_valid_moves st =
  (compute_valid_draw st)@(compute_valid_take st)@(compute_valid_plays st)

(* returns true if move is valid in state [st] *)
let move_is_valid st move = 
  let equal valid_move =
    match valid_move, move with 
    | Play ((rnk, st),_), Play ((rnk',st'),_)-> rnk = rnk' && st = st'
    | Take ((rnk, st),_), Take ((rnk',st'),_)-> rnk = rnk' && st = st'
    | Draw (_), Draw (_) -> true
    | End, End -> true
    | _ -> false
  in
  List.exists equal (compute_valid_moves st)


(* [compute_max_score mves st] is an association list of the moves in [mves]
 * with their associated scores, if executed, in state [st] *)
let rec compute_scores moves st =
  match moves with
  | [] -> []
  | h::t ->
    let new_state = execute h st in
    let new_score = (update_score new_state).curr_player.score in
    (h, new_score)::(compute_scores t st)



let compute_max_score mves st =
  let pairs = compute_scores mves st in
  let max = List.hd pairs in
  let f (max_move, max_score) (move, score) = if score >= max_score then
                                                 (move, score)
                                              else (max_move, max_score) in
  let max_move = List.fold_left f max pairs in
  if snd max_move = st.curr_player.score then End
  else fst max_move

let is_ai_helper st = st.curr_player.is_ai

let curr_player_score st = st.curr_player.score

let last_player_score st = st.last_player.score