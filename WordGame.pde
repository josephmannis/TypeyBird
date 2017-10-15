// A form of the Game that requires the user to input the entirety of the given word in order to flap
class WordGame extends IState {

  // Initialize the game
  void init() {
    restartGame.setState(this);
    b = new Bird();

    initPillarSets();
    initFileLimits();

    score = 0;
    difficulty = 1;
    curr = "";
    resetGoal();

    gameStarted = false;
    gameOver = false;
  }

  // Determine the size of each of the provided dictionaries for purposes of selecting a new goal string
  void initFileLimits() {
    try {
      for (int i = 1; i < 6; i++) {
        String path = sketchPath("dictionaries/") + i + ".txt";
        LineNumberReader lnr = new LineNumberReader(new FileReader(new File(path)));
        lnr.skip(Long.MAX_VALUE);
        difficultyFileLimits.put(i, lnr.getLineNumber());
        lnr.close();
      }
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  // Initialize all of the Sets of pillars to be used
  void initPillarSets() {
    pillars = new ArrayList<PillarSet>();
    for (int i = 1; i < numPillars + 1; i++) {
      pillars.add(new PillarSet((width - i * 250) + 1000));
    }
  }

  // Performs the actions necessary for each frame
  void onTick() {
    if (!gameOver) {
      moveElements();
    }

    render();
  }

  // Renders one frame of this State
  void render() {
    background(40);

    // Render the bird
    b.render();

    // Render the Pillars
    if (gameStarted) {
      renderPillars();
    }

    // Render the Ground
    renderGround();

    // Render GUI
    renderGameGUI();
  }

  // Renders the ground
  void renderGround() {
    int y = height - pillarWidth;
    pushStyle();
    stroke(defaultPillarStroke);
    fill(defaultPillarBackground);
    rect(-1, y, width + 1, pillarWidth);
    popStyle();
  }

  // Renders the Score, Current Text, and Goal Text
  void renderGameGUI() {
    int boxSize = width / 3;
    pushStyle();
    textFont(main);
    textAlign(CENTER);

    stroke(defaultPillarStroke);
    fill(color(40, 40, 40, 200));

    rect(boxSize, -1, boxSize, boxSize / 3, 0, 0, 10, 10);

    fill(defaultPillarStroke);
    text(goal.toUpperCase(), boxSize + (boxSize / 2), 36);
    text(curr.toUpperCase(), boxSize + (boxSize / 2), 72);

    String s = "Score: " + score;
    text(s, (s.length() / 2) * 36, 36);

    popStyle();
  }

  // Renders the pillars
  void renderPillars() {
    for (PillarSet p : pillars) {
      p.render();
    }
  }

  // Moves all elements in the game and checks for collisions
  void moveElements() {
    if (gameStarted) {
      b.gravity(); 
      b.move();

      for (PillarSet p : pillars) {
        p.move();
        if (p.checkCollision()) {
          gameOver = true;
          lastState = this;
          currState = gameOverMenu;
        }
      }
    }
  }

  // Performs Mouse actions for this State
  void onMouseReleased() {
  }

  // Performs key pressed actions for this State
  void onKeyPressed() {
    int len = curr.length();
    if (!gameStarted) {
      gameStarted = true;
      b.bounce();
    } else {
      switch (key) {
      case BACKSPACE:
        if (len != 0) {
          curr = curr.substring(0, curr.length() - 1);
        }
        break;

      case ' ':
        if (curr.equals(goal)) {
          b.bounce();
          resetGoal();
          curr = "";
        }
        break;

      case TAB:
        init();
        break;

      default: 
        if (curr.length() < difficulty) {
          if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z')) {
            String k = Character.toString(key);
            curr += k.toLowerCase();
          }
        }
        break;
      }
    }
  }

  // Sets the goal String to something new
  void resetGoal() {
    try {
      int line = rand.nextInt(difficultyFileLimits.get(difficulty));

      String n = Files.readAllLines(Paths.get(sketchPath("") + "dictionaries/" + difficulty + ".txt")).get(line);
      goal = n.toLowerCase();
    } 
    catch (IOException e) {
      println("Could not find line.");
    }
  }
}