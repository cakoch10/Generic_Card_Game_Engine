type card = string * string

type location = string
(* [command] represents a command input by a player. It may have the actual 
 * verbal command that dictates what the command will be doing and also may 
 * contain the card that will be manipulated to due the command *)
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

(* [parse s] takes in some input string [s] from the user, typing into the REPL,
 * and parses that string into a command type as defined above
 * requires: [s] is a string in a command form *)
val parse : string -> command

val get_verb_object : string -> (string * string * string)

val parse_to_card : string -> (string * string)