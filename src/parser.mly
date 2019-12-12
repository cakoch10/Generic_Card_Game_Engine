(* The first section of the grammar definition, called the *header*,
   is the part that appears below between %{ and %}.  It is code
   that will simply be copied literally into the generated parser.ml. 
   Here we use it just to open the Ast module so that, later on
   in the grammar definition, we can write expressions like 
   [Int i] instead of [Ast.Int i]. *)

%{
open Ast
%}

(* The next section of the grammar definition, called the *declarations*,
   first declares all the lexical *tokens* of the language.  These are 
   all the kinds of tokens we can expect to read from the token stream.
   Note that each of these is just a descriptive name---nothing so far
   says that LPAREN really corresponds to '(', for example.  The tokens
   that have a <type> annotation appearing in them are declaring that
   they will carry some additional data along with them.  In the
   case of INT, that's an OCaml int.  In the case of ID, that's
   an OCaml string. *)

%token <int> INT
%token <string> STRING THISPLAYER NEXTPLAYER LASTPLAYER ALLPLAYERS GENERICPLAYER PLAYERID 
%token TRUE FALSE
%token EQ DOUBLEEQ DOUBLENEQ NEQ LEQ GEQ LT GT
%token PLUS DASH MULT
%token AND OR
%token LPAREN RPAREN
%token CARDOPEN CARDCLOSE
%token LOCOPEN LOCCLOSE
%token VERTLINE COMMA SEMI
%token CARDRANGEOPEN CARDRANGECLOSE
%token TOPCARDOF SIZEOF CONTAINS CARDSPLAYED CARDSDRAWN CARDSTAKEN 
        SCORE SUIT HIGHSCORE TURNS
%token PLAY DRAW TAKE SHUFFLE END
%token RULE CARDPOINT WINCOND THEN
%token EOF

(* After declaring the tokens, we have to provide some additional information
   about precedence and associativity.  The following declarations say that
   PLUS is left associative, that IN is not associative, and that PLUS
   has higher precedence than IN (because PLUS appears on a line after IN).  
   
   Because PLUS is left associative, "1+2+3" will parse as "(1+2)+3"
   and not as "1+(2+3)".
   
   Because PLUS has higher precedence than IN, "let x=1 in x+2" will
   parse as "let x=1 in (x+2)" and not as "(let x=1 in x)+2". *)
%nonassoc THEN WINCOND
%right OR AND
%left EQ NEQ LT LEQ GT GEQ DOUBLEEQ DOUBLENEQ PLUS DASH MULT



(* After declaring associativity and precedenc, we need to declare what
   the starting point is for parsing the language.  The following
   declaration says to start with a rule (defined below) named [prog].
   The declaration also says that parsing a [prog] will return an OCaml
   value of type [Ast.expr]. *)

%start <Ast.expr> prog

(* The following %% ends the declarations section of the grammar definition. *)

%%

(* Now begins the *rules* section of the grammar definition.  This is a list
   of rules that are essentially in Backus-Naur Form (BNF), although where in 
   BNF we would write "::=" these rules simply write ":".
   
   The format of a rule is
   
     name:
       | production { action }
       | production { action }
       | etc.
       ;
       
    The *production* is the sequence of *symbols* that the rule matches. 
    A symbol is either a token or the name of another rule. 
    The *action* is the OCaml value to return if a match occurs. 
    Each production can *bind* the value carried by a symbol and use
    that value in its action.  This is perhaps best understood by example... *)
   

(* The first rule, named [prog], has just a single production.  It says
   that a [prog] is an [expr] followed by [EOF] (which stands for end-of-file).
   EOF is a token returned by the lexer when it reaches the end of the token stream.
   The first part of the production, [e=expr], says to match an [expr] and bind
   the resulting value to [e].  The action simply says to return that value [e]. *)
   
prog:
	| e = expr; EOF { e }
	;
	
(* The second rule, named [expr], has productions for integers, variables, 
   addition expressions, let expressions, and parenthesized expressions.
   
   - The first production, [i = INT], says to match an [INT] token, bind the
     resulting OCaml [int] value to [i], and return AST node [Int i].
   
   - The second production, [x = ID], says to match an [ID] token, bind the
     resulting OCaml [string] value to [x], and return AST node [Var x].	
   
   - The third production, [e1 = expr; PLUS; e2 = expr], says to match an [expr] followed by a [PLUS] token followed by another [expr].
     The first [expr] is bound to [e1] and the second to [e2].  The AST
     node returned is [Add(e1,e2)].
   
   - The fourth production, [LET; x = ID; EQUALS; e1 = expr; IN; e2 = expr],
     says to match a [LET] token followed by an [ID] token followed by
     an [EQUALS] token followed by an [expr] followed by an [IN] token
     followed by another [expr].  The string carried by the [ID] is bound
     to [x], and the two expressions are bound to [e1] and [e2].  The AST
     node returned is [Let(x,e1,e2)].
     
   - The fifth production, [LPAREN; e = expr; RPAREN] says to match an
     [LPAREN] token followed by an [expr] followed by an [RPAREN].  The
     expression is bound to [e] and returned. *)

