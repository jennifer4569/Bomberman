# Bomberman
### Jennifer Zhang, Matthew Rabinowitz

Bomberman is a game where you are given a board (m x n) in which each space is either empty or has an obstacle (breakable/unbreakable). There are at most 4 players on the board, where one is the user, and there can be at most 3 enemies on the board. As of now, only 2 players can be on the board: the user and one enemy.
The goal of the game is to be the last player standing. To achieve this goal, each player is given a set number of bombs, and each player can use those bombs to destroy breakable obstacles, get close to their enemies, and eliminate them. 

## Features
- **Main Menu**: You can start your game or exit the game. (Create Level not yet implemented in the Interface)
- **Create level**: You can manually create your own level by using a .txt file. Go to the Main tab in Processing and on Line 12 (the line that says *b = new Board("board1.txt, 20, 10);*)
  - Creating level key characters:
    - **#** : Unbreakable obstacle or wall
    - **-** : Breakable obstacle
    - **P** : Player: You may only have one player in the field
    - **E** : Enemy: You may only have one enemy in the field (As of now)
- **Playing the game**: You can start playing the game by pressing the begin button in the main menu.
  - Controls:
    - Use the up, down, left, right keys to navigate your player (the white player)
    - Press spacebar to place a bomb
    - **r** : Shortcut to restart the game
- **Animation**: Player, enemy, and bombs have animations based on their movements.
  - Individual sprites are available in the Sprites directory.
## Known Bugs
- Create Level button does not work unless all instances of the Begin button is completely commented out.
- Animation for player dying does not work.
- Enemy pathfinder creates an error.


## Development Log
- **May 31, 2017**: Finished the initialization of the board: now the board is randomly sprinkled with obstacles (both unbreakable and breakable)
- **June 2, 2017**: Finished the loading of a level using a given file.
- **June 4, 2017**: Added player to the board, which is placed based on where it is specified in the file
- **June 5, 2017**: Added player movement
- **June 8, 2017**: Added animation for the player and bomb
- **June 9, 2017**: Finished bomb: Now works properly
- **June 10, 2017**: Added Main Menu
- **June 10, 2017**: Added enemy to the board, based on the file