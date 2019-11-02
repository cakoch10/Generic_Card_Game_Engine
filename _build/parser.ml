
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WINCOND
    | VERTLINE
    | TURNS
    | TRUE
    | TOPCARDOF
    | THISPLAYER of (
# 23 "parser.mly"
       (string)
# 16 "parser.ml"
  )
    | THEN
    | TAKE
    | SUIT
    | STRING of (
# 23 "parser.mly"
       (string)
# 24 "parser.ml"
  )
    | SIZEOF
    | SHUFFLE
    | SEMI
    | SCORE
    | RULE
    | RPAREN
    | PLUS
    | PLAYERID of (
# 23 "parser.mly"
       (string)
# 36 "parser.ml"
  )
    | PLAY
    | OR
    | NEXTPLAYER of (
# 23 "parser.mly"
       (string)
# 43 "parser.ml"
  )
    | NEQ
    | MULT
    | LT
    | LPAREN
    | LOCOPEN
    | LOCCLOSE
    | LEQ
    | LASTPLAYER of (
# 23 "parser.mly"
       (string)
# 55 "parser.ml"
  )
    | INT of (
# 22 "parser.mly"
       (int)
# 60 "parser.ml"
  )
    | HIGHSCORE
    | GT
    | GEQ
    | GENERICPLAYER of (
# 23 "parser.mly"
       (string)
# 68 "parser.ml"
  )
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
    | ALLPLAYERS of (
# 23 "parser.mly"
       (string)
# 92 "parser.ml"
  )
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState155
  | MenhirState147
  | MenhirState142
  | MenhirState138
  | MenhirState129
  | MenhirState126
  | MenhirState120
  | MenhirState118
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState110
  | MenhirState108
  | MenhirState106
  | MenhirState104
  | MenhirState102
  | MenhirState100
  | MenhirState98
  | MenhirState96
  | MenhirState84
  | MenhirState63
  | MenhirState53
  | MenhirState51
  | MenhirState50
  | MenhirState23
  | MenhirState21
  | MenhirState18
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState11
  | MenhirState9
  | MenhirState6
  | MenhirState3
  | MenhirState1
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 151 "parser.ml"

let rec _menhir_goto_separated_nonempty_list_SEMI_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
    ( x )
# 163 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMI_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 243 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
    ( x :: xs )
# 175 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMI_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        ();
        Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
        assert false

and _menhir_run98 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98

and _menhir_run100 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run102 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_run104 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

and _menhir_run106 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106

and _menhir_run108 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108

and _menhir_run110 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_run112 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112

and _menhir_run114 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

and _menhir_run116 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run118 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_run120 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_goto_loption_separated_nonempty_list_SEMI_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CARDRANGECLOSE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (xs : (Ast.expr list))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.expr) = let lst = 
# 232 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
    ( xs )
# 1088 "parser.ml"
         in
        
# 163 "parser.mly"
    ( CardList (lst) )
# 1093 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce1 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 22 "parser.mly"
       (int)
# 1106 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (i : (
# 22 "parser.mly"
       (int)
# 1112 "parser.ml"
    ))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 121 "parser.mly"
           ( Int i )
# 1117 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | CARDRANGECLOSE | COMMA | EOF | RPAREN | SEMI | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 184 "parser.mly"
                                          ( Rule(e1, e2) )
# 1270 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 139 "parser.mly"
                               (Add (e1, e2))
# 1287 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | CARDRANGECLOSE | COMMA | EOF | RPAREN | SEMI | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 151 "parser.mly"
                             ( Or(e1, e2) )
# 1326 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 149 "parser.mly"
                              ( Neq(e1, e2) )
# 1343 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 141 "parser.mly"
                               (Mult (e1, e2))
# 1354 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 144 "parser.mly"
                             ( Lt(e1,e2) )
# 1365 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 147 "parser.mly"
                             ( Leq(e1,e2) )
# 1376 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 145 "parser.mly"
                             ( Gt(e1,e2) )
# 1387 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState112 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 146 "parser.mly"
                              ( Geq(e1,e2) )
# 1398 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 148 "parser.mly"
                              ( Eq(e1, e2) )
# 1409 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 143 "parser.mly"
                                    ( DoubleNeq(e1, e2) )
# 1420 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 142 "parser.mly"
                                   ( DoubleEq(e1, e2) )
# 1431 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | CARDRANGECLOSE | COMMA | EOF | RPAREN | SEMI | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                              ( And(e1, e2) )
# 1470 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState126 | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126)
        | CARDRANGECLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 241 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
    ( [ x ] )
# 1587 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMI_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (l : (Ast.expr))), _, (c : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 167 "parser.mly"
                                                      ( Contains (l,c) )
# 1745 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
        let _1 = () in
        let _v : (Ast.expr) = 
# 140 "parser.mly"
                    (Neg e)
# 1762 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (l : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 177 "parser.mly"
                                   ( Draw l )
# 1805 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 186 "parser.mly"
                          (e)
