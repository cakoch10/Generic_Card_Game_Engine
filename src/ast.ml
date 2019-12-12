open Base

(* The type of the abstract syntax tree (AST). *)
type location = string [@@deriving sexp, compare, equal, hash]

type card = string * string [@@deriving sexp, compare, equal, hash]

type player = string [@@deriving sexp, compare, equal, hash]

type expr =
  | Int of int
  | Bool of bool
  | Location of location
  | Card of card
  | Player of player
  | CardRange of string * string * string
  | CardList of expr list
(*binops*)
  | Add of expr * expr
  | Eq of expr * expr
  | DoubleEq of expr * expr 
  | Neq of expr * expr
  | DoubleNeq of expr * expr
  | Gt of expr * expr
  | Lt of expr * expr
  | Geq of expr * expr
  | Leq of expr * expr
  | And of expr * expr
  | Or of expr * expr
  | Neg of expr 
  | Mult of expr * expr
  (* State accessors *)
  | TopCard of expr 
  | Size of expr
  | Contains of expr * expr
  | CardsPlayed of unit
  | CardsDrawn of unit
  | CardsTaken of unit
  | HighScore of unit
  | Score of expr
  | Turns of expr
  | Rank of expr
  | Suit of expr
  (* Player actions *)
  | Play of expr * expr
  | Draw of expr
  | Take of expr * expr
  | Shuffle of expr * expr
  | End of unit
  (* Main Rule expression. Consists of a state accessor comparison and a command that will be allowed if the state satsfies the state checker *)
  | Rule of expr * expr
  | CardPoint of expr * expr
  | WinCondition of expr
  [@@deriving sexp, compare, equal, hash]