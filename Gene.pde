class Gene {

  Node_C root;
  ArrayList<Field> bubbles;
  Factory f = new Factory();
  float velocity = ((float)floor(random(-10, 10)))/1000;
  PImage sprite;
  int maxSize;

  Gene(PVector origin, float radius, PImage sprite, int maxSize) {
    root = new Node_C(null, new Circle(origin, radius), this);
    this.sprite = sprite;
    this.maxSize = maxSize;
  }

  void generate() {
    root.generateChild();
    bubbles = new ArrayList<Field>();
    int noOfBubbles = round(random(3, 7));
    Shape symbol = root.data;
    int pType = round(random(0, 6));
    int fType = round(random(1));
    float radius = symbol.radius()/4;
    for (int i = 0; i < noOfBubbles; i++) {
      Particle p = f.getParticle(pType, new PVector(0, 0), symbol.radius()/5, sprite);
      Field b = f.getField(fType, p, round(radius)/2, round(radius/5));
      bubbles.add(b);
    }
  }

  void render() {
    root.render();
    for (int i = 0; i < bubbles.size(); i++) {
      Field f = bubbles.get(i);
      Shape symbol = root.data();
      float theta = (TWO_PI/bubbles.size());
      float offset = frameCount*velocity;
      f.blueprint.bubble.move(symbol.origin().x+cos(i*theta+offset)*symbol.radius(), symbol.origin().y+sin(i*theta+offset)*symbol.radius());
      f.update();
      f.render();
    }
  }

  int size() {
    return root.size();
  }

  String toString() {
    return "" + root.print("");
  }
}

interface Node {
  Shape data();
  Node getChild();
  Node getParent();
  String print(String s);
}

class Node_C implements Node {

  ArrayList<Node_P> children;
  Node_P parent;
  Circle data;
  Gene gene;

  Node_C(Node_P parent, Circle data, Gene gene) {
    this.parent = parent;
    this.data = data;
    children = new ArrayList<Node_P>();
    this.gene = gene;
  }

  Node getParent() {
    return parent;
  }

  Node getChild() {
    if (children.size() == 0) {
      return null;
    }
    return children.get(floor(random(children.size())));
  }

  Shape data() {
    return data;
  }

  void render() {
    data.render();
    for (Node_P c : children) {
      c.render();
    }
  }

  void generateChild() {
    boolean polygonsFinished = false;
    PVector origin = data.origin();
    float radius = data.radius();
    while (!polygonsFinished && gene.size() < gene.maxSize) {
      if (random(1) > 0.3) {
        polygonsFinished = true;
      }
      int n = floor(random(3, 7));
      int k = 0;
      float velocity = ((float)floor(random(-10, 10)))/1000;
      children.add(new Node_P(this, new Polygon(origin, n, k, radius, velocity), gene));
    }
    while (random(1) > 0.8 && gene.size() < gene.maxSize) {
      boolean radiiFinished = false;
      Node current = this;
      while (!radiiFinished) {
        if (random(1) < 0.5 && current.getParent() != null) {
          current = current.getParent();
        } else if (current.getChild() != null) {
          current = current.getChild();
        }
        if (random(1) < 0.1) {
          radiiFinished = true;
        }
      }
      int noOfRadii = floor(random(3, 9));
      float radius1 = data.radius();
      float radius2 = current.data().radius();
      if (radius1 != radius2){
      float velocity = ((float)floor(random(-10, 10)))/1000;
      children.add(new Node_R(this, new Radii(this.data.origin(), noOfRadii, radius1, radius2, velocity), gene));
      }
    }
    for (Node_P c : children) {
      c.generateChild();
    }
  }

  int size() {
    int sum = 1;
    for (Node_P c : children) {
      sum += c.size();
    }
    return sum;
  }

  String print(String structure) {
    String output = structure + "\n"+structure+"Circle";
    for (Node child : children) {
      output += child.print(structure + " ");
    }
    return output;
  }
}
//----------------------------------------------------------------------------------------------
class Node_P implements Node {

  Node_C parent;
  Node_C child;
  Polygon data;
  Gene gene;

  Node_P(Node_C parent, Polygon data, Gene gene) {
    this.parent = parent;
    this.data = data;
    this.gene = gene;
  }

  Node getParent() {
    return parent;
  }

  Node getChild() {
    return child;
  }

  Shape data() {
    return data;
  }

  void render() {
    data.render();
    if (child != null) {
      child.render();
    }
  }
  void generateChild() {
    if (child == null && random(1) < 0.8 && gene.size() < gene.maxSize) {
      child = new Node_C(this, new Circle(data.origin(), data.getInnerRadius()), gene);
      child.generateChild();
    }
  }

  int size() {
    if (child != null) {
      return child.size()+1;
    }
    return 1;
  }
  String print(String structure) {
    String output = "\n"+structure+""+data.noOfSides+"-gon";
    if (child != null) {
      output += child.print(structure+" ");
    }
    return output;
  }
}
//--------------------------------------------------------------------------------------------------
class Node_R extends Node_P {

  Node_C parent;
  Radii data;

  Node_R(Node_C parent, Radii data, Gene gene) {
    super(parent, new Polygon(data.origin(), 0, 0, 0, 0), gene);
    this.parent = parent;
    this.data = data;
  }

  Node getChild() {
    return null;
  }

  Node getParent() {
    return parent;
  }

  Shape data() {
    return data;
  }

  @Override
    void render() {
    data.render();
  }

  @Override
    void generateChild() {
  }

  @Override
    int size() {
    return 1;
  }

  @Override
    String print(String structure) {
    return "\n"+structure+"radii";
  }
}
