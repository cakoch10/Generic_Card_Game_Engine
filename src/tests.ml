open OUnit2
open Ast
open Command
open State
open Yojson.Basic.Util

let exjson = Yojson.Basic.from_file "../games/ex.json"
let testj = Yojson.Basic.from_file "../games/test.json"
let blackjj = Yojson.Basic.from_file "../games/blackjack.json"
let blackjj2 = Yojson.Basic.from_file "../games/blackjack2.json"
let crazy8j = Yojson.Basic.from_file "../games/crazy8.json"
let myshipj = Yojson.Basic.from_file "../games/myshipsails.json"
let fivecardj = Yojson.Basic.from_file "../games/5carddraw.json"

let p1_has_kings = testj |> init_state |> execute (parse "take K|S deck") |> execute (parse "take K|D deck") 
|> execute (parse "take K|C deck") |> execute (parse "take K|H deck")
let p2_takes_kings = p1_has_kings |> execute End |> execute (parse "take K|S p1") |> execute (parse "take K|D p1") 
|> execute (parse "take K|C p1") |> execute (parse "take K|H p1")
let p1_has_kh = p2_takes_kings |> execute (parse "Play K|H p1")

(** [check_players j] checks if the json j has the # of players correctly
 * formatted, meaning that the # players is an integer or raises an exception.
 * Requires: [j] a YoJson.Basic.Json *)
 let check_players j = 
  try
  (let _ = j |> member "players" |> to_int in true) 
  with _ -> (failwith "Players in JSON is not an integer.")

