
PImage sprite;
ArrayList<Gene> genes;
//ArrayList<Field> fields;
//ArrayList<Shape> symbol;

void setup() {
  size(800, 600, P2D);
  genes = new ArrayList<Gene>();
  String s = "";
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 5; j++) {
      Gene g;
      do {
        g = new Gene(new PVector(width*(j*2+1)/10, height*(i*2+1)/8), height/10);
        g.generate();
      } while (g.size() < 10 || g.size() > 20);
      genes.add(g);
      s += g.size() + "\t";
    }
    s += "\n";
    for (int j = 0; j < 4 && i != 3; j++) {
      Gene g;
        do {
        g = new Gene(new PVector(width*(j*2+2)/10, height*(i*2+2)/8), height/10);
        g.generate();
      } while (g.size() < 10 || g.size() > 20);
      genes.add(g);
      s += "     "+g.size()+"\t";
    }
    s+= "\n";
  }
  print(s);

  //fields = new ArrayList<Field>();
  //sprite = loadImage("sprite.png");

  //fields.add(new Field<Particle_Fire>(500, new Particle_Fire(new Circle(width*1/6, height*2/10, height/5, Factory_Region.getRegion("South")), 1, 0.05, sprite)));
  //fields.add(new Field<Particle_Water>(500, new Particle_Water(new Circle(width*3/6, height*2/10, height/5, Factory_Region.getRegion("South")), 1, 0.1, sprite)));
  //fields.add(new Field<Particle_Radial>(500, new Particle_Radial(new Circle(width*5/6, height*2/10, height/5, Factory_Region.getRegion("Border")), 1, 0.03, sprite)));
  //fields.add(new Field<Particle_Snow>(500, new Particle_Snow(new Circle(width*2/6, height*5/10, height/5, Factory_Region.getRegion("North")), 1, 0.01, sprite)));
  //fields.add(new Field_Star<Particle_Star>(100, new Particle_Star(new Circle(width*4/6, height*5/10, height/5, Factory_Region.getRegion("Border")), 1, 0, sprite), 50));
  //fields.add(new Field<Particle_Sine>(100, new Particle_Sine(new Circle(width*1/6, height*8/10, height/5, Factory_Region.getRegion("South")), 2, 0.05, 0.3, sprite)));
  //fields.add(new Field<Particle_Random>(250, new Particle_Random(new Circle(width*3/6, height*8/10, height/5, Factory_Region.getRegion("Border")), 2, 0.01, 60, sprite)));
  //fields.add(new Field_Star<Particle_Radial>(250, new Particle_Radial(new Circle(width*5/6, height*8/10, height/5, Factory_Region.getRegion("Border")), 1, 0.03, sprite), 20));
  //fields.add(new Field_Star<Particle_Sine>(500, new Particle_Sine(new Bubble(width/2, height/2, height/2, Factory_Region.getRegion("South")), 1, 0.05, 0.4, sprite), 50));

  //symbol = new ArrayList<Shape>();
  //symbol.add(new Circle(width/2, height/2, height/3));                                                 //0
  //symbol.add(new Polygon(symbol.get(0).origin(), 5, 0, symbol.get(0).radius(), random(-0.03, 0.03)));  //1
  //symbol.add(new Circle(symbol.get(1).origin(), symbol.get(1).getInnerRadius()));                      //2
  //symbol.add(new Polygon(symbol.get(0).origin(), 3, 0, symbol.get(0).radius(), random(-0.03, 0.03)));  //3
  //symbol.add(new Circle(symbol.get(3).origin(), symbol.get(3).getInnerRadius()));                      //4
  //symbol.add(new Polygon(symbol.get(4).origin(), 6, 0, symbol.get(4).radius(), random(-0.03, 0.03)));  //5
  //symbol.add(new Polygon(symbol.get(4).origin(), 3, 0, symbol.get(4).radius(), random(-0.03, 0.03)));  //6
  //symbol.add(new Circle(symbol.get(6).origin(), symbol.get(3).getInnerRadius()));                      //7
  //symbol.add(new Radii(symbol.get(4).origin(), 6, symbol.get(4).radius(), symbol.get(2).radius(), random(-0.03, 0.03)));
}


void draw() {
  background(0);
  for (Gene g : genes) {
    g.render();
  }

  //for (Shape s : symbol){
  //  s.render();
  //}
  //for (Field f : fields) {
  //  f.update();
  //  f.render();
  //}
}

void mouseClicked() {
  setup();
}
