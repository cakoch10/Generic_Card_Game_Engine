
(* The type of tokens. *)

type token = 
  | WINCOND
  | VERTLINE
  | TURNS
  | TRUE
  | TOPCARDOF
  | THISPLAYER of (string)
  | THEN
  | TAKE
  | SUIT
  | STRING of (string)
  | SIZEOF
  | SHUFFLE
  | SEMI
  | SCORE
  | RULE
  | RPAREN
  | PLUS
  | PLAYERID of (string)
  | PLAY
  | OR
  | NEXTPLAYER of (string)
  | NEQ
  | MULT
  | LT
  | LPAREN
  | LOCOPEN
  | LOCCLOSE
  | LEQ
  | LASTPLAYER of (string)
  | INT of (int)
  | HIGHSCORE
  | GT
  | GEQ
  | GENERICPLAYER of (string)
  | FALSE
  | EQ
  | EOF
  | END
  | DRAW
  | DOUBLENEQ
  | DOUBLEEQ
  | DASH
  | CONTAINS
  | COMMA
  | CARDSTAKEN
  | CARDSPLAYED
  | CARDSDRAWN
  | CARDRANGEOPEN
  | CARDRANGECLOSE
  | CARDPOINT
  | CARDOPEN
  | CARDCLOSE
  | AND
  | ALLPLAYERS of (string)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
