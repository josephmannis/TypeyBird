// A button that sets the mode
class ModeSetterButton extends AButton {
  IState toSet;

  ModeSetterButton(float xPos, float yPos, float buttonWidth, float buttonHeight, String label) {
    super(xPos, yPos, buttonWidth, buttonHeight, label);
  }

  void mouseAction() {

    if (isClicked()) {
    //  lastState = currState;
      toSet.init();
      currState = toSet;
    }
  }
  
  // Sets the State to set for this button
  void setState(IState s) {
    this.toSet = s;
  }
}