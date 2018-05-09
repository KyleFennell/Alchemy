class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  final float velocity = 2;
  final float acceleration = 0;

  Dot(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
    acc = new PVector((random(1)*2-1)*acceleration, (random(1)*2-1)*acceleration);
  }

  void update() {
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
    if (pos.x > width){
      pos.x = 0;
    }
    if (pos.y > height){
      pos.y = 0;
    }
    vel.add(acc);
    pos.add(vel);
  }

  float x() {
    return pos.x;
  }

  float y() {
    return pos.y;
  }
}
