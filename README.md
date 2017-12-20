# Generic_Card_Game_Engine
This is a CS 3110 final project. We made a generic card game engine that takes a card game represented by a JSON file and runs that card game through the terminal via a read-eval-play loop (REPL).

The required packages for our system are: 
- oUnit
- yojson
- str
- ANSITerminal

## Playing a Game
To access and interact with the REPL, make sure that the game JSON is in the 
same folder as the rest of the card engine files, and then run `make play` when 
you are in the correct directory. You should be prompted to input the name of the game json you would like to load. So, for example, if you wanted to play crazy eights, then you would proceed by typing `crazy8.json`.

## Creating a Game (JSON) 
For example JSONs, refer to `blackjack2.json`, `crazy8.json`, and `test.json`. 


The win conditions are certain conditions that, if true, allow a user to win the 
game. The win condition is assigned to whatever player was responsible for 
making that certain condition true. Card points are integer points assigned to 
specific cards in the 52 card deck. And finally, rules are conditions that must
be true in order for a player to be able to play whatever specified after the 
rule. Remember that our engine assumes that all rule are specified in the JSON. 
This means that if you don't exactly specify when a player can do what,
players will not be allowed to make any move. 

## Running the test suite 
To run test.ml, run `make test`. 

## Writing your own game.
If you want to write your own game, we've provided some example jsons to go off
of. Additionally here's some guidelines on how to write some rules for your 
game.

Card Syntax: <<R|S>> (where R is a rank and S is a suit)

Location Syntax: {loc} (where loc is a name of a defined location in the location list)

Player Syntax: p(1-4) (depends on the number of players defined in the json).
t: this player, n: next player, p: previous player

Rules Syntax:
"R: (condition) -> (command to be allowed)"

Win Condition Syntax: 
"WC: (condition)

Card Points (Scoring) Syntax: 
"CP: (condition) -> int

Available Acessors for conditions:
TopCard (location)
Size (location)
Contains ()
