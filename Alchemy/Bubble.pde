class Bubble{

  float radius;
  PVector origin;
  ArrayList<Integer> regions;

  Bubble(float x, float y, float radius, boolean regions[]) {
    this.regions = new ArrayList<Integer>();
    for (int i = 0; i < regions.length; i++) {
      if (regions[i]) {
        this.regions.add(i);
      }
    }
    origin = new PVector(x, y);
    this.radius = radius;
  }

  boolean isInside(float x, float y) {
    if (dist(x, y, origin.x, origin.y) < radius) {
      return true;
    }
    return false;
  }

  PVector origin() {
    return origin;
  }

  float radius() {
    return radius;
  }

  PVector getSpawn() {
    int reg = regions.get((int)random(regions.size()));
    if (reg == 8) {
      return new PVector(origin.x, origin.y);
    }
    float x = random(PI/3.5);
    float y = random(PI/3.5);
    return new PVector(cos(x+(reg*PI/4)), sin(y+(reg*PI/4))).normalize().mult(radius).add(origin);
  }

  void move(float x, float y) {
    origin.x = x;
    origin.y = y;
  }

  void render() {
    strokeWeight(2);
    stroke(255);
    fill(0);
    ellipse(origin.x, origin.y, radius*2, radius*2);
  }
}
