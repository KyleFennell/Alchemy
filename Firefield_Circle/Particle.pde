class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 5;
  PImage tex;
  color col;
  PVector origin = new PVector(width/2, height/2);

  Particle(float velocity, float acceleration, PImage tex) {
    pos = new PVector();
    PVector spawn = new PVector((random(-0.5, 0.5)), random(0.5, 1));
    spawn.normalize().mult(height/3).add(origin);
    rebirth(spawn.x, spawn.y);
    this.velocity = velocity;
    this.acceleration = acceleration;
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    this.tex = tex;
  }

  void update() {
    if (isDead()) {
      PVector spawn = new PVector(random(-0.5, 0.5), random(1));
      spawn.normalize().mult(height/3).add(origin);
      rebirth(spawn.x, spawn.y);
    }
    acc = new PVector((random(1)*2-1)*20*acceleration, -acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  void render() {
    imageMode(CENTER);
    tint(col);
    image(tex, pos.x, pos.y, 32, 32);
  }

  void rebirth(float x, float y) {
    pos.x = x;
    pos.y = y;
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    acc = new PVector(0, 0);
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    col = color(r, g, 0);
  }

  boolean isDead() {
    if (dist(pos.x, pos.y, width/2, height/2) > height/3) {
      return true;
    }
    return false;
  }

  void capVelocity() {
    if (vel.x > maxVelocity) {
      vel.x = maxVelocity;
    } else if (vel.x < -maxVelocity) {
      vel.x = -maxVelocity;
    }
    //if (vel.y > maxVelocity*3) {
    //  vel.y = maxVelocity*3;
    //} else if (vel.y < -maxVelocity*3) {
    //  vel.y = -maxVelocity*3;
    //}
  }

  float x() {
    return pos.x;
  }

  float y() {
    return pos.y;
  }
}
