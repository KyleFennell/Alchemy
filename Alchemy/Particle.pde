interface Particle {

  void update();
  void render();
  void rebirth();
  boolean isDead();
  PVector pos();
}
