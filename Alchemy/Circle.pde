
class Circle implements Shape {

  float radius;
  point origin;

  Circle(float x, float y, float radius) {
    origin = point(x, y);
    this.radius = radius;
  }

  boolean isInside(float x, float y) {
    if (dist(x, y, origin.x, origin.y) < radius) {
      return true;
    }
    return false;
  }

  point origin() {
    return origin;
  }
}
