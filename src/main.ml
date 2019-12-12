(* REPL STRINGS *)
open State
open Command
open Yojson.Basic.Util 

(* REPL STRINGS *)

let new_screen = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

let double_line =
  "============================================================================"
let single_line =
  "----------------------------------------------------------------------------"

let intro = 
   "\n=======================================================================\n"
  ^"                         CARD GAME ENGINE:                               \n"
  ^"           Designed by Caleb K. Justin K. Raymone R. and Wes T.            "
  ^"\n=======================================================================\n"

let start_msg = "\nPlease enter the name of the card game configuration file "
^ "you want to load.\n"

let available_commands = 
     "[COMMANDS] [ ] = required, ( ) = optional\n"
   ^ "ACTIONS: Play [card] (loc) | Draw (loc) | Take [card] (loc) | End\n"
   ^ "MISC: Hand | Look | Turns | Status | Help | Quit "


(* END OF REPL STRINGS *)


(** [repl st] is the Read Evaluate Print Loop for a card gamecurrently in 
 * state [st]
 * Requires: [st] is either an initial state or a state after a command 
 * has been executed *)
let rec repl st = 
  if is_ai_helper st then play_ai st else
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
         repl (execute (parse (read_line ())) st)



and play_ai st =
  (*
    Here's the main idea:
    - figure out which moves are valid, try play C for every C in the AI's hand
        try take and draw
    - if none of these work then just end
    - for every valid move that's valid, simulate playing that move and 
        compute the score
    - pick the valid move that gives you the highest score, if there are 
        multiple high scoring moves, then just play the first one
    - repeat
  *)
  let valids = compute_valid_moves st in
  let move = 
    if 0 = List.length valids then End else compute_max_score valids st in
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
          print_string ("> " ^ (command_to_string move));
          repl (execute move st)

(** Helper: Loads json from [file_name] into a json type *)
let load_json file_name = 
  Yojson.Basic.from_file file_name

(* [play_game f] plays the game in card game json file f *)
let rec play_game f =
   let st = init_state (load_json f) in
    ANSITerminal.(print_string [blue] (intro_message st ^ "\n"));
		repl st


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