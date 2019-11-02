(* The first section of the lexer definition, called the *header*,
   is the part that appears below between { and }.  It is code
   that will simply be copied literally into the generated lexer.ml. *)

{
open Parser
}

(* The second section of the lexer definition defines *identifiers*
   that will be used later in the definition.  Each identifier is
   a *regular expression*.  We won't go into details on how regular
   expressions work.
   
   Below, we define regular expressions for 
     - whitespace (spaces and tabs),
     - digits (0 through 9)
     - integers (nonempty sequences of digits, optionally preceded by a minus sign)
     - letters (a through z, and A through Z), and
     - identifiers (nonempty sequences of letters).
     
   FYI, these aren't exactly the same as the OCaml definitions of integers and 
   identifiers. *)

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+
let letter = ['a'-'z' 'A'-'Z' '*']
let lowercase = ['a'-'z']
let uppercase = ['A'-'Z']
let string = letter+
let playerid = 'p'['1'-'4']
let rank = ['0'-'9'] | "10" | ['A' 'Q' 'K' 'J']
let suit = ['C' 'D' 'H' 'S']
let cardchar = rank|suit|'*'
let cardcharseq = (cardchar)cardchar+
(* The final section of the lexer definition defines how to parse a character
   stream into a token stream.  Each of the rules below has the form 
     | regexp { action }
   If the lexer sees the regular expression [regexp], it produces the token 
   specified by the [action].  We won't go into details on how the actions
   work.  *)

rule read = 
  parse
  | white { read lexbuf }
  | "->" { THEN }  
  | "true" { TRUE }  
  | "false" { FALSE } 
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "<<" { CARDOPEN }
  | ">>" { CARDCLOSE }
  | "{" { LOCOPEN }
  | "}" { LOCCLOSE }
  | "|" { VERTLINE }
  | "," { COMMA }
  | ";" { SEMI }
  | "[" { CARDRANGEOPEN }
  | "]" { CARDRANGECLOSE }
  | "<" { LT }
  | "<=" { LEQ }
  | ">" { GT }
  | ">=" { GEQ }
  | "==" { DOUBLEEQ }
  | "=" { EQ }
  | "!==" { DOUBLENEQ }
  | "!=" { NEQ }
  | "&&" { AND }
  | "||" { OR }
  | "+" { PLUS }
  | "-" { DASH }
  | "**" { MULT }
  | "TopCard" { TOPCARDOF }
  | "Size" { SIZEOF }
  | "Contains" { CONTAINS }
  | "CardsPlayed" { CARDSPLAYED }
  | "CardsDrawn" { CARDSDRAWN }
  | "CardsTaken" { CARDSTAKEN }
  | "Turns" { TURNS }
  | "HighScore" { HIGHSCORE }
  | "Score" { SCORE }
  | "Play" { PLAY }
  | "Draw" { DRAW }
  | "Take" { TAKE }
  | "Shuffle" { SHUFFLE }
  | "End" { END }
  | "R:" { RULE }
  | "CP:" { CARDPOINT }
  | "WC:" { WINCOND }
  | playerid { PLAYERID (Lexing.lexeme lexbuf) }
  | "t" { THISPLAYER (Lexing.lexeme lexbuf) }
  | "n" { NEXTPLAYER (Lexing.lexeme lexbuf) }
  | "p" { GENERICPLAYER (Lexing.lexeme lexbuf) }
  | "l" { LASTPLAYER (Lexing.lexeme lexbuf) }
  | "a" { ALLPLAYERS (Lexing.lexeme lexbuf) }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | string { STRING (Lexing.lexeme lexbuf) }
  | eof { EOF }
	
(* And that's the end of the lexer definition.  *)
