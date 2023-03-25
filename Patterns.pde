SceneGenerator scene1; //<>//
//Animation test;
void setup() {
  size(1600, 800);
  rectMode(CENTER);
  frameRate(20);
  scene1 = new SceneGenerator(8, 5);
  //test = new Animation(8, 4);
}

void draw() {
  background(255);
  scene1.display();
  //test.timer.call();
}

void mouseReleased() {
  //test.start();
}

//void printShapeArray(ShapeGenerator shape) {
//  for (int i = 0; i < shape.patterns.size(); i++) {
//    println("----- index: " + i + " -----");
//    println("type: " + shape.patterns.get(i).type);
//    println("model: " + shape.patterns.get(i).model);
//    println("model: " + shape.patterns.get(i).model);
//  }
//}
