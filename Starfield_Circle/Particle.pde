class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector origin = new PVector(width/2, height/2);
  final float velocity = 2;
  final float acceleration = 0;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
    acc = new PVector((random(1)*2-1)*acceleration, (random(1)*2-1)*acceleration);
  }

  void update() {
    origin = new PVector(width/2, height/2);
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    pos.add(vel);
  }

  boolean isDead() {
    if (dist(pos.x, pos.y, width/2, height/2) < height/3) {
      return false;
    }
    return true;
  }

  void rebirth() {
    pos = new PVector(random(-1, 1), random(-1, 1));
    pos.normalize().mult(height/3).add(origin);
  }

  float x() {
    return pos.x;
  }

  float y() {
    return pos.y;
  }
}
