# Machine Learning Funsies Projects

## First Project -- Reinforcement Learning Tic-Tac-Toe
#### *A little evening project over a glass of whiskey--so excuse any sloppy code*

I've written an incredibly *dumb* CLI tic tac toe robot that randomly guesses all its moves. If it happens to win, however, it assigns a positive weight to all the moves that led up to its winning move, which gets a special `WINNING MOVE` weight. To speed up its learning, you can have it play random games with itself (30k games ony takes a second or two, so why not?).

Once you're happy that the computer is sufficiently educated (100k games should be plenty), you can play the computer and see how it does.

***NOTE: CLI games are the only kind of games worth playing--the only thing this project needs is more ASCII art***
