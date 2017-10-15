// Represents a menu that the user can use to change elements about the application
class Menu extends IState {
  // the width of this Menu
  int menuWidth;

  // the height of this Menu
  int menuHeight;

  // the xPosition of this Menu
  int xPos;

  // the yPosition of this Menu
  int yPos;

  // The list of buttons present on this Menu
  ArrayList<AButton> buttons;
  
  // The title of this Menu
  String title;

  Menu(int menuWidth, int menuHeight, int xPos, int yPos, String title) {
    // Check for errors!
    this.menuWidth = menuWidth;
    this.menuHeight = menuHeight;
    this.xPos = xPos;
    this.yPos = yPos;
    this.buttons = new ArrayList<AButton>();
    this.title = title;
  }

  void init() {
    main = loadFont("mainFont.vlw");
  }

  void onTick() {
    lastState.onTick();
    render();
  }

  void render() {
    pushStyle();
    stroke(defaultMenuStroke);
    fill(defaultMenuBackground);
    rect(xPos, yPos, menuWidth, menuHeight);
    
    fill(defaultMenuStroke);
    textAlign(CENTER);
    textFont(main);
    rectMode(CENTER);
    textSize(48);
    text(title, xPos + (menuWidth / 2), yPos + (menuHeight * .3));
    popStyle();

    renderButtons();
  }

  // Renders all of the Buttons in this Menu
  void renderButtons() {
    for (AButton b : buttons) {
      b.render();
    }
  }

  void onMouseReleased() {
    for (AButton b : buttons) {
      b.mouseAction();
    }
  }

  void onKeyPressed() {
  }

  // Gets the x Position of this menu
  int getX() {
    return this.xPos;
  }

  // Gets the y Position of this Menu
  int getY() {
    return this.yPos;
  }

  // Gets the width of this menu
  int getWidth() {
    return menuWidth;
  }

  // Gets the ehgiht of this menu
  int getHeight() {
    return menuHeight;
  }

  // Adds a button to this button array
  void addButton(AButton b) {
    b.setParent(this);
    buttons.add(b);
  }
}