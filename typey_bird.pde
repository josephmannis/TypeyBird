import java.util.Random;
import java.nio.file.*;
import java.io.LineNumberReader;
import java.io.FileReader;

void setup() {
  size(1000, 500);
  frameRate(60);
  ellipseMode(CENTER);

  initGUIConstants();
  lastState.init();
  currState.init();
}

void draw() {
  currState.onTick();
}

void keyPressed() {
  currState.onKeyPressed();
}

void mouseReleased() {
  currState.onMouseReleased();
}