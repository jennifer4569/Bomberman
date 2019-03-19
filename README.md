# Bomberman
### Jennifer Zhang, Matthew Rabinowitz

## Introduction
Bomberman is a game where you are given a board (m x n) in which each space is either empty or has an obstacle (breakable/unbreakable). There are at most 4 players on the board, where one is the user, and there can be at most 3 enemies on the board. As of now, only 2 players can be on the board: the user and one enemy.
The goal of the game is to be the last player standing. To achieve this goal, each player is given a set number of bombs, and each player can use those bombs to destroy breakable obstacles, get close to their enemies, and eliminate them. 

## Setup
Follow the following steps to ensure that your game is installed properly.
1. Download Processing. (If you already have Processing, you may skip this step.)
   - Go to https://processing.org/download/
   - Follow the instructions on downloading Processing.
2. Clone this repository.
   - Open your terminal
     - Windows: Windows Key, search for "Command Prompt"
     - Linux: Ctrl + Alt + T
   - Run the following command:
     ``git clone https://github.com/jennifer4569/Bomberman.git``
3. Open any of the .pde files in your newly cloned Bomberman repository using Processing
   - Click on "Sketch" on the toolbar at the top
   - Click on "Import Library"
   - Click on "Add Library..."
   - Go to the search bar on the top, and search "ControlP5"
   - Click "Install", located on the bottom right corner.
4. Now you should be able to run our game! Press *Play*, the triangle-like button below the "Sketch" button, to start our game.
   - **NOTE**: If the game freezes or crashes due to unknown reasons, and becomes unresponsive, click the "Stop" button right next to the "Play" button.

## Controls
- Use the up, down, left, right keys to navigate your player (the white player)
- Press spacebar to place a bomb
- **r** : Shortcut to restart the game
    
## Features
- **Main Menu**: You can start your game or exit the game. (Create Level not yet implemented in the Interface)
- **Animation**: Player, enemy, and bombs have animations based on their movements.
  - Individual sprites are available in the Sprites directory.
- **Enemy**: Enemy pathfinds its way to the user, bombing obstacles in the way and attacking the user when it is nearby
- **Create level**: You can manually create your own level by using a .txt file.

## Creating a Level
```diff 
- NOTE: Due to an unknown bug, we have temporarily disabled this feature.
```
- Creating level key characters (manually):
  - **#** : Unbreakable obstacle or wall: The board must be surrounded by a layer of unbreakable obstacles
  - **-** : Breakable obstacle
  - **P** : Player: You may only have one player in the field
  - **E** : Enemy: You may only have one enemy in the field (As of now)
  - Changing the default game board:
    - Go to the Main tab in Processing, and refer to Line 12 (the line that says *b = new Board("board4.txt", 20, 10);*) 
    - Change the *board4.txt* to the name of the new default game file.

- Creating level key characters (using interface):
  Place your mouse on the tile you want to put your obstacle or player in, and then press one of the corresponding shortcut keys:
  - **#**, **1** : Unbreakable obstacle or wall
  - **-**, **2** : Breakable obstacle
  - **P**, **3** : Player
  - **E**, **4** : Enemy
  - **BACKSPACE** : Delete the obstacle or player in this area
  - **ENTER** : Save this into the default file, board4.txt
    - To change this default save file, go to the Board tab in Processing, and refer to Line 242, which says: *PrintWriter file = createWriter("board4.txt");*
    - Change the *board4.txt* to the name of the new default save file.

## Known Bugs
- Create Level button does not work unless all instances of the Begin button is completely commented out.
- Animation for player dying does not work.
- Placing a bomb (both user and enemy) will completely cover the player, which will sometimes create a problem because the player could be trapped with no way to move, and it cannot be seen. This will make it seem as if the player has disappeared, since after the bomb explodes, the player dies.
- Game will sometimes crash if multiple bombs are placed in the same area, and kill the player at the same time
- Game will crash if the board is not surrounded by unbreakable obstacles
- Load level will crash if you create a level with more than one player/enemy

## Development Log
- **May 31, 2017**: Finished the initialization of the board: now the board is randomly sprinkled with obstacles (both unbreakable and breakable)
- **June 2, 2017**: Finished the loading of a level using a given file.
- **June 4, 2017**: Added player to the board, which is placed based on where it is specified in the file
- **June 5, 2017**: Added player movement
- **June 8, 2017**: Added animation for the player and bomb
- **June 9, 2017**: Finished bomb: Now works properly
- **June 10, 2017**: Added Main Menu
- **June 10, 2017**: Added enemy to the board, based on the file
- **June 11, 2017**: Enemy now has pathfinder and can move/bomb its way to the user, and attack the user
- **June 11, 2017**: Enemy has animation
- **June 11, 2017**: You can now create levels
