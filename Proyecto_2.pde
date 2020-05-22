import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

PImage face;

ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;

void setup() {
  size(640,360);
  smooth();


  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(320,125,200,0));
}

void draw() {
  background(255);
  face = loadImage("face.jpg");
  image(face,220,120,200,200);
  box2d.step();

  if (random(1) < 0.2) {
    Box p = new Box(width/2,30);
    boxes.add(p);
  }

  for (Boundary wall: boundaries) {
    wall.display();
  }

  for (Box b: boxes) {
    b.display();
  }

  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