(** [check_win_conditions j] checks if the json j has win conditions correctly
 * formatted, meaning that the card points are a list of strings. Every element
 * in a list must start with "WC: " or raises an exception otherwise. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_win_conditions j = 
  try
  (let wc_list = j |> member "win_conditions" |> to_list |> List.map to_string in 
  (List.fold_left (fun acc x -> if String.sub x 0 4 = "WC: " then true && acc 
  else failwith "Win conditions are formatted incorrectly.")     
  true wc_list))
  with _ -> (failwith "Win conditions are formatted incorrectly.")

(** [check_card_points j] checks if the json j has card points correctly
 * formatted, meaning that the card points are a list of strings. Every element
 * in a list must start with "CP: " or raises an exception otherwise. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_card_points j = 
  try
  (let cp_list = j |> member "card_points" |> to_list |> List.map to_string in 
  (List.fold_left (fun acc x -> if String.sub x 0 4 = "CP: " then true && acc 
  else failwith "Card points are formatted incorrectly.")     
  true cp_list))
  with _ -> (failwith "Card points are formatted incorrectly.")

(** [check_intro_message j] checks if the json j has a valid intro_message. 
 *  All this checks is if the intro_message is a string.  
 * otherwise. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_intro_message j = 
  try
  (let _ = j |> member "intro_message" |> to_string in true) 
  with _ -> (failwith "Intro message in JSON is not a string.")

(** [check_help_message j] checks if the json j has a valid help_message. 
 *  All this checks is if the help_message is a string.  
 * otherwise. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_help_message j = 
  try
  (let _ = j |> member "help_message" |> to_string in true) 
  with _ -> (failwith "Help message in JSON is not a string.")

(** [check_locations j] checks if the json j has locations in the correct form.
 * meaning that the locations are a list of strings. Raises an exception if 
 * otherwise. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_locations j = 
  try (let _ = j |> member "locations" |> to_list |> List.map to_string
  in true)
  with _ -> (failwith "Locations are formatted incorrectly.")

(* a dealing is a location and the number of cards at that location. this info
 * is specified in the json for all the locations in the game. *)
type dealing = {
  location: string;
  number_of_cards: int;
}

(** [dealing_of_json j] is a helper for check_deal, simply creating a dealing
 * (see type above) from a json j. 
 * Requires: [j] a YoJson.Basic.Json *)
let dealing_of_json j = 
  {
  location = j |> member "location" |> to_string;
  number_of_cards = j |> member "number_of_cards" |> to_int;
  }

(** [dealings_of_json j] is a helper for check_deal, simply creating a dealing
 * list from a json j. 
 * Requires: [j] a YoJson.Basic.Json *)
let dealings_of_json j = 
  j |> member "deal" |> to_list |> List.map dealing_of_json

(** [check_deal j] checks if the json j has dealings in the correct format, 
 * meaning that 52 cards are distributed. 
 * Requires: [j] a YoJson.Basic.Json *)
let check_deal j = 
  try
  let dealing_list = dealings_of_json j in 
  let total_num_cards = List.fold_left (fun acc x -> x.number_of_cards + acc) 
  0 dealing_list in 
  if total_num_cards != 52 then failwith "There are not 52 cards present" else 
  true 
  with x -> raise x

(** [check_json j] checks if the json j is in the correct format as specified 
 * by us and how we want the JSON to look like and according to the examples
 * Requires: [j] a YoJson.Basic.Json *)
let check_json j =
check_players j && check_win_conditions j && check_card_points j 
&& check_intro_message j && check_help_message j && check_locations j && 
check_deal j

(* A few test cases *)
let tests = [
  "(1)" >:: (fun _ -> assert_equal 0 (exjson |> init_state |> cards_played));

  "(2)" >:: (fun _ -> assert_equal 4 (exjson |> init_state |> num_players));

  "(3)" >:: (fun _ -> assert_equal 2 (testj |> init_state |> num_players));

  "(4)" >:: (fun _ -> assert_equal "No one has won yet" 
  (exjson |> init_state |> winners_to_str));

  "(5)" >:: (fun _ -> assert_equal "" 
  (testj |> init_state |> execute End |> last_cmd_to_str));

  "(6)" >:: (fun _ -> assert_equal ("[LOOK] " ^ card_locations (init_state exjson))
  (exjson |> init_state |> execute Look |> last_cmd_to_str));

  "(7)" >:: (fun _ -> assert_equal ("[LOOK] " ^ card_locations (init_state exjson))
  (exjson |> init_state |> execute Look |> last_cmd_to_str));

  "(8)" >:: (fun _ -> assert_equal ("You took [K|♠] from { Deck }")
  (testj |> init_state |> execute (parse "take K|S deck") |> last_cmd_to_str));

  "(9)" >:: (fun _ -> assert_equal ("You took [K|♦] from { Deck }")
  (testj |> init_state |> execute (parse "take K|D deck") |> last_cmd_to_str));

  "(10)" >:: (fun _ -> assert_equal ("p1: [K|♠] ")
  (testj |> init_state |> execute (parse "take K|S deck") |> curr_player_hand_to_string));

  "(11)" >:: (fun _ -> assert_equal ("p1: ")
  (testj |> init_state |> execute (parse "play K|S deck") |> curr_player_hand_to_string));

  "(12)" >:: (fun _ -> assert_equal ("p1: [K|♥] [K|♣] [K|♦] [K|♠] ")
  (testj |> init_state |> execute (parse "take K|S deck") |> execute (parse "take K|D deck") 
  |> execute (parse "take K|C deck") |> execute (parse "take K|H deck") 
  |> curr_player_hand_to_string));

  "(13)" >:: (fun _ -> assert_equal ("p1: [K|♣] [K|♦] [K|♠] ")
  (testj |> init_state |> execute (parse "take K|S deck") |> execute (parse "take K|D deck") 
  |> execute (parse "take K|C deck") |> execute (parse "take K|H deck") |> execute (parse "play K|H deck")
  |> curr_player_hand_to_string));

  "(14)" >:: (fun _ -> assert_equal ("You took [K|♥] from { Deck }") (p1_has_kings |> last_cmd_to_str));

  "(15)" >:: (fun _ -> assert_equal "" (p1_has_kings |> execute End |> last_cmd_to_str));
  
  "(16)" >:: (fun _ -> assert_equal "p2: [K|♠] " 
  (p1_has_kings |> execute End |> execute (parse "take K|S p1") |> curr_player_hand_to_string));

  "(17)" >:: (fun _ -> assert_equal ("p2: [K|♥] [K|♣] [K|♦] [K|♠] ")
  (p1_has_kings |> execute End |> execute (parse "take K|S p1") |> execute (parse "take K|D p1") 
  |> execute (parse "take K|C p1") |> execute (parse "take K|H p1") |> curr_player_hand_to_string));

  "(18)" >:: (fun _ -> assert_equal "" (p2_takes_kings |> execute End |> last_cmd_to_str));

  "(19)" >:: (fun _ -> assert_equal ("p1: ") (p2_takes_kings |> execute End |> curr_player_hand_to_string));

  "(20)" >:: (fun _ -> assert_equal ("Error: No card at that location") 
  (p2_takes_kings |> execute End |> execute (parse "take Q|H p2") |> last_cmd_to_str));

  "(21)" >:: (fun _ -> assert_equal (curr_player_hand_to_string (p2_takes_kings |> execute (parse "Draw Deck")))
  (p2_takes_kings |> execute (parse "Draw Deck") |> curr_player_hand_to_string));

  "(22)" >:: (fun _ -> assert_equal "You drew from { Deck }"
  (p2_takes_kings |> execute (parse "Play K|H Deck") |> execute (parse "Draw Deck") |> last_cmd_to_str));

  "(23)" >:: (fun _ -> assert_equal ("p2: [K|♥] [K|♣] [K|♦] [K|♠] ")
  (p2_takes_kings |> execute (parse "Play K|H Deck") |> execute (parse "Draw Deck") |> curr_player_hand_to_string));

  "(24)" >:: (fun _ -> assert_equal ("p1: [K|♠] ") (p2_takes_kings |> execute End |> execute (parse "Take K|S p2") |> curr_player_hand_to_string));

  "(25)" >:: (fun _ -> assert_equal ("p1: [K|♠] ") (p2_takes_kings |> execute End |> execute (parse "Take K|S p2") 
  |> execute (parse "Take K|S p1")|> curr_player_hand_to_string));

  "(26)" >:: (fun _ -> assert_equal ("p1: [K|♠] ") (p2_takes_kings |> execute End |> execute (parse "Take K|S p2") 
  |> execute (parse "Take K|S p2")|> curr_player_hand_to_string));

  "(27)" >:: (fun _ -> assert_equal ("p1: [K|♥] [K|♠] ") (p2_takes_kings |> execute End |> execute (parse "Take K|S p2") 
  |> execute (parse "Take K|H p2")|> curr_player_hand_to_string));

  "(29)" >:: (fun _ -> assert_equal ("") ((hand_from_name p1_has_kings "p2") |> card_lst_to_string));

  "(30)" >:: (fun _ -> assert_equal ("[K|H] [K|C] [K|D] [K|S] ") ((hand_from_name p1_has_kings "p1") |> card_lst_to_string));

  "(31)" >:: (fun _ -> assert_equal ("[K|H] ") ((hand_from_name p1_has_kh "p1") |> card_lst_to_string));

  "(32)" >:: (fun _ -> assert_equal ("[K|C] [K|D] [K|S] ") ((hand_from_name p1_has_kh "p2") |> card_lst_to_string));

  "(33)" >:: (fun _ -> assert_equal ("[HAND] p2: [K|♣] [K|♦] [K|♠] ") (p1_has_kh |> execute Hand |> last_cmd_to_str));

  "(34)" >:: (fun _ -> assert_equal ("[HAND] p1: [K|♥] ") (p1_has_kh |> execute End |> execute Hand |> last_cmd_to_str));
  
  "(35)" >:: (fun _ -> assert_equal ("[LOOK] " ^ card_locations (init_state testj))
  (testj |> init_state |> execute Look |> last_cmd_to_str));
  
  "(36)" >:: (fun _ -> assert_equal 1 (p1_has_kh |> cards_played));

  "(37)" >:: (fun _ -> assert_equal 0 (p1_has_kh |> execute End |> cards_played));

  "(38)" >:: (fun _ -> assert_equal 1 (p1_has_kh |> execute End |> execute (parse "Play K|H p2") |> cards_played));

  "(39)" >:: (fun _ -> assert_equal 1 (p1_has_kh |> execute End |> 
  execute (parse "Play K|H p2") |> execute (Draw "p2") |> cards_played));

  "(40)" >:: (fun _ -> assert_equal "p1: [K|♥] " (p1_has_kh |> execute End |> 
  execute (parse "Play K|H p2") |> execute (Draw "p2") |> curr_player_hand_to_string));

  "(41)" >:: (fun _ -> assert_equal true (blackjj |> check_json));

  "(42)" >:: (fun _ -> assert_equal true (myshipj |> check_json));

  "(43)" >:: (fun _ -> assert_equal true (crazy8j |> check_json));

  "(44)" >:: (fun _ -> assert_equal true (blackjj2 |> check_json));

  "(45)" >:: (fun _ -> assert_equal true (fivecardj |> check_json));
]

let _ = run_test_tt_main ("suite" >::: tests)