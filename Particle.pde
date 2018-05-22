abstract class Particle {
  // physics vectors
  PVector pos;
  PVector vel;
  PVector acc;
  // rebirth multipliers
  float velocity;
  float acceleration;
  // other
  float maxVelocity = 30;
  float minVelocity = 0.3;
  PImage sprite;
  Bubble bubble;
  color col;

  Particle(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    this.bubble = bubble;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.sprite = sprite;
    rebirth();
  }

  abstract Particle clone();

  void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  void render() {
    imageMode(CENTER);
    tint(col);
    image(sprite, pos.x, pos.y, bubble.radius()/3, bubble.radius()/3);
  }

  abstract void rebirth();

  boolean isDead() {
    if (bubble.isInside(pos.x, pos.y)) {
      return false;
    }
    return true;
  }

  void capVelocity() {
    if (vel.mag() > maxVelocity) {
      vel.setMag(maxVelocity);
    }
    if (vel.mag() < minVelocity) {
      vel.setMag(minVelocity);
    }
  }

  PVector pos() {
    return pos;
  }
}

class Particle_Fire extends Particle {
  // physics vectors

  Particle_Fire(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    maxVelocity = 30;
    rebirth();
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector((random(1)*2-1)*5*acceleration, -acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  @Override
    Particle clone() {
    return new Particle_Fire(bubble, velocity, acceleration, sprite);
  }

  @Override
    void rebirth() {
    pos = bubble.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    acc = new PVector(0, 0);
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    col = color(r, g, 0);
  }
}

class Particle_Radial extends Particle {

  PVector goal;

  Particle_Radial(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);

    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Radial(bubble, velocity, acceleration, sprite);
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    goal = bubble.getSpawn();
    PVector velt = new PVector(pos.x - goal.x, pos.y - goal.y);
    velt.normalize();
    if (velocity >= 0) {
      velt.mult(-1);
    }
    acc = new PVector(velt.x*acceleration, velt.y*acceleration);
    vel.add(acc);
    pos.add(vel);
    capVelocity();
  }

  @Override
    void rebirth() {
    if (velocity < 0) {
      pos = new PVector(bubble.origin().x, bubble.origin().y);
      goal = bubble.getSpawn();
    } else {
      pos = bubble.getSpawn();
      goal = new PVector(bubble.origin().x, bubble.origin().y);
    }
    vel = new PVector(pos.x - goal.x, pos.y - goal.y);
    vel.normalize();
    if (velocity >= 0) {
      vel.mult(-1);
    }
    vel.mult(random(velocity));
    int r = floor(random(150, 255));
    int g = 0;
    int b = floor(random(150, 255));
    col = color(r, g, b);
  }

  @Override 
    boolean isDead() {
    if (velocity < 0) {
      if (!bubble.isInside(pos.x, pos.y)) {
        return true;
      }
    } else {
      if (pos.x > bubble.origin().x -10 && pos.x < bubble.origin().x +10 && pos.y > bubble.origin().y -10 && pos.y < bubble.origin().y +10) {
        return true;
      }
    }
    return false;
  }
}

class Particle_Random extends Particle {

  int interval = 50 ;
  int nextChange = interval;

  Particle_Random(Bubble bubble, float velocity, float acceleration, float interval, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    this.interval = floor(interval);
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Random(bubble, velocity, acceleration, interval, sprite);
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    if (nextChange == 0) {
      nextChange = (int)random(interval/5, interval);
      vel = new PVector(random(-1, 1), random(-1, 1)).mult(velocity);
      acc = new PVector(vel.x, vel.y).mult(acceleration);
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
    nextChange--;
  }

  @Override
    void rebirth() {
    pos = bubble.getSpawn();
    nextChange = (int)random(0, interval);
    vel = new PVector(random(-1, 1), random(-1, 1)).mult(velocity);
    acc = new PVector(vel.x, vel.y).mult(acceleration);
    int r = (int)random(50, 255);
    int g = (int)random(50, 255);
    int b = (int)random(50, 255);
    col = color(r, g, b);
  }
}

class Particle_Sine extends Particle {

  int offset = 0;
  float speed;
  PVector aPos;

  Particle_Sine(Bubble bubble, float velocity, float acceleration, float speed, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    this.speed = speed;
    maxVelocity = 30;
    rebirth();
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    aPos.add(vel);
    pos = new PVector(aPos.x, aPos.y).add(new PVector(vel.x, vel.y).rotate(PI/2).normalize().mult(sin(frameCount*speed+offset)*bubble.radius()/20));
  }

  @Override
    Particle clone() {
    return new Particle_Sine(bubble, velocity, acceleration, speed, sprite);
  }

  @Override
    void rebirth() {
    offset = (int)random(0, TWO_PI);
    aPos = bubble.getSpawn();
    pos = new PVector(aPos.x, aPos.y);
    vel = new PVector(random(-0.3, 0.3), -1).mult(velocity);
    acc = new PVector(0, random(-1, 0)).mult(acceleration);
    int base = (int)random(50, 100);
    int r = floor(base+random(-10, 10));
    int b = floor(base+random(-10, 10));
    int g = floor(random(200, 255));
    col = color(r, g, b);
  }
}

class Particle_Snow extends Particle {

  Particle_Snow(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    maxVelocity = 2;
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Snow(bubble, velocity, acceleration, sprite);
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector(random(-1, 1)*5, 1).mult(acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  @Override
    void rebirth() {
    pos = bubble.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, random(1)*velocity);
    acc = new PVector(0, 0);
    int rgval = floor(random(200, 255));
    int r = rgval;
    int g = rgval;
    int b = 255;
    col = color(r, g, b);
  }
}

class Particle_Star extends Particle {

  Particle_Star(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    col = 255;
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Star(bubble, velocity, acceleration, sprite);
  }
  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    super.pos.add(super.vel);
  }

  @Override
    void rebirth() {
    super.pos = bubble.getSpawn();
    super.vel = new PVector(random(-1, 1), random(-1, 1)).mult(super.velocity);
  }
}

class Particle_Water extends Particle {

  Particle_Water(Bubble bubble, float velocity, float acceleration, PImage sprite) {
    super(bubble, velocity, acceleration, sprite);
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Water(bubble, velocity, acceleration, sprite);
  }
  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  @Override
    void rebirth() {
    pos = bubble.getSpawn();
    vel = new PVector(random(-1, 1), random(-1, 1)).mult(velocity*bubble.radius()/25);
    acc = new PVector(vel.x+random(-1, 1), vel.y+random(-1, 1)).normalize().mult(vel.mag()/7*(-acceleration));
    int base = (int)random(50, 100);
    int r = floor(base+random(-10, 10));
    int g = floor(base+random(-10, 10));
    int b = floor(random(200, 255));
    col = color(r, g, b);
  }
}
