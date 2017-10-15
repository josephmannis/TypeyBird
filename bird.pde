// Represents the Bird
class Bird {
  float x;
  float y;
  float vspeed;
  int image_index;

  // initializes the Bird
  Bird() {
    x = birdPosition;
    y = (height / 2);
    vspeed = 0;
    image_index = 0;
  }

  // Renders the bird
  void render() {
    ellipse(x, y, birdSize, birdSize);
  }

  // Sets the speed of this Bird
  void bounce() {
    if (vspeed <= 10) {
      vspeed = -4;
    }
  }

  // Moves this Bird based on vspeed
  void move() {

    if (y + vspeed > height - pillarWidth) {
      y = height - pillarWidth - 1;
      vspeed = 0;
    } else if (y <= 0) {
      y = 1;
      vspeed = 0;
    } else {
      y += vspeed;
    }
  }

  // places the effect of gravity on this Bird
  void gravity() {
    vspeed += gravity;
  }

  float getX() {
    return birdPosition;
  }

  float getY() {
    return y;
  }
}