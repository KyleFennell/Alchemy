class Circle implements Shape {

  float radius;
  PVector origin;
  ArrayList<Integer> regions;

  Circle(float x, float y, float radius, boolean regions[]) {
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
  
  PVector getSpawn(){
    int reg = regions.get((int)random(regions.size()));
    if (reg == 8){
      return origin;
    }
    float x = random(PI/4);
    float y = random(PI/4);
    return new PVector(sin(x+(reg*PI/4)), cos(y+(reg*PI/4))).normalize().mult(radius).add(origin);
  }

  void move(float x, float y) {
    origin.x = x;
    origin.y = y;
  }

  void render() {
    ellipse(origin.x, origin.y, radius, radius);
  }
}
