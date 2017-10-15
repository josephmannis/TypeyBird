// Represents a game type where the player has to type the next character in a string to flap
class CharGame extends WordGame {
  int currChar = 0;

  // Initialize the game
  void init() {
    restartGame.setState(this);

    main = loadFont("mainFont.vlw");
    b = new Bird();

    initPillarSets();
    initFileLimits();

    score = 0;
    difficulty = 5;
    curr = "";
    resetGoal();

    currChar = 0;

    gameStarted = false;
    gameOver = false;
  }

  // Performs key pressed actions for this State
  void onKeyPressed() {
    if (!gameStarted) {
      gameStarted = true;
      checkKey();
      b.bounce();
    } else {
      checkKey();
    }
  }

  // Determines the key pressed and performs an action
  void checkKey() {
    switch (key) {
    case TAB:
      init();
      break;

    default: 
      if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) {
        if (currChar == goal.length() - 1) {
          b.bounce();
          resetGoal();
          curr = "";
          currChar = 0;
        } else if (key == goal.charAt(currChar)) {
          b.bounce();
          curr += Character.toLowerCase(key);
          currChar++;
        }
      }
      break;
    }
  }
}