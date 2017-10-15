// Represents a barrier for the Bird
class Pillar {
  // The height of the Pillar
  int height_;

  // The X position of the Pillar
  int x;

  // The Y position of the Pillar
  int y;

  // Indicator for top or bottom
  boolean side;

  Pillar(int height_, int y, int x, boolean side) {
    this.x = x;
    this.y = y;
    this.height_ = height_;
    this.side = side;
  }

  // Draws this Pillar
  void render() {

    pushStyle();
    stroke(defaultPillarStroke);
    fill(defaultPillarBackground);

    if (side) {
      rect(x, y, pillarWidth, height_, 0, 0, 10, 10);
    } else {
      rect(x, y, pillarWidth, height_, 10, 10, 0, 0);
    }

    popStyle();
  }

  // Moves this pillar
  void move() {

    x -= pillarSpeed;
  }

  // Returns the x value of this pillar
  int getX() {
    return this.x;
  }

  // Determines if this pillar is colliding with the Bird
  boolean checkCollision() {
    int widthBound = x + pillarWidth;
    int heightBound = y + height_;
    float birdX = b.getX();
    float birdY = b.getY();
    float birdXWidth = birdX + birdSize / 2;
    float birdYHeight = birdY + birdSize / 2;

    return (birdX <= widthBound)
      && (birdXWidth >= x)
      && (birdY <= heightBound)
      && (birdYHeight >= y);
  }
}