# 1853 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState138
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (l : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 176 "parser.mly"
                                                   ( Play (c,l) )
# 2011 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | CARDRANGECLOSE | COMMA | EOF | RPAREN | SEMI | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 183 "parser.mly"
                                     ( Rule(e1, e2) )
# 2165 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (p : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 175 "parser.mly"
                                    ( Score p )
# 2214 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState147 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 179 "parser.mly"
                                                         ( Shuffle (e1, e2) )
# 2372 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (l : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 166 "parser.mly"
                                     ( Size l )
# 2421 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (c : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 172 "parser.mly"
                                   ( Suit c )
# 2470 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALLPLAYERS _v ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | CARDOPEN ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CARDPOINT ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CARDRANGEOPEN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CARDSDRAWN ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CARDSPLAYED ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CARDSTAKEN ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | CONTAINS ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | DASH ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | DRAW ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | END ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | FALSE ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | GENERICPLAYER _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | HIGHSCORE ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | INT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | LASTPLAYER _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | LOCOPEN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | LPAREN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | NEXTPLAYER _v ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | PLAY ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | PLAYERID _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | RULE ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | SCORE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | SHUFFLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | SIZEOF ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | SUIT ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | TAKE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | THISPLAYER _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | TOPCARDOF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | TRUE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | TURNS ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | WINCOND ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState155 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (l : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 178 "parser.mly"
                                                    ( Take (c,l) )
# 2628 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (l : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 165 "parser.mly"
                                        ( TopCard l )
# 2677 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (p : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 173 "parser.mly"
                                    ( Turns p )
# 2726 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | CARDRANGECLOSE | COMMA | EOF | RPAREN | SEMI | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 185 "parser.mly"
                      ( WinCondition e )
# 2771 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLEEQ ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLENEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 61 "parser.mly"
       (Ast.expr)
# 2799 "parser.ml"
            ) = 
# 93 "parser.mly"
                 ( e )
# 2803 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 61 "parser.mly"
       (Ast.expr)
# 2810 "parser.ml"
            )) = _v in
            Obj.magic _1
        | EQ ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState155 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState147 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState112 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 128 "parser.mly"
         ( Bool true )
# 3154 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 3247 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (t : (
# 23 "parser.mly"
       (string)
# 3255 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 123 "parser.mly"
                   ( Player t )
# 3260 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 3772 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (p : (
# 23 "parser.mly"
       (string)
# 3780 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 122 "parser.mly"
                 ( Player p )
# 3785 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 3878 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (n : (
# 23 "parser.mly"
       (string)
# 3886 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 124 "parser.mly"
                   ( Player n )
# 3891 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (a : (
# 23 "parser.mly"
       (string)
# 3989 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 135 "parser.mly"
                                      ( Location a )
# 3996 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | GENERICPLAYER _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (p : (
# 23 "parser.mly"
       (string)
# 4018 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 134 "parser.mly"
                                         ( Location p )
# 4025 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | LASTPLAYER _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (l : (
# 23 "parser.mly"
       (string)
# 4047 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 133 "parser.mly"
                                      ( Location l )
# 4054 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | NEXTPLAYER _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (n : (
# 23 "parser.mly"
       (string)
# 4076 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 132 "parser.mly"
                                      ( Location n )
# 4083 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | PLAYERID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (p : (
# 23 "parser.mly"
       (string)
# 4105 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 130 "parser.mly"
                                    ( Location p )
# 4112 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (l : (
# 23 "parser.mly"
       (string)
# 4134 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 136 "parser.mly"
                                  ( Location l )
# 4141 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | THISPLAYER _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LOCCLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (t : (
# 23 "parser.mly"
       (string)
# 4163 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 131 "parser.mly"
                                      ( Location t )
# 4170 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 4189 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (l : (
# 23 "parser.mly"
       (string)
# 4197 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 126 "parser.mly"
                   ( Player l )
# 4202 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 4209 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 171 "parser.mly"
                              ( HighScore () )
# 4238 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 4257 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (p : (
# 23 "parser.mly"
       (string)
# 4265 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 125 "parser.mly"
                      ( Player p )
# 4270 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 129 "parser.mly"
         ( Bool false )
# 4282 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 180 "parser.mly"
                        ( End () )
# 4308 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALLPLAYERS _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | CARDOPEN ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CARDPOINT ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CARDRANGEOPEN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CARDSDRAWN ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CARDSPLAYED ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CARDSTAKEN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CONTAINS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | DASH ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | DRAW ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | END ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | FALSE ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | GENERICPLAYER _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | HIGHSCORE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | INT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | LASTPLAYER _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | LOCOPEN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LPAREN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NEXTPLAYER _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | PLAY ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PLAYERID _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | RULE ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SCORE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SHUFFLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SIZEOF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SUIT ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TAKE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | THISPLAYER _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | TOPCARDOF ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TRUE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TURNS ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | WINCOND ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 170 "parser.mly"
                               ( CardsTaken () )
# 4593 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 168 "parser.mly"
                                ( CardsPlayed () )
# 4631 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 169 "parser.mly"
                               ( CardsDrawn () )
