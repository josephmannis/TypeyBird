class PillarSet {
  Pillar top;
  Pillar bot;

  PillarSet() {
    generatePillarSet(width - 50);
  }

  PillarSet(int x) {
    generatePillarSet(x);
  }

  void generatePillarSet(int x) {
    int gapSize = rand.nextInt((maxGapSize - minGapSize) + 1) + minGapSize;
    int pillarSpace = height - gapSize;
    double heightDistribution = rand.nextDouble();
    int topHeight = (int) (pillarSpace * heightDistribution);
    int botHeight = pillarSpace - topHeight;

    top = new Pillar(topHeight, 0, x, true);
    bot = new Pillar(botHeight, height - botHeight, x, false);
  }

  void move() {
    if (top.getX() <= -pillarWidth - 10) {
      reset();
    } else {
      top.move();
      bot.move();
    }

    if (top.getX() == birdPosition - pillarWidth) {
      updateScore();
    }
  }

  // Updates the Score of this game
  void updateScore() {
    score++;

    int newDiff = score / 10 + 1;

    if (difficulty >= 5) {
      difficulty = 5;
    } else {
      difficulty = newDiff;
    }
  }

  void render() {
    top.render();
    bot.render();
  }

  void reset() {
    generatePillarSet(width - pillarWidth);
  }

  boolean checkCollision() {
    return top.checkCollision() ||
      bot.checkCollision();
  }
}