expr:
	| i = INT { Int i }
  | p = PLAYERID { Player p }
  | t = THISPLAYER { Player t }
  | n = NEXTPLAYER { Player n }
  | p = GENERICPLAYER { Player p }
  | l = LASTPLAYER { Player l }
  | a = ALLPLAYERS { Player a }
  | TRUE { Bool true }
	| FALSE { Bool false }
  | LOCOPEN; p = PLAYERID; LOCCLOSE { Location p }
  | LOCOPEN; t = THISPLAYER; LOCCLOSE { Location t }
  | LOCOPEN; n = NEXTPLAYER; LOCCLOSE { Location n }
  | LOCOPEN; l = LASTPLAYER; LOCCLOSE { Location l }
  | LOCOPEN; p = GENERICPLAYER; LOCCLOSE { Location p }
  | LOCOPEN; a = ALLPLAYERS; LOCCLOSE { Location a }
  | LOCOPEN; l = STRING; LOCCLOSE { Location l }
  | CARDOPEN; r = INT; VERTLINE; s = STRING; CARDCLOSE { Card(string_of_int r, s) }
  | CARDOPEN; r = STRING; VERTLINE; s = STRING; CARDCLOSE { Card(r, s) }
  | e1 = expr; PLUS; e2 = expr {Add (e1, e2)}
  | DASH; e = expr; {Neg e}
  | e1 = expr; MULT; e2 = expr {Mult (e1, e2)}
  | e1 = expr; DOUBLEEQ; e2 = expr { DoubleEq(e1, e2) }
  | e1 = expr; DOUBLENEQ; e2 = expr { DoubleNeq(e1, e2) }
  | e1 = expr; LT; e2 = expr { Lt(e1,e2) } 
  | e1 = expr; GT; e2 = expr { Gt(e1,e2) } 
  | e1 = expr; GEQ; e2 = expr { Geq(e1,e2) } 
	| e1 = expr; LEQ; e2 = expr { Leq(e1,e2) } 
  | e1 = expr; EQ; e2 = expr  { Eq(e1, e2) }
  | e1 = expr; NEQ; e2 = expr { Neq(e1, e2) }
  | e1 = expr; AND; e2 = expr { And(e1, e2) }
  | e1 = expr; OR; e2 = expr { Or(e1, e2) }
  /* Card Range */
  | CARDRANGEOPEN; l = INT; DASH; h = INT; VERTLINE; s = STRING; 
    CARDRANGECLOSE { CardRange (string_of_int l, string_of_int h, s) }
  | CARDRANGEOPEN; l = INT; DASH; h = STRING; VERTLINE; s = STRING; 
    CARDRANGECLOSE { CardRange (string_of_int l, h, s) }
  | CARDRANGEOPEN; l = STRING; DASH; h = INT; VERTLINE; s = STRING; 
    CARDRANGECLOSE { CardRange (l, string_of_int h, s) }
  | CARDRANGEOPEN; l = STRING; DASH; h = STRING; VERTLINE; s = STRING; 
    CARDRANGECLOSE { CardRange (l, h, s) }
  /* Card List */
  | CARDRANGEOPEN; lst = separated_list(SEMI, expr); CARDRANGECLOSE 
    { CardList (lst) }
    /* State Accessors */
  | TOPCARDOF; LPAREN; l = expr; RPAREN { TopCard l }
  | SIZEOF; LPAREN; l = expr; RPAREN { Size l }
  | CONTAINS; LPAREN; l=expr; COMMA; c = expr; RPAREN { Contains (l,c) }
  | CARDSPLAYED; LPAREN; RPAREN { CardsPlayed () }
  | CARDSDRAWN; LPAREN; RPAREN { CardsDrawn () }
  | CARDSTAKEN; LPAREN; RPAREN { CardsTaken () }
  | HIGHSCORE; LPAREN; RPAREN { HighScore () }
  | SUIT; LPAREN; c = expr; RPAREN { Suit c }
  | TURNS; LPAREN; p = expr; RPAREN { Turns p }
  /* Player Actions */
  | SCORE; LPAREN; p = expr; RPAREN { Score p }
  | PLAY; LPAREN; c = expr; COMMA; l = expr RPAREN { Play (c,l) }
  | DRAW; LPAREN; l = expr; RPAREN { Draw l }
  | TAKE; LPAREN; c = expr; COMMA; l = expr; RPAREN { Take (c,l) }
  | SHUFFLE; LPAREN; e1 = expr; COMMA; e2 = expr; RPAREN { Shuffle (e1, e2) }
  | END; LPAREN; RPAREN { End () }
  /* Transition Actions */
  /* .... */
  | RULE; e1 = expr; THEN; e2 = expr { Rule(e1, e2) } 
  | CARDPOINT; e1 = expr; THEN; e2 = expr { Rule(e1, e2) }
  | WINCOND; e = expr { WinCondition e }
	| LPAREN; e=expr; RPAREN {e} 
	;
	
(* And that's the end of the grammar definition. *)
