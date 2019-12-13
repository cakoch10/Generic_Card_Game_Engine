(* REPL STRINGS *)
open State
open Command
open Yojson.Basic.Util 
open Strategy

(** [load_strategy j] parses json [j] into a strategy object *)
let load_strategy j =
  List.map (fun (s, json) -> 
    (int_of_string s, json |> to_list |> List.map to_float)
  ) (to_assoc j)


(** [save_stategies s1 s2] writes strategies [s1] and [s2] to json files *)
let save_stategies s1 s2 = failwith "Unimplemented"

let json_from_strat lst =
  `Assoc (List.map (fun (i, vec) ->
    (string_of_int i, `List (List.map (fun v -> `Float v) vec))
  ) lst)


(** [save_winner w] writes winner [w] to file *)
let save_winner w strat =
  Yojson.Basic.to_file w (json_from_strat strat)

(** [update_strat strat1 strat2 hash vec turn] is a helper function which 
 *  updates strat1 or strat2 depending on turn with the action (hash, vec) *)
let update_strat strat1 strat2 hash vec turn =
  let f str = if List.mem (hash, vec) str then str
              else (hash, vec)::str in
  if turn then (f strat1),strat2 else strat1,(f strat2)

(** [init n f] is a tail recursive implementaiton of List.init (available after
 *  4.06.0 which returns the list [f 0;...; f n-1] *)
let init n f =
  let rec init' acc i n f =
    if i >= n then acc
    else init' ((f i)::acc) (i+1) n f
  in List.rev (init' [] 0 n f) 

(** [play_ai st strat1 strat2 turn] is the main loop for running the stategy
 * [strat1] against the strategy [strat2] where [turn] is a boolean indicating
 * which strategy to run in the immediate move
 * Requires: [st] is either an initial state or a state after a command 
 * has been executed *)
let rec play_ai (st:state) (strat1:strategy) (strat2:strategy) (turn:bool) =
  let strat = if turn then strat1 else strat2 in
  let hash = hash_state st in
  (* obtain vec *)
  let vec = 
    try eval_strat (hash_state st) strat 
    with e ->
      (* need to update strategy and vec *)
      let valids = compute_valid_moves st in
      let n = List.length valids in
      if n = 0 then 
        init 106 (fun i -> if i = 105 then 1.0 else 0.0)
      else
        let valid_ints = ints_from_moves valids in
        let prob = 1.0 /. (float_of_int n) in
        let f i =
          if List.mem i valid_ints then prob else 0.0
        in
        init 106 f
    in
  (* need to randomly sample according to strat vector *)
  let i = Random.float 1.0 in
  (* want to find j such that *)
  (* strat[0]+..+strat[j] <= i < strat[0]+..+strat[j]+strat[j+1] *)
  let fold_helper (acc, trigger, j) p =
    if (acc <= i && i <= acc+.p) || trigger then (acc, true, j)
    else (acc+.p, false, j+1) in
  let _,_,idx = List.fold_left fold_helper (0.0, false, 0) vec in
  (* want to decode idx as a move *)
  (* need to write idx = 4j - k where k encodes suit and j encodes rank *)
  let num_turns = cards_played st +
                  cards_drawn st +
                  cards_taken st in
  let move = 
    if (idx+1) = 106 || num_turns > 3 then End
    else if (idx+1) = 105 then Draw (default_draw_l st)
    else
      let card = card_from_int idx in
      if (idx+1) <= 52 then Play (card, default_play_l st)
      else Take (card, default_take_l st)
    in
  let st' = execute move st in
  let strat1, strat2 = update_strat strat1 strat2 hash vec turn in
  (* need to check if there's a winner, see if move is invalid, update turn val *)
  if (winner st' <> "") then
    if "p1" = winner st' then save_winner "../Strategies/1.json" strat1
    else save_winner "../Strategies/2.json" strat2
  else 
    match last_command st' with
    | Err _ -> if turn then 
                save_winner "../Strategies/2.json" strat 
              else save_winner "../Strategies/1.json" strat
    | End _ -> play_ai st' strat1 strat2 (not turn)
    | _ -> play_ai st' strat1 strat2 turn
  


(** Helper: Loads json from [file_name] into a json type *)
let load_json file_name =
  Yojson.Basic.from_file file_name

(* [play_game f] plays the game in card game json file f *)
let play_game f =
  (* split f into respective file names *)
  let st_lst = String.split_on_char ';' f in
  let st = init_state (load_json (List.hd st_lst)) in
  let strat1 = load_strategy (load_json (List.nth st_lst 1)) in
  let strat2 = load_strategy (load_json (List.nth st_lst 2)) in
  play_ai st strat1 strat2 true
    

(* [main ()] starts the REPL for the card game engine *)
let main () =
	match read_line () with
	| exception End_of_file -> ()
	| file_names -> play_game file_names

let () = main ()
