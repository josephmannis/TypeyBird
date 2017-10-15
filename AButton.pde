// Represents a Button
abstract class AButton {
  float xPos;
  float yPos;
  float buttonWidth;
  float buttonHeight;
  String label;
  Menu parent;

  AButton(float xPos, float yPos, float buttonWidth, float buttonHeight, String label) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.label = label;
  }

  // Determines if this Button has been clicked
  boolean isClicked() {
    int xOffset = parent.getX();
    int yOffset = parent.getY();

    return (mouseX >= xPos)
      && (mouseX <= xOffset + xPos + buttonWidth)
      && (mouseY >= yPos)
      && (mouseY <= yOffset + yPos + buttonHeight);
  }

  // Renders this button
  void render() {
    int xOffset = parent.getX();
    int yOffset = parent.getY();

    pushStyle();
    rectMode(CENTER);

    stroke(defaultButtonStroke);
    fill(defaultButtonBackground);

    rect(xPos + xOffset, yPos + yOffset, buttonWidth, buttonHeight);

    fill(defaultButtonStroke);
    textFont(main);
    textAlign(CENTER);

    text(label, xPos + xOffset, yPos + yOffset, buttonWidth, buttonHeight - 10);  

    if (isClicked()) {
      fill(color(defaultButtonStroke, 50));
      rect(xPos + xOffset, yPos + yOffset, buttonWidth, buttonHeight);
    }

    popStyle();
  }

  // Sets the given Menu as this Buttons parent
  void setParent(Menu m) {
    this.parent = m;
  }

  // The action for this AButton when pressed
  abstract void mouseAction();
}