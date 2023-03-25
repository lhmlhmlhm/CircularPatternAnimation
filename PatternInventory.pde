class PatternInventory {
  //----- Pattern Setup -----
  int scale = 1;
  float numRandom, random1, random2, random3;
  int circleSize, shapeSize, shapeColor;
  //----- Size -----
  int centerX, centerY;
  float radius, radiusAdd, radiusNew;
  //----- Animation -----
  int variable = 0;
  //----- Init -----
  PatternInventory(int circleSize, int shapeSize) {
    this.circleSize = circleSize;
    this.shapeSize = shapeSize;
    //this.shapeColor = shapeColor;
  }
  //----- Inventory Shapes-----
  //***** Lines *****
  void dotsLine() {
    setUp(shapeSize+1);
    float a = variable/TWO_PI;
    float b = radius+radiusAdd/2;
    for (int i = 0; i < 360; i+=random1) {
      float x1 = centerX + b*cos(TWO_PI*i/360+a)*scale;
      float y1 = centerY + b*sin(TWO_PI*i/360+a)*scale;
      point(x1, y1);
    }
  }
  void dotsSinLine() {
    setUp(shapeSize+1);
    float a = variable/TWO_PI;
    float b = radius+radiusAdd/2;
    for (int i = 0; i < 360; i+=random1) {
      float x1 = centerX + (b+numRandom*sin(i))*cos(TWO_PI*i/360+a)*scale;
      float y1 = centerY + (b+numRandom*sin(i))*sin(TWO_PI*i/360+a)*scale;
      point(x1, y1);
    }
  }
  void strLines() {
    setUp(shapeSize);
    int index = int(numRandom);
    float a = variable/TWO_PI;
    float b = radius+(random1/20)*radiusAdd;
    float c = radiusNew-(random2/20)*radiusAdd;
    for (int i = 0; i < index; i++) {
      float x1 = centerX + b*cos(TWO_PI*i/index+a)*scale;
      float y1 = centerY + b*sin(TWO_PI*i/index+a)*scale;
      float x2 = centerX + c*cos(TWO_PI*i/index+a)*scale;
      float y2 = centerY + c*sin(TWO_PI*i/index+a)*scale;
      line(x1, y1, x2, y2);
    }
  }
  void strLinesAndDots() {
    setUp(shapeSize);
    float index = int(numRandom)*2;
    float a = variable/TWO_PI;
    float b = radius+(random1/20)*radiusAdd;
    float c = radiusNew-(random2/20)*radiusAdd;
    float d = radius+(random3/10)*radiusAdd;
    for (int i = 0; i < index; i++) {
      if (i%2==0) {
        strokeWeight(1);
        float x1 = centerX + b*cos(TWO_PI*i/index+a)*scale;
        float y1 = centerY + b*sin(TWO_PI*i/index+a)*scale;
        float x2 = centerX + c*cos(TWO_PI*i/index+a)*scale;
        float y2 = centerY + c*sin(TWO_PI*i/index+a)*scale;
        line(x1, y1, x2, y2);
      } else {
        strokeWeight(2);
        float x1 = centerX + d*cos(TWO_PI*i/index+a)*scale;
        float y1 = centerY + d*sin(TWO_PI*i/index+a)*scale;
        point(x1, y1);
      }
    }
  }
  void flower1() {
    setUp(shapeSize);
    int index = int(numRandom);
    float a = variable/TWO_PI;
    float b = numRandom*random1;
    float c = numRandom*random2;
    for (int i = 0; i < index; i++) {
      float x1 = centerX + radius*cos(TWO_PI*i/index + TWO_PI/b+a)*scale;
      float y1 = centerY + radius*sin(TWO_PI*i/index + TWO_PI/b+a)*scale;
      float x2 = centerX + radius*cos(TWO_PI*i/index - TWO_PI/b+a)*scale;
      float y2 = centerY + radius*sin(TWO_PI*i/index - TWO_PI/b+a)*scale;
      float curvex1 = centerX + radiusNew*cos(TWO_PI*i/index + TWO_PI/c+a)*scale;
      float curvey1 = centerY + radiusNew*sin(TWO_PI*i/index + TWO_PI/c+a)*scale;
      float curvex2 = centerX + radiusNew*cos(TWO_PI*i/index - TWO_PI/c+a)*scale;
      float curvey2 = centerY + radiusNew*sin(TWO_PI*i/index - TWO_PI/c+a)*scale;
      noFill();
      bezier(x1, y1, curvex1, curvey1, curvex2, curvey2, x2, y2);
    }
  }
  void flashline() {
    setUp(shapeSize);
    float a = variable/TWO_PI;
    float b = int(numRandom)*2;
    float c = (radius+(radiusAdd/2))+(random1/14)*(radiusAdd/2);
    float d = (radius+(radiusAdd/2))-(random1/14)*(radiusAdd/2);
    float e = 0;
    strokeJoin(ROUND);
    beginShape();
    for (int i = 0; i < b; i++) {
      e = (i%2 == 0)? c: d;
      float x1 = centerX + e*cos(TWO_PI*i/b+a)*scale;
      float y1 = centerY + e*sin(TWO_PI*i/b+a)*scale;
      vertex(x1, y1);
    }
    vertex(centerX + c*cos(a)*scale, centerY + c*sin(a)*scale);
    endShape();
  }
  void circles() {
    setUp(shapeSize);
    int index = int(numRandom);
    for (int i = 1; i <= index; i++) {
      circle(centerX, centerY, (radius + radiusAdd*i/(index+2))*2);
    }
  }
  void curves() {
    setUp(shapeSize);
    int index = int(numRandom);
    float a = variable/TWO_PI;
    float b = random1/TWO_PI;
    float c = random2/TWO_PI;
    for (int i = 0; i < index; i++) {
      float x1 = centerX + radiusNew*cos(TWO_PI*i/index+a)*scale;
      float y1 = centerY + radiusNew*sin(TWO_PI*i/index+a)*scale;
      float x2 = x1 + random1*cos(b+TWO_PI*i/index+a)*scale;
      float y2 = y1 + random1*sin(b+TWO_PI*i/index+a)*scale;
      float x4 = centerX + radius*cos(TWO_PI*i/index+a)*scale;
      float y4 = centerY + radius*sin(TWO_PI*i/index+a)*scale;
      float x3 = x4 + random2*cos(c+TWO_PI*i/index+a)*scale;
      float y3 = y4 + random2*sin(c+TWO_PI*i/index+a)*scale;
      bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    }
  }
  //***** Shapes *****
  void gem1() {
    setUp(shapeSize);
    int index = int(numRandom);
    float a = variable/TWO_PI;
    float b = radius+6;
    float c = radiusNew-6;
    float d = numRandom*random1;
    float e = numRandom*random2;
    for (int i = 0; i < index; i++) {
      beginShape();
      float x1 = centerX + b*cos(TWO_PI*i/index + TWO_PI/d+a)*scale;
      float y1 = centerY + b*sin(TWO_PI*i/index + TWO_PI/d+a)*scale;
      curveVertex(x1, y1);
      curveVertex(x1, y1);
      float x2 = centerX + b*cos(TWO_PI*i/index - TWO_PI/d+a)*scale;
      float y2 = centerY + b*sin(TWO_PI*i/index - TWO_PI/d+a)*scale;
      curveVertex(x2, y2);
      float x3 = centerX + c*cos(TWO_PI*i/index - TWO_PI/e+a)*scale;
      float y3 = centerY + c*sin(TWO_PI*i/index - TWO_PI/e+a)*scale;
      curveVertex(x3, y3);
      float x4 = centerX + c*cos(TWO_PI*i/index + TWO_PI/e+a)*scale;
      float y4 = centerY + c*sin(TWO_PI*i/index + TWO_PI/e+a)*scale;
      curveVertex(x4, y4);
      curveVertex(x1, y1);
      curveVertex(x1, y1);
      endShape();
    }
  }
  void gem2() {
    setUp(shapeSize);
    int index = int(numRandom);
    float a = variable/TWO_PI;
    float b = radius+radiusAdd/2;
    float c = random1/TWO_PI;
    float d = b+random2/10*(radiusAdd/2);
    float e = b-random2/10*(radiusAdd/2);
    for (int i = 0; i < index; i++) {
      float x1 = centerX + b*cos(TWO_PI*i/index+c+a)*scale;
      float y1 = centerY + b*sin(TWO_PI*i/index+c+a)*scale;
      float x2 = centerX + d*cos(TWO_PI*i/index+a)*scale;
      float y2 = centerY + d*sin(TWO_PI*i/index+a)*scale;
      float x3 = centerX + b*cos(TWO_PI*i/index-c+a)*scale;
      float y3 = centerY + b*sin(TWO_PI*i/index-c+a)*scale;
      float x4 = centerX + e*cos(TWO_PI*i/index+a)*scale;
      float y4 = centerY + e*sin(TWO_PI*i/index+a)*scale;
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
    }
  }
  //----- Secondary Functions -----
  void setUp(int size) {
    noFill();
    strokeWeight(circleSize);
    stroke(shapeColor);
    ellipse(centerX, centerY, radius*2*scale, radius*2*scale);
    ellipse(centerX, centerY, radiusNew*2*scale, radiusNew*2*scale);
    strokeWeight(size);
  }
}
