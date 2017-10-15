// Represents a dummy game played in the background of menus
class BackgroundGame extends WordGame {

  void init() {
    initPillarSets();
  }

  // Performs the actions necessary for each frame
  void onTick() {
    moveElements();
    render();
  }

  // Renders one frame of this State
  void render() {
    background(40);

    // Render the Pillars
    renderPillars();

    // Render the Ground
    renderGround();
  }

  // Moves all elements in the game and checks for collisions
  void moveElements() {

    for (PillarSet p : pillars) {
      p.move();
    }
  }
}