
ArrayList<Field> fields = new ArrayList<Field>();
PImage sprite;

void setup() {
  size(800, 600, P2D);
  sprite = loadImage("sprite.png");
  fields.add(new Field_Star(100, new Square(width*1/8, height*1/6, width/9, Factory_Region.getRegion("Center")), sprite));
  fields.add(new Field_Star(100, new Square(width*3/8, height*1/6, width/9, Factory_Region.getRegion("Border")), sprite));
  fields.add(new Field_Star(100, new Square(width*5/8, height*1/6, width/9, Factory_Region.getRegion("North")), sprite));
  fields.add(new Field_Star(100, new Square(width*7/8, height*1/6, width/9, Factory_Region.getRegion("East")), sprite));
  fields.add(new Field_Star(100, new Square(width*1/8, height*3/6, width/9, Factory_Region.getRegion("South")), sprite));
  fields.add(new Field_Star(100, new Square(width*3/8, height*3/6, width/9, Factory_Region.getRegion("West")), sprite));
  fields.add(new Field_Star(100, new Square(width*5/8, height*3/6, width/9, Factory_Region.getRegion("Top")), sprite));
  fields.add(new Field_Star(100, new Square(width*7/8, height*3/6, width/9, Factory_Region.getRegion("Right")), sprite));
  fields.add(new Field_Star(100, new Square(width*1/8, height*5/6, width/9, Factory_Region.getRegion("Bottom")), sprite));
  fields.add(new Field_Star(100, new Square(width*3/8, height*5/6, width/9, Factory_Region.getRegion("Left")), sprite));
  fields.add(new Field_Star(100, new Square(width*5/8, height*5/6, width/9, Factory_Region.getRegion("osadoie")), sprite));
  fields.add(new Field_Star(100, new Square(width*7/8, height*5/6, width/9, Factory_Region.getRegion("Border")), sprite));
}


void draw() {
  background(0);
  for (Field f : fields) {
    f.update();
    f.render();
  }
}
