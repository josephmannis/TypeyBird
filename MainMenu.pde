class MainMenu extends Menu {
  MainMenu(int menuWidth, int menuHeight, int xPos, int yPos, String title) {
    // Check for errors!
    super( menuWidth, menuHeight, xPos, yPos, title);
  } 

  void init() {
    main = loadFont("mainFont.vlw");
    lastState = new BackgroundGame();
  }
}