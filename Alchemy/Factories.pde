class Factory {
  boolean[] getRegion(String type) {
    boolean[] ret;
    switch(type) {
    case "Border": 
      ret = new boolean[]{true, true, true, true, true, true, true, true, false};
      return ret;
    case "Center":
      ret = new boolean[]{false, false, false, false, false, false, false, false, true};
      return ret;
    case "North":
      ret = new boolean[]{false, false, false, false, false, true, true, false, false};
      return ret;
    case "East":
      ret = new boolean[]{true, false, false, false, false, false, false, true, false};
      return ret;
    case "South":
      ret = new boolean[]{false, true, true, false, false, false, false, false, false};
      return ret;
    case "West":
      ret = new boolean[]{false, false, false, true, true, false, false, false, false};
      return ret;
    case "Top":
      ret = new boolean[]{false, false, false, false, true, true, true, true, false};
      return ret;
    case "Right":
      ret = new boolean[]{true, true, false, false, false, false, true, true, false};
      return ret;
    case "Bottom":
      ret = new boolean[]{true, true, true, true, false, false, false, false, false};
      return ret;
    case "Left":
      ret = new boolean[]{false, false, true, true, true, true, false, false, false};
      return ret;
    default:
      ret = new boolean[]{true, true, true, true, true, true, true, true, true};
      return ret;
    }
  }

  Particle getParticle(String type, PVector origin, float radius, PImage sprite) {
    switch (type) {
    case "Fire": 
      return new Particle_Fire(new Bubble(origin.x, origin.y, radius, getRegion("South")), 1, 0.05, sprite);
    case "Water": 
      return new Particle_Water(new Bubble(origin.x, origin.y, radius, getRegion("South")), 1, 0.1, sprite);
    case "Radial": 
      return new Particle_Radial(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0.03, sprite);
    case "Snow": 
      return new Particle_Snow(new Bubble(origin.x, origin.y, radius, getRegion("North")), 1, 0.01, sprite);
    case "Star": 
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0, sprite);
    case "Sine": 
      return new Particle_Sine(new Bubble(origin.x, origin.y, radius, getRegion("South")), 2, 0.05, 0.3, sprite);
    case "Random": 
      return new Particle_Random(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 2, 0.01, 60, sprite);
    default:
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0, sprite);
    }
  }

  Particle getParticle(int type, PVector origin, float radius, PImage sprite) {
    switch (type) {
    case 0: 
      return new Particle_Fire(new Bubble(origin.x, origin.y, radius, getRegion("South")), 1, 0.05, sprite);
    case 1: 
      return new Particle_Water(new Bubble(origin.x, origin.y, radius, getRegion("South")), 1, 0.1, sprite);
    case 2: 
      return new Particle_Radial(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0.1, sprite);
    case 3: 
      return new Particle_Snow(new Bubble(origin.x, origin.y, radius, getRegion("North")), 1, 0.01, sprite);
    case 4: 
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0, sprite);
    case 5: 
      return new Particle_Sine(new Bubble(origin.x, origin.y, radius, getRegion("South")), 2, 0.05, 0.3, sprite);
    case 6: 
      return new Particle_Random(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 2, 0.01, 60, sprite);
    default:
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), 1, 0, sprite);
    }
  }

  Particle getParticle(String type, PVector origin, float radius, float velocity, float acceleration, float speed, PImage sprite) {
    switch (type) {
    case "Fire": 
      return new Particle_Fire(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, sprite);
    case "Water": 
      return new Particle_Water(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, sprite);
    case "Radial": 
      return new Particle_Radial(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    case "Snow": 
      return new Particle_Snow(new Bubble(origin.x, origin.y, radius, getRegion("North")), velocity, acceleration, sprite);
    case "Star": 
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    case "Sine": 
      return new Particle_Sine(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, speed, sprite);
    case "Random": 
      return new Particle_Random(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, speed, sprite);
    default:
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    }
  }
  
    Particle getParticle(int type, PVector origin, float radius, float velocity, float acceleration, float speed, PImage sprite) {
    switch (type) {
    case 0: 
      return new Particle_Fire(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, sprite);
    case 1: 
      return new Particle_Water(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, sprite);
    case 2: 
      return new Particle_Radial(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    case 3: 
      return new Particle_Snow(new Bubble(origin.x, origin.y, radius, getRegion("North")), velocity, acceleration, sprite);
    case 4: 
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    case 5: 
      return new Particle_Sine(new Bubble(origin.x, origin.y, radius, getRegion("South")), velocity, acceleration, speed, sprite);
    case 6: 
      return new Particle_Random(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, speed, sprite);
    default:
      return new Particle_Star(new Bubble(origin.x, origin.y, radius, getRegion("Border")), velocity, acceleration, sprite);
    }
  }

  Field getField(String type, Particle p, int noOfParticles, int special) {
    switch (type) {
    case "Normal": 
      return new Field<Particle>(noOfParticles, p);
    case "Star":
      return new Field_Star<Particle>(noOfParticles, p, special);
    default:
      return new Field<Particle>(noOfParticles, p);
    }
  }
  
    Field getField(int type, Particle p, int noOfParticles, int special) {
    switch (type) {
    case 0: 
      return new Field<Particle>(noOfParticles, p);
    case 1:
      return new Field_Star<Particle>(noOfParticles, p, special);
    default:
      return new Field<Particle>(noOfParticles, p);
    }
  }
}
