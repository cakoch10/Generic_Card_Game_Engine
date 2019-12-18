open State
open Command
open Strategy
open Yojson.Basic.Util

(* ../games/crazy8_v_ai.json;../Data/Gen2/0.json *)

(* REPL STRINGS *)

let new_screen = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

let double_line =
  "============================================================================"
let single_line =
  "----------------------------------------------------------------------------"

let intro = 
   "\n=======================================================================\n"
  ^"                         CARD GAME ENGINE:                               \n"
  ^"           Designed by Caleb K. Justin K. Raymone R. and Wes T.          \n"
  ^"                 AI designed by Caleb K. and Justin K                    \n"
  ^"\n=======================================================================\n"

let start_msg = "\nPlease enter the name of the card game configuration file\n"
^ "you want to load and the AI strategy, e.g. \"config.json;/strat/s.json\".\n"

let available_commands = 
     "[COMMANDS] [ ] = required, ( ) = optional\n"
   ^ "ACTIONS: Play [card] (loc) | Draw (loc) | Take [card] (loc) | End\n"
   ^ "MISC: Hand | Look | Turns | Status | Help | Quit "


(* END OF REPL STRINGS *)

(** [load_strategy j] parses json [j] into a strategy object *)
let load_strategy j =
  List.map (fun (s, json) -> 
    (int_of_string s, json |> to_list |> List.map to_float)
  ) (to_assoc j)

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

(* [decodes_index st i] returns the move encoded by integer i in state [st] *)
let decode_index st idx = 
  if (idx+1) = 106 then End
  else if (idx+1) = 105 then Draw (default_draw_l st)
  else
    let card = card_from_int (idx+1) in
    if (idx+1) <= 52 then Play (card, default_play_l st)
    else Take (card, default_take_l st)

(* [sample_vec vec] samples an index i according to the distribution [vec] *)
let sample_vec vec =
  let i = Random.float 1.0 in
  (* want to find j such that *)
  (* strat[0]+..+strat[j] <= i < strat[0]+..+strat[j]+strat[j+1] *)
  let fold_helper (acc, trigger, j) p =
    if (acc <= i && i <= acc+.p) || trigger then (acc, true, j)
    else (acc+.p, false, j+1) in
  let _,_,idx = List.fold_left fold_helper (0.0, false, 0) vec in
  idx

(* update strat if needed *)
let update_strat strat hash vec =
  if List.mem (hash, vec) strat then strat else (hash, vec)::strat

(** [repl st] is the Read Evaluate Print Loop for a card gamecurrently in 
 * state [st]
 * Requires: [st] is either an initial state or a state after a command 
 * has been executed *)
let rec repl st strat = 
  if is_ai_helper st then play_ai st strat else
  print_endline new_screen;
  prerr_endline (intro_message st);
  if (winner st <> "") then
  ANSITerminal.(print_string [red] (single_line ^ "\n" 
                                    ^ winners_to_str st ^ "\n" ^
                                    single_line ^ "\n"));
  print_endline double_line;
  ANSITerminal.(print_string [green] (locations_to_string st ^ "\n\n"));
  ANSITerminal.(print_string [cyan] ("[HANDS]: " ^ all_hands_to_string st ^ "\n"));
  print_endline (double_line);
  ANSITerminal.(print_string [yellow] (last_move st ^ "\n"));
  print_endline double_line;
  ANSITerminal.(print_string [blue] ("[YOUR HAND] "
  ^ curr_player_hand_to_string st ^ "\n"));
  print_endline (double_line);
  match last_command st with
  | Quit -> print_endline (new_screen ^ last_cmd_to_str st); ()
  | _ -> print_endline (last_cmd_to_str st);
         print_endline (single_line);
         ANSITerminal.(print_string [red] (turn_message st ^ "\n"));
         print_endline (single_line);
         ANSITerminal.(print_string [yellow] (available_commands ^ "\n"));
         print_endline (single_line);
         print_string "> ";
         repl (execute (parse (read_line ())) st) strat

and play_ai st strat =
  let hash = hash_state st in
  (* obtain vec *)
  let vec = 
    try eval_strat (hash_state st) strat
    with e ->
      (* need to update strategy and vec *)
      let valids = compute_valid_moves st in
      let _ = List.map (fun m -> print_endline (command_to_string m);) valids in
      get_new_vec valids
    in

  (* update strat if needed *)
  let strat = if List.mem (hash, vec) strat then strat 
              else (hash, vec)::strat in

  (* need to randomly sample according to strat vector *)
  let idx = sample_vec vec in
  (* want to decode idx as a move *)
  (* need to write idx = 4j - k where k encodes suit and j encodes rank *)
  let move = decode_index st idx in

  (* check move is valid *)
  let move, strat = if move_is_valid st move then move,strat else
                    let new_vec = get_new_vec (compute_valid_moves st) in
                    let new_strat = update_strat strat hash new_vec in
                    (decode_index st (sample_vec new_vec)), new_strat
                    in
  print_endline new_screen;
  (* print_endline ((last_move (execute move st)) ^ "\n"); *)
  prerr_endline (intro_message st);
  if (winner st <> "") then
  ANSITerminal.(print_string [red] (single_line ^ "\n" 
                                    ^ winners_to_str st ^ "\n" ^
                                    single_line ^ "\n"));
  print_endline double_line;
  ANSITerminal.(print_string [green] (locations_to_string st ^ "\n\n"));
  ANSITerminal.(print_string [cyan] ("[HANDS]: " ^ all_hands_to_string st ^ "\n"));
  print_endline (double_line);
  ANSITerminal.(print_string [yellow] ((last_move st) ^ "\n"));
  print_endline double_line;
  ANSITerminal.(print_string [blue] ("[AI HAND] "
  ^ curr_player_hand_to_string st ^ "\n"));
  print_endline (double_line);
  print_endline ("Next player: " ^ (next_player_name st));
  print_endline "\nThe current move string is: \n";
  print_endline (command_to_string move);
  let st' = execute move st in
  match last_command st' with
  | Err _ -> print_endline ("Error: invalid command from AI. Ending turn \n");
             repl (execute End st) strat
  | Quit -> print_endline (new_screen ^ last_cmd_to_str st); ()
  | _ ->  print_endline (last_cmd_to_str st);
          print_endline (single_line);
          ANSITerminal.(print_string [red] (turn_message st ^ "\n"));
          print_endline (single_line);
          ANSITerminal.(print_string [yellow] (available_commands ^ "\n"));
          print_endline (single_line);
          print_string ("> " ^ (command_to_string move));
          repl st' strat

(** Helper: Loads json from [file_name] into a json type *)
let load_json file_name = 
  Yojson.Basic.from_file file_name

(* [play_game f] plays the game in card game json file f *)
let rec play_game f =
  (* split f into respective file names *)
  let st_lst = String.split_on_char ';' f in
  let st = init_state (load_json (List.hd st_lst)) in
  let strat = load_strategy (load_json (List.nth st_lst 1)) in
    ANSITerminal.(print_string [blue] (intro_message st ^ "\n"));
		repl st strat

(* [main ()] starts the REPL for the card game engine *)
let main () =
  print_string new_screen;
	ANSITerminal.(print_string [blue] intro);
  print_endline start_msg;
  print_string  "> ";
	match read_line () with
	| exception End_of_file -> ()
	| file_name -> play_game file_name

let () = main ()