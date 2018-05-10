
ArrayList<Field> fields;
PImage sprite;

void setup() {
  size(800, 600, P2D);
  fields = new ArrayList<Field>();
  sprite = loadImage("sprite.png");
  
  fields.add(new Field<Particle_Fire>(1000, new Particle_Fire(new Circle(width*1/6, height*1/4, height/4, Factory_Region.getRegion("South")), 1, 0.01, sprite)));
  fields.add(new Field<Particle_Water>(1000, new Particle_Water(new Circle(width*5/6, height*3/4, height/4, Factory_Region.getRegion("South")), 5, 0.1, sprite)));
}


void draw() {
  background(0);
  for (Field f : fields) {
    f.update();
    f.render();
  }
}

void mouseClicked(){
  setup();
}
