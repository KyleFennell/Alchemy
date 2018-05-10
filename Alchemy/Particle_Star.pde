class Particle_Star extends Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 2;
  PImage sprite;
  Shape shape;
  color col;

  Particle_Star(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    rebirth();
  }
  
    @Override
  Particle clone(){
    return new Particle_Star(shape, velocity, acceleration, sprite);
  }

  void update() {
    if (isDead()) {
      rebirth();
    }
    pos.add(vel);
  }

  void render() {
    point(pos.x, pos.y);
  }

  void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
  }

  boolean isDead() {
    if (shape.isInside(pos.x, pos.y)) {
      return false;
    }
    return true;
  }

  void capVelocity() {
    if (vel.mag() > maxVelocity) {
      vel.setMag(maxVelocity);
    }
  }

  PVector pos() {
    return pos;
  }
}