# 4669 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState63 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | VERTLINE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | STRING _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | CARDRANGECLOSE ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _, (l : (
# 22 "parser.mly"
       (int)
# 4755 "parser.ml"
                            ))), (h : (
# 22 "parser.mly"
       (int)
# 4759 "parser.ml"
                            ))), (s : (
# 23 "parser.mly"
       (string)
# 4763 "parser.ml"
                            ))) = _menhir_stack in
                            let _7 = () in
                            let _5 = () in
                            let _3 = () in
                            let _1 = () in
                            let _v : (Ast.expr) = 
# 154 "parser.mly"
                   ( CardRange (string_of_int l, string_of_int h, s) )
# 4772 "parser.ml"
                             in
                            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | STRING _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | VERTLINE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | STRING _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | CARDRANGECLOSE ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _, (l : (
# 22 "parser.mly"
       (int)
# 4817 "parser.ml"
                            ))), (h : (
# 23 "parser.mly"
       (string)
# 4821 "parser.ml"
                            ))), (s : (
# 23 "parser.mly"
       (string)
# 4825 "parser.ml"
                            ))) = _menhir_stack in
                            let _7 = () in
                            let _5 = () in
                            let _3 = () in
                            let _1 = () in
                            let _v : (Ast.expr) = 
# 156 "parser.mly"
                   ( CardRange (string_of_int l, h, s) )
# 4834 "parser.ml"
                             in
                            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | AND | CARDRANGECLOSE | DOUBLEEQ | DOUBLENEQ | EQ | GEQ | GT | LEQ | LT | MULT | NEQ | OR | PLUS | SEMI ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState63 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | VERTLINE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | STRING _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | CARDRANGECLOSE ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _, (l : (
# 23 "parser.mly"
       (string)
# 4925 "parser.ml"
                            ))), (h : (
# 22 "parser.mly"
       (int)
# 4929 "parser.ml"
                            ))), (s : (
# 23 "parser.mly"
       (string)
# 4933 "parser.ml"
                            ))) = _menhir_stack in
                            let _7 = () in
                            let _5 = () in
                            let _3 = () in
                            let _1 = () in
                            let _v : (Ast.expr) = 
# 158 "parser.mly"
                   ( CardRange (l, string_of_int h, s) )
# 4942 "parser.ml"
                             in
                            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | STRING _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | VERTLINE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | STRING _v ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | CARDRANGECLOSE ->
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let _menhir_env = _menhir_discard _menhir_env in
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let ((((_menhir_stack, _menhir_s), _, (l : (
# 23 "parser.mly"
       (string)
# 4987 "parser.ml"
                            ))), (h : (
# 23 "parser.mly"
       (string)
# 4991 "parser.ml"
                            ))), (s : (
# 23 "parser.mly"
       (string)
# 4995 "parser.ml"
                            ))) = _menhir_stack in
                            let _7 = () in
                            let _5 = () in
                            let _3 = () in
                            let _1 = () in
                            let _v : (Ast.expr) = 
# 160 "parser.mly"
                   ( CardRange (l, h, s) )
# 5004 "parser.ml"
                             in
                            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let _menhir_stack = Obj.magic _menhir_stack in
                            let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CARDRANGECLOSE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState63 in
        let _v : (Ast.expr list) = 
# 142 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
    ( [] )
# 5057 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMI_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VERTLINE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | STRING _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | CARDCLOSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), (r : (
# 22 "parser.mly"
       (int)
# 5170 "parser.ml"
                    ))), (s : (
# 23 "parser.mly"
       (string)
# 5174 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Ast.expr) = 
# 137 "parser.mly"
                                                       ( Card(string_of_int r, s) )
# 5182 "parser.ml"
                     in
                    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VERTLINE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | STRING _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | CARDCLOSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), (r : (
# 23 "parser.mly"
       (string)
# 5227 "parser.ml"
                    ))), (s : (
# 23 "parser.mly"
       (string)
# 5231 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Ast.expr) = 
# 138 "parser.mly"
                                                          ( Card(r, s) )
# 5239 "parser.ml"
                     in
                    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 5270 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (a : (
# 23 "parser.mly"
       (string)
# 5278 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 127 "parser.mly"
                   ( Player a )
# 5283 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 61 "parser.mly"
       (Ast.expr)
# 5302 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALLPLAYERS _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CARDOPEN ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CARDPOINT ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CARDRANGEOPEN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CARDSDRAWN ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CARDSPLAYED ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CARDSTAKEN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CONTAINS ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DASH ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DRAW ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | END ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FALSE ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GENERICPLAYER _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | HIGHSCORE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LASTPLAYER _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LOCOPEN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEXTPLAYER _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | PLAY ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PLAYERID _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | RULE ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SCORE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SHUFFLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SIZEOF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SUIT ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TAKE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | THISPLAYER _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | TOPCARDOF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TRUE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TURNS ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | WINCOND ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "/Users/temp_account/.opam/4.05.0/lib/menhir/standard.mly"
  

# 5388 "parser.ml"
