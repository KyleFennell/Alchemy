class Gene {

  Node_C root;

  Gene(PVector origin, float radius) {
    root = new Node_C(null, new Circle(origin, radius));
  }

  void generate() {
    root.generateChild();
  }

  void render() {
    root.render();
  }

  int depth() {
    int depth = 0;
    Node current = root;
    while (current.getChild() != null) {
      depth++;
      current = current.getChild();
    }
    return depth;
  }

  int size() {
    return root.size();
  }
}

interface Node {
  Shape data();
  Node getChild();
  Node getParent();
}

class Node_C implements Node {

  ArrayList<Node_P> children;
  Node_P parent;
  Circle data;


  Node_C(Node_P parent, Circle data) {
    this.parent = parent;
    this.data = data;
    children = new ArrayList<Node_P>();
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
    while (!polygonsFinished) {
      if (random(1) > 0.15) {
        polygonsFinished = true;
      }
      int n = floor(random(3, 8));
      int k = 0;
      float velocity = ((float)floor(random(-10, 10)))/1000;
      children.add(new Node_P(this, new Polygon(origin, n, k, radius, velocity)));
    }
    while (random(1) > 0.25) {
      boolean radiiFinished = false;
      Node current = this;
      while (!radiiFinished) {
        if (random(1) < 0.5 && current.getParent() != null) {
          current = current.getParent();
        } else if (current.getChild() != null) {
          current = current.getChild();
        }
        if (random(1) > 0.1) {
          radiiFinished = true;
        }
      }
      int noOfRadii = floor(random(3, 9));
      float radius1 = data.radius();
      float radius2 = current.data().radius();
      float velocity = ((float)floor(random(-10, 10)))/1000;
      children.add(new Node_R(this, new Radii(this.data.origin(), noOfRadii, radius1, radius2, velocity)));
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
}
//----------------------------------------------------------------------------------------------
class Node_P implements Node {

  Node_C parent;
  Node_C child;
  Polygon data;

  Node_P(Node_C parent, Polygon data) {
    this.parent = parent;
    this.data = data;
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
    if (child == null && random(1) < 0.8) {
      child = new Node_C(this, new Circle(data.origin(), data.getInnerRadius()));
      child.generateChild();
    }
  }

  int size() {
    if (child != null) {
      return child.size()+1;
    }
    return 1;
  }
}
//--------------------------------------------------------------------------------------------------
class Node_R extends Node_P {

  Node_C parent;
  Radii data;

  Node_R(Node_C parent, Radii data) {
    super(parent, new Polygon(data.origin(), 0, 0, 0, 0));
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
}
