# hangman

psuedocode:

At start of game:
Select Random Word (5-12 char length), display word  ( _ _ _ _ _ )

Each Turn:
Take in guess (case insensitive) -> update word ( a _ _ _ ) or letters used bank -> check for win/loss -> update turns left to guess

Win:
Display Word -> Congratulate player

Loss:
Condolences -> Show correct word


Classes:
Human Player (makes letter guesses, can also try and guess the whole word)
GameBoard (acts as cpu, picks word, updates word/letters used bank)
Game (Facilitates the game)


