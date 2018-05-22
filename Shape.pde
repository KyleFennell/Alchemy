public interface Shape {
  PVector origin();
  float radius();
  float getInnerRadius();
  void move(float x, float y);
  void render();
}

public class Circle implements Shape {
  PVector origin;
  float radius;

  Circle(float x, float y, float radius) {
    origin = new PVector(x, y);
    this.radius = radius;
  }

  Circle(PVector origin, float radius) {
    this.origin = origin;
    this.radius = radius;
  }

  PVector origin() {
    return origin;
  }

  float radius() {
    return radius;
  }

  float getInnerRadius() {
    return radius;
  }

  void move(float x, float y) {
    origin = new PVector(x, y);
  }

  void render() {
    stroke(255);
    strokeWeight(1);
    noFill();
    ellipse(origin.x, origin.y, radius*2, radius*2);
  }
}

public class Polygon implements Shape {

  int noOfSides;
  int k;
  float radius;
  PVector origin;
  float velocity;

  Polygon(float x, float y, int n, int k, float radius, float velocity) {    
    origin = new PVector(x, y);
    noOfSides = n;
    this.k = k;
    this.radius = radius;
    this.velocity = velocity;
  }

  Polygon(PVector origin, int n, int k, float radius, float velocity) {
    this.origin = origin;
    noOfSides = n;
    this.k = k;
    this.radius = radius;
    this.velocity = velocity;
  }

  PVector origin() {
    return origin;
  }

  float radius() {
    return radius;
  }

  float getInnerRadius() {
    return radius*sin((noOfSides-2)*PI/(2*noOfSides));
  }

  void move(float x, float y) {
    origin = new PVector(x, y);
  }

  void render() {
    stroke(255);
    strokeWeight(1);
    noFill();
    float theta = (TWO_PI/noOfSides);
    float offset = frameCount*velocity;
    for (int i = 0; i <= noOfSides; i++) {
      line(origin.x+radius*cos((i+offset)*theta), origin.y+radius*sin((i+offset)*theta), origin.x+radius*cos((i+1+offset)*theta), origin.y+radius*sin((i+1+offset)*theta));
    }
  }
}
class Radii implements Shape {

  float radius1, radius2;
  int noOfRadii;
  PVector origin;
  float velocity;

  Radii(float x, float y, int noOfRadii, float radius1, float radius2, float velocity) {
    origin = new PVector(x, y);
    this.noOfRadii = noOfRadii;
    this.radius1 = radius1;
    this.radius2 = radius2;
    this.velocity = velocity;
  }

  Radii(PVector origin, int noOfRadii, float radius1, float radius2, float velocity) {
    this.origin = origin;
    this.noOfRadii = noOfRadii;
    this.radius1 = radius1;
    this.radius2 = radius2;
    this.velocity = velocity;
  }

  PVector origin() {
    return origin;
  }

  float radius() {
    return radius1;
  }

  float getInnerRadius() {
    return radius2;
  }

  void move(float x, float y) {
    origin = new PVector(x, y);
  }

  void render() {
    stroke(255);
    strokeWeight(1);
    noFill();
    float theta = (TWO_PI/noOfRadii);
    float offset = frameCount*velocity;
    for (int i = 0; i < noOfRadii; i++) {
      line(origin.x+radius1*cos((i+offset)*theta), origin.y+radius1*sin((i+offset)*theta), origin.x+radius2*cos((i+offset)*theta), origin.y+radius2*sin((i+offset)*theta));
    }
  }
}
