class Square implements Shape {

  float radius;
  PVector origin;
  ArrayList<Integer> regions;

  Square(float x, float y, float radius, boolean[] regions) {
    this.regions = new ArrayList<Integer>();
    for (int i = 0; i < regions.length; i++) {
      if (regions[i]) {
        this.regions.add(i);
      }
    }
    origin = new PVector(x, y);
    this.radius = radius;
  }

  PVector origin() {
    return origin;
  }

  float radius() {
    return radius;
  }

  PVector getSpawn() {
    int reg = regions.get((int)random(regions.size()));
    switch (reg) {
    case 0: 
      return new PVector(origin.x+radius, random(origin.y, origin.y+radius));
    case 1: 
      return new PVector(random(origin.x, origin.x+radius), origin.y+radius);
    case 2: 
      return new PVector(random(origin.x-radius, origin.x), origin.y+radius);
    case 3: 
      return new PVector(origin.x-radius, random(origin.y, origin.y+radius));
    case 4: 
      return new PVector(origin.x-radius, random(origin.y-radius, origin.y));
    case 5: 
      return new PVector(random(origin.x-radius, origin.x), origin.y-radius);
    case 6: 
      return new PVector(random(origin.x, origin.x+radius), origin.y-radius);
    case 7: 
      return new PVector(origin.x+radius, random(origin.y-radius, origin.y));
    default: 
      return new PVector(origin.x, origin.y);
    }
  }

  boolean isInside(float x, float y) {
    if (x < origin.x+radius && x > origin.x-radius && y < origin.y+radius && y > origin.y-radius ) {
      return true;
    }
    return false;
  }

  void move(float x, float y) {
    origin = new PVector(x, y);
  }

  void render() {
    strokeWeight(2);
    stroke(255);
    fill(0);
    rect(origin.x-radius, origin.y-radius, 2*radius, 2*radius);
  }
}
