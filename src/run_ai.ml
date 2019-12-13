(* REPL STRINGS *)
open State
open Command
open Yojson.Basic.Util 
open Strategy

(** [load_strategy f] loads json file from [f] into a stategy *)
let load_strategy f = failwith "Unimplemented"

(** [save_stategies s1 s2] writes strategies [s1] and [s2] to json files *)
let save_stategies s1 s2 = failwith "Unimplemented"

(** [save_winner w] writes winner [w] to file *)
let save_winner w = ()


(** [play_ai st strat1 strat2 turn] is the main loop for running the stategy
 * [strat1] against the strategy [strat2] where [turn] is a boolean indicating
 * which strategy to run in the immediate move
 * Requires: [st] is either an initial state or a state after a command 
 * has been executed *)
let rec play_ai (st:state) (strat1:strategy) (strat2:strategy) (turn:bool) =
  strat = if turn then strat1 else strat2 in
  (* obtain vec *)
  let vec = eval_strat strat (hash_state st) in
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
  let num_turns = st.curr_cards_played + 
                  st.curr_cards_drawn + 
                  st.curr_cards_taken in
  let move = 
    if (idx+1) = 106 || num_turns > 3 then End
    else if (idx+1) = 105 then Draw (st.static_dat.default_draw_loc)
    else
      let card = card_from_int idx in
      if (idx+1) <= 52 then Play (card, st.static_dat.default_play_loc)
      else Take (card, st.static_dat.default_take_loc)
    in
  let st' = execute move st
  (* need to check if there's a winner, see if move is invalid, update turn val *)
  if (winner st' <> "") then (save_winner winner st')
  else 
    match last_command st' with
    | Err _ -> if turn then "p2" else "p1"
    | End _ -> play_ai st' strat1 strat2 (not turn)
    | _ -> play_ai st' strat1 strat2 turn
  


(** Helper: Loads json from [file_name] into a json type *)
let load_json file_name =
  Yojson.Basic.from_file file_name

(* [play_game f] plays the game in card game json file f *)
let play_game f =
  (* split f into respective file names *)
  let st_lst = String.split_on_char ";" f in
  let st = init_state (load_json (List.hd st_lst)) in
  let strat1 = load_strategy (List.nth st_list 1) in
  let strat2 = load_strategy (List.nth st_list 2) in
  repl st strat1 strat2 true
    

(* [main ()] starts the REPL for the card game engine *)
let main () =
	match read_line () with
	| exception End_of_file -> ()
	| file_names -> play_game file_names

let () = main ()
