class Particle_Water extends Particle {

  Particle_Water(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    rebirth();
  }
  
    @Override
  Particle clone(){
    return new Particle_Water(shape, velocity, acceleration, sprite);
  }
@Override
  void update() {
    if (isDead()) {
      rebirth();
    }
    super.vel.add(acc);
    capVelocity();
    super.pos.add(vel);
  }

@Override
  void rebirth() {
    super.pos = super.shape.getSpawn();
    super.vel = new PVector((random(1)*2-1), (random(1)*2-1)).mult(super.velocity);
    super.acc = new PVector(super.vel.x+random(-1, 1), super.vel.y+random(-1, 1)).normalize().mult(super.velocity/10*(-super.acceleration));
    int base = (int)random(50, 100);
    int r = floor(base+random(-10, 10));
    int g = floor(base+random(-10, 10));
    int b = floor(random(200, 255));
    super.col = color(r, g, b);
  }
}
