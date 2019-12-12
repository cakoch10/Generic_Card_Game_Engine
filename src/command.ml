type card = string * string

let ranks = ["2";"3";"4";"5";"6";"7";"8";"9";"10";"J";"K";"Q";"A"]

let suits = ["C";"D";"H";"S"]

type location = string

type command = 
  | Play of (card * location)
  | Draw of location
  | Take of (card * location)
  | Shuffle of (location * location)
  | End
  | Hand 
  | Look
  | Turns 
  | Status 
  | Help
  | Quit
  | Err of string

(* [parse_to_card obj] takes a string [obj] parses this string to a card. For 
 * example, "K|S" becomes the king of spades, which is ("K", "S"). 
 * requires: [obj] is a valid string representing a card in the 52 card deck *)
let parse_to_card obj =
  let lst = String.split_on_char '|' obj in
  match lst with
  | r::s::[] ->
    let r' = r |> String.uppercase_ascii |> String.trim in
    let s' = s |> String.uppercase_ascii |> String.trim in
    if (List.mem r' ranks && List.mem s' suits) then
      (r',s')
    else
      ("","")
  | _ -> ("","")

(** [play_pair obj] is either a Play command or an Error. If [obj] contains a
  * |, then play_pair will split the string in half, the left will be the
  * card and the right will be the location. Otherwise, returns [Err].
  * requires: None. *)
(* let play_no_loc obj =
  let lst = String.split_on_char 'l' obj in
  match lst with
  | r::s::[] ->
    let r' = r |> String.capitalize_ascii |> String.trim in
    let s' = s |> String.capitalize_ascii |> String.trim in
    if (List.mem r ranks && List.mem s suits) then
      Play ((r' ,s'), "default")
    else
      Err "Unrecognized Card"
  | _ -> Err "Unrecognized Card" *)

(** [play_loc obj l] parses the string [obj] into a rank and suit. If they are
  * valid, yield a Play Command that will play the card to location l. Return 
  * an error otherwise
  * requires: None *)
(* let play_loc obj l =
  match String.split_on_char '|' obj with
  | r::s::[] ->
    let r' = r |> String.capitalize_ascii |> String.trim in
    let s' = s |> String.capitalize_ascii |> String.trim in
    if (List.mem r ranks && List.mem s suits) then
      Play ((r' ,s'), String.capitalize_ascii l)
    else
      Err "Unrecognized Card"
  | _ -> Err "Unrecognized card."  *)

(** [get_verb_object str] parses str into a tuple containing the verb portion
  * of a command and the object portion of the command. If there is no object,
  * simply return a tuple containing the verb and the emptry string. 
  * requires: None. *)
let get_verb_object str =
  let lst = str |> String.trim |> String.split_on_char ' ' 
    |> List.filter (fun s -> s <> "") in
  match lst with
  | v::[] -> (String.lowercase_ascii v,"","")
  | v::o::[] -> (String.lowercase_ascii v, String.lowercase_ascii o,"")
  | v::o::l::[] -> (String.lowercase_ascii v, String.lowercase_ascii o, 
                String.lowercase_ascii l)
  | _ -> ("","","")

(** [parse str] is the string [str] converted into a command. If str is an 
  * invalid command, then returns Err
  * requires: None. *)
let parse str =
  match get_verb_object str with
  | ("play",c,"") -> Play (parse_to_card c,"")
  | ("play",c,l) -> Play (parse_to_card c, l)
  | ("draw",l,"") -> Draw l
  | ("take",c,"") -> Take (parse_to_card c, "")
  | ("take",c,l) -> Take (parse_to_card c, l)
  | ("shuffle",l1,l2) -> Shuffle (l1, l2)
  | ("end","","") -> End
  | ("hand","","") -> Hand
  | ("look","","") -> Look
  | ("turns","","") -> Turns
  | ("status","","") -> Status
  | ("help","","") -> Help
  | ("quit","","") -> Quit
  | _ -> Err "Unrecognized command. Please try again."
  