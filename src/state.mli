(* [player] represents the players in a card game. This will hold 
 * information about their hand, their current score and whether they have "won"
 * already *)
type player

(* [card] represents the cards from a standard 54-card deck - 52 if 
 * not including jokers. This will consist of a tuple holding the rank and the 
 * suit *)
type card = string * string [@@deriving sexp, compare, equal, hash]

(* [location] represents the possible locations a card can be
in during a card game *)
type location

(* [state] is a type representing the state of a card game. *)
type state [@@deriving sexp, compare, equal, hash]

val hash_state : state -> int

(* (* [win_cond s] is the win condition of the current game whose state is 
 * represented by s. This will depend on the card game configuration *)
val win_condition : state -> string *)

(* [init_state g] is the starting state of card game [g]. It represents the 
state the game is in after accepting *)
val init_state : Yojson.Basic.json -> state

val size : Ast.location -> state -> int

val contains : Ast.location -> Ast.card list -> state -> bool

val cards_played : state -> int

(* [player_status s] is the current status of all players in the game in 
 * state [s]. *)
val player_status : state -> string

(* [turns s] is the number of turns each player has taken in state [s] *)
val turns : state -> string

(** [all_hands_to string s] is the string output of the hands of all the 
  * players in the current state [s]. Hides any that are not the current 
  * player *)
val all_hands_to_string : state -> string

(* 
(* [play_locations s] is the list of locations that contain cards. This 
 * includes things like the play area, player hands, and discard piles *)
val play_locations : state -> string  *)

(* [card_locations s] is the list of locations that contain cards. This 
 * includes things like the central play area, player hands, and trash piles *)
val card_locations : state -> string

val play_eval : Ast.expr -> Ast.expr -> Command.command -> state -> bool

val eval : Ast.expr -> state -> bool

val eval_cmd : Ast.expr -> Command.command -> state -> bool

val eval_rules : string list -> ((state -> bool) * (Command.command -> state -> bool)) list

val eval_wins : string list -> (state -> bool) list

(* [turn_message s] is the message that outputs at the beginning of each 
 * players' turn *)
val turn_message : state -> string

(* [help_message s] is the message that outputs whenever the player executes a
 * help command in state [s]. This will change depending on the card game file 
 *  requires: none *)
val help_message : state -> string

(* [intro_message s] is the message that outputs above the game board. This 
 * depends on the card game file 
 * - requires: st.static_dat.intro_message has an intro message *)
val intro_message : state -> string

(* [last_cmd_to_str s] is the message that will output depending on the last
 * command executed in state [s]. 
 * - requires: none *)
val last_cmd_to_str : state -> string

(* [last_moves s] is the last move taken in state [s]. This is a message 
 * that depends on the move.   *)
val last_move : state -> string

val num_players : state -> int

val score: state -> Ast.player -> int

val locations_to_string: state -> string

val curr_player_hand_to_string : state -> string

val card_lst_to_string : card list -> string

val hand_from_name : state -> string -> card list

val last_command : state -> Command.command

(* [winner s] is the winner of the card game at state [s] if there has been
 * no winner, then this function returns the empty string *)
val winner : state -> string

val winners_to_str : state -> string

(* [execute c s s'] is the resulting state [s'] after command [c] has been
 * executed in state [s] *)
val execute : Command.command -> state -> state

val parse_to_ast : string -> Ast.expr

(* [compute_valid_moves st] is a list of all the valid moves the current player
 * in state [st] can make *)
 val compute_valid_moves : state -> Command.command list


 (* [compute_max_score mves st] is the move in [mves] that will maximize the 
 * current players score according to state [st] unless all moves leave the
 * current score unchanged in which case the resulting move is END.
 * requires:
 * - [mves] is nonempty *)
 val compute_max_score : Command.command list -> state -> Command.command

(* [command_to_string c] is the string representation of command [c] *)
 val command_to_string : Command.command -> string

(** [is_ai_helper s] is true iff the current player is an AI *)
 val is_ai_helper : state -> bool 