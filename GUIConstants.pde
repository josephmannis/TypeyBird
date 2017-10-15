// Window
static int height_ = 500;
static int width_ = 1000;

// Menus
final color defaultMenuBackground = color(80, 79, 79, 100);
final color defaultMenuStroke = color(255, 246, 184);
final int defaultMenuWidth = (int) (width_ * .6);
final int defaultMenuHeight = (int) ((height_ - pillarWidth) * .8);
static int defaultMenuX = (int) (width_ * .2);
static int defaultMenuY = (int) (height_ * .1);

// Pillars
final color defaultPillarBackground = color(40);
final color defaultPillarStroke = defaultMenuStroke;

// Buttons
final color defaultButtonBackground = defaultMenuBackground;
final color defaultButtonStroke = defaultPillarStroke;

// Text
PFont main;

// GUIComponents

// Main Menu
Menu mainMenu;

// Game Over Menu
Menu gameOverMenu;

// Button to start the word game
ModeSetterButton playWordGame;

// Button to start the char game
ModeSetterButton playCharGame;

// Button to restart the game
ModeSetterButton restartGame;

// Button to return to the main menu
ModeSetterButton returnToMain;

// State
IState lastState;
IState currState;

// Initializes the GUI components
void initGUIConstants() {

  // Main Menu
  mainMenu = new MainMenu(defaultMenuWidth, defaultMenuHeight, defaultMenuX, defaultMenuY, "Typey Bird");

  // Button to start the game
  playWordGame 
    = new ModeSetterButton((float) defaultMenuWidth / 2, defaultMenuHeight * .6, defaultMenuWidth * .6, defaultMenuHeight * .1, "hard mode");

  // Button to enter the options menu
  playCharGame
    = new ModeSetterButton((float) defaultMenuWidth / 2, defaultMenuHeight * .8, defaultMenuWidth * .6, defaultMenuHeight * .1, "easy mode");

  // Game Over menu
  gameOverMenu = new Menu(defaultMenuWidth, defaultMenuHeight, defaultMenuX, defaultMenuY, "You Died!");

  // Button to restart
  restartGame =
    new ModeSetterButton((float) defaultMenuWidth / 2, defaultMenuHeight * .6, defaultMenuWidth * .6, defaultMenuHeight * .1, "restart");

  // Button to return to menu
  returnToMain =
    new ModeSetterButton((float) defaultMenuWidth / 2, defaultMenuHeight * .8, defaultMenuWidth * .6, defaultMenuHeight * .1, "menu");

  playWordGame.setState(new WordGame());
  playCharGame.setState(new CharGame());

  returnToMain.setState(mainMenu);
  restartGame.setState(lastState);
  
  mainMenu.addButton(playCharGame); 
  mainMenu.addButton(playWordGame);
  
  gameOverMenu.addButton(returnToMain);
  gameOverMenu.addButton(restartGame);

  // State
  lastState = new BackgroundGame();
  currState = mainMenu;
}