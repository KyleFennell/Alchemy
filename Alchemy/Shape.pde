public interface Shape {
  boolean isInside(float x, float y);
  point origin();
  void move(float x, float y);
  void render();
}
