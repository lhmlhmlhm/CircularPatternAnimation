class ShapeGenerator {
  //----- Shapes Setup -----
  int numbersOfLayer, buttomLine, layerHeight, xpos, ypos;
  ArrayList<ShapePicker> patterns = new ArrayList<ShapePicker>();
  //----- Rect Setup -----
  int wid, recMargin, corner, savebuttomLine;
  boolean drakMode = false;
  //----- Init -----
  ShapeGenerator(int xpos, int ypos, int wid, int recMargin, int buttomLine, int corner, int numbersOfLayer) {
    this.recMargin = recMargin;
    this.corner = corner;
    this.numbersOfLayer = numbersOfLayer;
    this.buttomLine = buttomLine;
    savebuttomLine = buttomLine;
    this.xpos = xpos;
    this.ypos = ypos;
    this.wid = wid;
    initShapes();
  }
  //----- Main Function -----
  void display() {
    outerRect();
    for (ShapePicker pick : patterns) {
      pick.shapeDisplay();
    }
  }
  //----- Effect Function -----
  void shuffleShape() {
    float[] a = patterns.get(0).saveShape();
    float[] b;
    for (int i = 0; i < patterns.size(); i++) {
      if (i == patterns.size()-1) {
        patterns.get(0).updateShape(a);
        break;
      }
      b = patterns.get(i+1).saveShape();
      patterns.get(i+1).updateShape(a);
      a = b;
    }
  }
  void reduceShapeTo(int a) {
    buttomLine = savebuttomLine;
    patterns.clear();
    numbersOfLayer = a;
    //print(a);
    initShapes();
    
    //if(darkMode) darkBackground(int c);
  }
  void rebuildShape() {
    for (int i = 0; i < patterns.size(); i++) {
      patterns.get(i).rebuildShape();
    }
  }
  void thickerOutline(int s) {
    for (int i = 0; i < patterns.size(); i++) {
      patterns.get(i).shapeSize = s;
    }
  }
  void resetOutline() {
    for (int i = 0; i < patterns.size(); i++) {
      patterns.get(i).shapeSize = 1;
    }
  }
  void darkBackground(int c) {
    for (int i = 0; i < patterns.size(); i++) {
      patterns.get(i).shapeColor = c;
    }
  }
  void resetBackground(color a) {
    //color a = myColor[int(random(myColor.length))];
    for (int i = 0; i < patterns.size(); i++) {
      //patterns.get(i).shapeColor = 0;
      patterns.get(i).shapeColor = a;
    }
  }
  //----- Secondary Functions -----
  void toggleDarkMode() {
    drakMode = !drakMode;
  }
  void initShapes() {
    int a = wid/2-(recMargin+buttomLine);
    int b = a/numbersOfLayer;
    for (int i = 0; i < numbersOfLayer; i++) {
      patterns.add(new ShapePicker(xpos, ypos, buttomLine, b));
      buttomLine += b;
    }
    wid = (buttomLine + recMargin)*2;
  }
  void outerRect() {
    noFill();
    if (drakMode) fill(0);
    noStroke();
    //stroke(100);
    strokeWeight(2);
    rect(xpos, ypos, wid, wid, corner);
  }
  //----- Tools -----
  int pickEleFromArray(int[] array) {
    return array[int(random(array.length))];
  }
}
