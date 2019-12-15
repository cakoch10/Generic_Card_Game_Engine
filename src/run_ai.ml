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

(** [json_from_strat lst] parses the assoc list [lst] into a json object *)
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

(** [update_hash strat1 strat2 hash vec turn] updates strat1 or strat2 depending
 *  on turn with (hash,vec) replacing (hash, v) in the list *)
let update_hash strat1 strat2 hash vec turn =
  let f (h, v) = if h = hash then (h,vec) else (h,v) in
  if turn then (List.map f strat1),strat2 else strat1,(List.map f strat2) 

(** [init n f] is a tail recursive implementaiton of List.init (available after
 *  4.06.0 which returns the list [f 0;...; f n-1] *)
let init n f =
  let rec init' acc i n f =
    if i >= n then acc
    else init' ((f i)::acc) (i+1) n f
  in List.rev (init' [] 0 n f) 

(* [get_new_vec valids] computes a prob vector from the list of valid moves 
 * [valids] such that the probability is uniform over valid moves *)
let get_new_vec valids =
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

(** [renormalize_vec vec idx] takes a vector and zeroes out idx while 
 *  redistributing the weight of the probability val at idx across the other 
 *  nonzero entries *)
let renormalize_vec vec idx =
  let supp_size = 
    (List.fold_left (fun a b -> if b <> 0.0 then a+1 else a) 0 vec) - 1 in
  (* assume that a prob vec cannot have some move with prob = 1 *)
  let prob_val = List.nth vec idx in
  let renormal_factor = prob_val /. (float_of_int supp_size) in
  List.mapi (fun i p -> 
    if (p <> 0.0 && i <> idx) then p+.renormal_factor else 0.0
  ) vec

let log_last_command st =
  let str_st = last_cmd_to_str st in
  let oc = open_out_gen [Open_append; Open_creat] 0o666 "log.txt" in
  Printf.fprintf oc "%s\n" str_st;
  let loc_st = locations_to_string st in
  let mov_st = last_move st in
  let hand_st = curr_player_hand_to_string st in
  Printf.fprintf oc "%s\n" loc_st;
  Printf.fprintf oc "%s\n" mov_st;
  Printf.fprintf oc "%s\n" hand_st;
  let hash_st = string_of_int (hash_state st) in
  Printf.fprintf oc "%s\n" hash_st;
  close_out oc

(** [play_ai st strat1 strat2 turn] is the main loop for running the stategy
 * [strat1] against the strategy [strat2] where [turn] is a boolean indicating
 * which strategy to run in the immediate move
 * Requires: [st] is either an initial state or a state after a command 
 * has been executed *)
let rec play_ai (st:state)
                (strat1:strategy)
                (strat2:strategy)
                (turn:bool) 
                (rnd:int) =
  let _ = log_last_command st in
  let strat = if turn then strat1 else strat2 in
  let hash = hash_state st in
  (* obtain vec *)
  let vec = 
    try eval_strat (hash_state st) strat 
    with e ->
      (* need to update strategy and vec *)
      let valids = compute_valid_moves st in
      get_new_vec valids
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
    if "p1" = winner st' then save_winner "../Data/strategies/0.json" strat1
    else save_winner "../Data/strategies/1.json" strat2
  else if rnd > 50 then
    if (curr_player_score st) > (last_player_score st) then
      if turn then save_winner "../Data/strategies/0.json" strat1
      else save_winner "../Data/strategies/1.json" strat2
    else
      if turn then save_winner "../Data/strategies/1.json" strat2
      else save_winner "../Data/strategies/0.json" strat1
  else
    match last_command st' with
    | Err _ -> 
      let new_vec = renormalize_vec vec idx in
      let strat1,strat2 = update_hash strat1 strat2 hash new_vec turn in
      play_ai st' strat1 strat2 (not turn) (rnd+1)
    (* | Err _ -> if turn then 
                save_winner "../Data/strategies/1.json" strat 
              else save_winner "../Data/strategies/0.json" strat *)
    | End -> play_ai st' strat1 strat2 (not turn) (rnd+1)
    | _ -> play_ai st' strat1 strat2 turn (rnd+1)
  
(* 

../games/crazy8_ai.json;../Data/Gen1/10.json;../Data/Gen1/11.json
../../games/crazy8_ai.json;../../Data/Gen1/10.json;../../Data/Gen1/11.json

*)


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
  play_ai st strat1 strat2 true 0
    

(* [main ()] starts the REPL for the card game engine *)
let main () =
	match read_line () with
	| exception End_of_file -> ()
	| file_names -> play_game file_names

let () = main ()
