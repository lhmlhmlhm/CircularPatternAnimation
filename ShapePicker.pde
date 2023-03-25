class ShapePicker extends PatternInventory {
  //----- Color -----
  color initColor = myColor[int(random(myColor.length))];
  //----- Information Layout -----
  int type, model;
  final int[] inventoryLayout = {7, 1};
  //----- Timer Class -----
  FrameTimer timer;
  //----- Init -----
  ShapePicker(int centerX, int centerY, int radius, int radiusAdd) {
    //super(1, 1, myColor[int(random(myColor.length))]);
    super(1, 1);
    this.centerX = centerX;
    this.centerY = centerY;
    this.radius = radius;
    this.radiusAdd = radiusAdd;
    this.radiusNew = this.radius + this.radiusAdd;
    randomPickGenerate();
    randomSetup();
    setupTimer();
  }
  //----- Main Functions -----
  void shapeDisplay() {
    switch(this.type) {
      //***** lines *****
    case 0:
      switch(this.model) {
      case 0:
        dotsLine();
        break;
      case 1:
        dotsSinLine();
        break;
      case 2:
        strLines();
        break;
      case 3:
        flower1();
        break;
      case 4:
        flashline();
        break;
      case 5:
        circles();
        break;
      case 6:
        strLinesAndDots();
        break;
      case 7:
        curves();
        break;
      }
      //***** shapes *****
    case 1:
      switch(this.model) {
      case 0:
        gem1();
        break;
      case 1:
        //gem2();
        break;
      }
      break;
      //***** other *****
    case 2:
      break;
    }
    variableUpdate();
  }
  //----- Secondary Functions -----
  void variablesGenerate(int min, int max, String t) {
    switch(t) {
    case "flowerGem":
      numRandom = int(random(min, max));
      random1 = int(random(2, 8));
      random2 = random1 + int(random(-1, 3));
      break;
    case "dotsLine":
      int[] a = {6, 8, 10, 20, 30};
      random1 = a[int(random(0, a.length))];
      break;
    case "dotsSinLine":
      numRandom = int(random(min, max));
      int[] b = {6, 8, 10, 20, 30};
      random1 = b[int(random(0, b.length))];
      break;
    case "flashline":
      numRandom = int(random(min, max));
      random1 = 1;
      random2 = 2;
      break;
    }
  }
  float[] saveShape() {
    float[] a = {type, model, numRandom, random1, random2, random3};
    return a;
  }
  void updateShape(float[] a) {
    this.type = int(a[0]);
    this.model = int(a[1]);
    this.numRandom = a[2];
    this.random1 = a[3];
    this.random2 = a[4];
    this.random3 = a[5];
  }
  void rebuildShape() {
    type = int(random(inventoryLayout.length));
    model = int(random(inventoryLayout[type]));
    randomSetup();
  }
  //***** final *****
  void randomSetup() {
    switch(this.type) {
      //***** lines *****
    case 0:
      switch(this.model) {
      case 0:
        //dotsLine
        variablesGenerate(0, 0, "dotsLine");
        break;
      case 1:
        //dotsSinLine
        variablesGenerate(1, 3, "dotsSinLine");
        break;
      case 2:
        //StrLines
        variablesGenerate(6, 36, 3, 10, 0, 9);
        break;
      case 3:
        //flower1
        variablesGenerate(8, 14, "flowerGem");
        break;
      case 4:
        //flashline
        variablesGenerate(3, 20, 0, 8);
        break;
      case 5:
        //circles
        variablesGenerate(1, 8);
        break;
      case 6:
        //StrLinesAndDots
        variablesGenerate(6, 36, 2, 6, 2, 7, 1, 9);
        break;
      case 7:
        //curves
        variablesGenerate(12, 72, 10, 180, 12, 110);
        break;
      }
      break;
      //***** shapes *****
    case 1:
      switch(this.model) {
      case 0:
        //gem1
        variablesGenerate(8, 24, "flowerGem");
        break;
      case 1:
        //gem2
        variablesGenerate(6, 24, 0.4, 3, 3, 10);
        break;
      }
      break;
      //***** other *****
    case 2:
      break;
    }
  }
  void variablesGenerate(float min1, float max1) {
    numRandom = random(min1, max1);
  }
  void variablesGenerate(float min1, float max1, float min2, float max2) {
    numRandom = random(min1, max1);
    random1 = random(min2, max2);
  }
  void variablesGenerate(float min1, float max1, float min2, float max2, float min3, float max3) {
    numRandom = random(min1, max1);
    random1 = random(min2, max2);
    random2 = random(min3, max3);
  }
  void variablesGenerate(float min1, float max1, float min2, float max2, float min3, float max3, float min4, float max4) {
    numRandom = random(min1, max1);
    random1 = random(min2, max2);
    random2 = random(min3, max3);
    random3 = random(min4, max4);
  }
  void randomPickGenerate() {
    int a = 0;
    for (int i = 0; i < inventoryLayout.length; i++) {
      a += inventoryLayout[i];
    }
    int b = int(random(1, a+1));
    for (int i = 0; i < inventoryLayout.length; i++) {
      if (inventoryLayout[i] >= b) {
        type = i;
        model = b-1;
        break;
      }
      b -= inventoryLayout[i];
    }
  }
  //----- Animation Interface -----

  //----- Timer Class -----
  void setupTimer() {
    timer = new FrameTimer(2);
    timer.addAction(new FrameAction() {
      void frameEndAction() {
        timer.passVariable++;
        if (timer.passVariable >= 3600) timer.passVariable = 0;
        else return;
      }
      int getVariable() {
        return timer.passVariable;
      }
    }
    );
  }
  void variableUpdate() {
    timer.call();
    variable = timer.FAction.getVariable();
  }
}
