  // Represents the State of the application, i.e., a menu, the game, etc.
abstract class IState {
  
  // Initializes this State
  abstract void init();
  
  // Performs the actions necessary for each frame
  abstract void onTick();

  // Renders one frame of this State
  abstract void render();

  // Performs Mouse actions for this State
  abstract void onMouseReleased();

  // Performs key pressed actions for this State
  abstract void onKeyPressed();

}