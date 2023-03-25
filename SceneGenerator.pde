class SceneGenerator {
  Animation anim;
  int x;
  int y;
  int[] layers = {1, 2, 3, 4};
  //----- Shape Class -----
  ArrayList<ShapeGenerator> shapes = new ArrayList<ShapeGenerator>();
  int wid = 200;
  int variable;
  int readMessage = 0;
  //----- Init -----
  SceneGenerator(int x, int y) {
    int a = width/x;
    int b = height/y;
    wid = (a < b)? a: b;
    initShapes();
    anim = new Animation(this.x, this.y);
    //println(x, y);
    //println(this.x, this.y);
    //initShapes();
  }
  //----- Main Functions -----
  void display() {
    for (ShapeGenerator shape : shapes) {
      shape.display();
    }
    anim.call();
    listener(anim.effect);
    anim.checkEnd();
  }

  void listener(ArrayList<Integer> event) {
    //println(readMessage);
    if (anim.actionCall) {
      anim.actionCall = false;
      color b = myColor[int(random(myColor.length))];
      for (int i = readMessage; i < event.size(); i++) {
        int a = event.get(i);
        if (shapes.get(a).drakMode) {
          int e = layers[int(random(layers.length))];
          shapes.get(a).reduceShapeTo(e);
          shapes.get(a).resetBackground(b);
          shapes.get(a).resetOutline();
          shapes.get(a).toggleDarkMode();
        } else {
          shapes.get(a).reduceShapeTo(6);
          int c = int(random(150, 255));
          int d = int(random(1, 4));
          shapes.get(a).darkBackground(c);
          shapes.get(a).thickerOutline(d);
          shapes.get(a).toggleDarkMode();
        }
        /////
        //if (anim.playIndex == 0) {
        //} else if (anim.playIndex == 1 || anim.playIndex == 2) {
        //  shapes.get(a).shuffleShape();
        //}
        //shapes.get(a).rebuildShape();
        //shapes.get(a).shuffleShape();
      }
      readMessage = anim.lastMessageLength();
    }
  }
  void initShapes() {
    int a = 0;
    int b = 0;
    for (int i = 0; i < height; i+=wid) {
      for (int j = 0; j < width; j+=wid) {
        shapes.add(new ShapeGenerator(wid/2+j, wid/2+i, wid, 6, 10, 10, 1));
        //println("index: " + a + "  x: " + (j/wid) + "  y: " + (i/wid));
        a++;
      }
      b++;
    }
    x = a/b;
    y = b;
    //println("x: " + a/b + "y: " + b);
  }
}
