# Generic_Card_Game_Engine
This is a CS 3110 final project. We made a generic card game engine that takes a card game represented by a JSON file and runs that card game through the terminal via a read-eval-play loop (REPL).

## Setup
The required packages for our system are: 
- oUnit
- yojson
- str
- ANSITerminal
- Base

Make sure you're running `OCaml 4.05.0`. You can switch to this version by running
```
opam switch -y 4.05.0
eval `opam config env`
make distclean
```

## Playing a Game
To access and interact with the REPL, make sure that the game JSON is in the 
same folder as the rest of the card engine files, and then run `make play` when 
you are in the correct directory. You should be prompted to input the name of the game json you would like to load. So, for example, if you wanted to play crazy eights, then you would proceed by typing `crazy8.json`. There should be more detailed directions within the REPL regarding how to play the individual card game.

## Creating a Game (JSON) 
For example JSONs, refer to `blackjack2.json`, `crazy8.json`, and `test.json`. 

We divided a generic card game into two parts:
1. placement data
2. action data.

*Placement data* is relatively easy to parse. It consists of the **locations** of a card game, which is thought of as the places where cards can reside, along with the number of players (since the player's hands are considered locations). For most card games, you'll only need a couple of locations: a discard pile, a draw pile, and each player's hand. However, for other games you may need less or more. For example, in Gin Rummy, you'll need a separate location for all runs and melds each player has made.

The other parts of the placement data include the **number of cards** to initially deal in each location. Currently our system only supports randomly dealing cards to each location, so you can't specify things like "p1's hand should start with an ace of spades." Also a part of the placement data is whether a location is **visible** or not. By default, each player's hand is visible during their own turn, but you can also specify whether their hands should be visible throughout (so e.g. in blackjack, the dealer's hand is always visible to everyone). Also, setting a nonplayer location to visible will only show the topcard currently there. So for example, if you only want players to see the topcard of the discard pile, just set the discard pile to visible. 

There are three parts to the *action data*:
1. Win conditions
2. Scoring conditions
3. Playing rules.

The **win conditions** are a set of booleans such that a player is considered a winner when any one of the booleans are true according to a given state. 

The **scoring conditions** are a list of (boolean, integer) pairs. When a player's hand is scored, the engine will check every boolean and if any evaluate to true, it will add the associated integer to the player's score. Hence, the score is accumulated as the booleans are read.

The **playing rules** define what a player can do during his/her turn. They are formatted as (boolean, action) pairs where an action is an input command from the player, e.g. DRAW or END. In order for an action *a* to be executed it must match some pair (boolean, *a*) in the playing rules where boolean evaluates to true in that state. 

Finally, there's json data specific to the game engine. This isn't really a part of a card game but rather is necessary for playing the game on our system. This category of data consists of
- default action locations (e.g. the player can type DRAW rather than DRAW DISCARD if the default draw location is the discard pile)
- player AIs (if there are any)
- an intro message
- a help message

## Running the test suite 
To run test.ml, run `make test`. 

## Writing your own game.
If you want to write your own game, we've provided some example jsons to go off
of. Additionally here's some guidelines on how to write some rules for your 
game.

Card Syntax: `<<R|S>>` (where R is a rank and S is a suit)

Location Syntax: `{loc}` (where loc is a name of a defined location in the location list)

Player Syntax: p(1-4) (depends on the number of players defined in the json).
t: this player, n: next player, p: previous player, e.g. `Size(p1)` is the size of player one's hand, `Size(t)` is the size of the current player's hand.

Rules Syntax:
"R: (condition) -> (command to be allowed)"

Win Condition Syntax: 
"WC: (condition)

Card Points (Scoring) Syntax: 
"CP: (condition) -> int

Available Acessors for conditions:
`HighScore()`
`TopCard(location)`
`Size (location)`
`Contains(location, cards)`


## Using in utop
First make sure the project has been built by running e.g. `make test`. Navigate
to the `_build` directory and when inside it run `utop` and run

```
#require "Base";;
#require "yojson";;
#load "ast.cmo";;
#load "command.cmo";;
#load "lexer.cmo";;
#load "parser.cmo";;
#load "state.cmo";;
#use "state.ml";;
```