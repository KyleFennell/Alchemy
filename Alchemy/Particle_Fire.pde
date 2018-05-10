class Particle_Fire extends Particle {
  // physics vectors

  Particle_Fire(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    rebirth();
  }

  @Override
  void update() {
    if (super.isDead()) {
      rebirth();
    }
    super.acc = new PVector((random(1)*2-1)*5*acceleration, -acceleration);
    super.vel.add(acc);
    super.capVelocity();
    super.pos.add(vel);
  }
  
  @Override
  Particle clone(){
    return new Particle_Fire(shape, velocity, acceleration, sprite);
  }

  @Override
  void rebirth() {
    super.pos = super.shape.getSpawn();
    super.vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    super.acc = new PVector(0, 0);
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    super.col = color(r, g, 0);
  }
}
