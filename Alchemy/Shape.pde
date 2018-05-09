public interface Shape {
  PVector origin();
  float radius();
  PVector getSpawn();
  boolean isInside(float x, float y);
  void move(float x, float y);
  void render();
}
