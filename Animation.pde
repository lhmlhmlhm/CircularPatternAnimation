class Animation {
  int xMax;
  int yMax;
  int total;
  boolean isPlaying = false, isEnd = true;
  int playIndex = 0;
  ArrayList<Integer> effect = new ArrayList<Integer>();
  ArrayList<Archor> archor = new ArrayList<Archor>();
  //----- Timer Class -----
  FrameTimer frameTimer;
  FrameTimer intervalTimer;
  //FrameTimer timer;
  boolean actionCall = false;
  //----- Animation -----
  boolean variableForCross = true;
  boolean ifAnimationFinish = false;
  int totalAnimaton = 6;
  int animationFrame;
  int countLastLength;
  //----- Init -----
  Animation(int xMax, int yMax) {
    this.xMax = xMax;
    this.yMax = yMax;
    total = xMax*yMax;
    setupAchors();
    setupTimer();
  }
  //----- Main Functions -----
  void start() {
    if (!isPlaying) {
      resetArray();
      playIndex = int(random(totalAnimaton));
      //playIndex = 1;
      //playIndex ++;
      //playIndex = (playIndex < 6)? playIndex+1: 0;
      playSetup();
      isPlaying = true;
      //println(playIndex);
      //println("playIndex: " + playIndex);
      //println("effect: " + effect);
    }
  }
  void play() {
    if (isPlaying) {
      switch(playIndex) {
      case 0:
        crossing();
        break;
      case 1:
        hMoveLtoR();
        break;
      case 2:
        hMoveRtoL();
        break;
      case 3:
        vMoveTtoB();
        break;
      case 4:
        vMoveBtoT();
        break;
      case 5:
        crossing();
        break;
      }
    }
  }
  void playSetup() {
    switch(playIndex) {
      //crossing
    case 0:
      int a = int(random(total));
      activeIndex(a);
      break;
      //vMoveLtoR
    case 1:
      animationFrame = 0;
      break;
      //vMoveRtoL
    case 2:
      animationFrame = xMax;
      break;
      //hMoveTtoB
    case 3:
      animationFrame = 0;
      break;
      //hMoveBtoT
    case 4:
      animationFrame = yMax-1;
      break;
    case 5:
      int b = int(random(total));
      activeIndex(b);
      break;
    }
  }
  //----- Secondary Functions -----
  void setupAchors() {
    for (int i = 0; i < yMax; i++) {
      for (int j = 0; j < xMax; j++) {
        archor.add(new Archor(j, i));
      }
    }
  }
  void resetArray() {
    effect.clear();
  }
  void resetVariables() {
    //countLastLength = 1;
    //resetArray();
    variableForCross = true;
    isPlaying = false;
  }
  void resetAchors() {
    for (int i = 0; i < archor.size(); i++) {
      archor.get(i).notSelect = true;
    }
  }
  boolean finishCheck() {
    if (effect.size() >= total) {
      resetVariables();
      resetAchors();
      intervalTimer.restartTimer();
      return true;
    } else return false;
  }
  void activeIndex(int a) {
    effect.add(a);
    archor.get(a).notSelect = false;
  }
  int lastMessageLength() {
    return countLastLength;
  }
  //----- Animation Inventory -----
  void hWavaLtoR() {
  }
  void randoms() {
    int a = int(random(total));
    int b = int(random(total));
    for (int i = 0; i < total; i++) {
      while (archor.get(a).notSelect) activeIndex(i);

      if (finishCheck()) return;
    }
  }
  void crossing() {
    if (variableForCross) {
      variableForCross = false;
      return;
    }
    int s = effect.size();
    for (int i = 0; i < s; i++) {
      //println(s);
      int v = effect.get(i);
      int a = v-xMax;
      int b = v+xMax;
      int c = v%xMax;
      int d = v%xMax;
      if (a>=0 && archor.get(a).notSelect) activeIndex(a);
      if (b<total && archor.get(b).notSelect) activeIndex(b);
      if (c!=0 && archor.get(v-1).notSelect) activeIndex(v-1);
      if (d!=xMax-1 && archor.get(v+1).notSelect) activeIndex(v+1);
      if (finishCheck()) return;
    }
  }
  void hMoveLtoR() {
    for (int i = 0; i < total; i++) {
      if (i%xMax == animationFrame) activeIndex(i);
      if (finishCheck()) return;
    }
    animationFrame++;
  }
  void hMoveRtoL() {
    for (int i = 0; i < total; i++) {
      if (i%xMax == xMax-animationFrame) activeIndex(i);
      if (finishCheck()) return;
    }
    animationFrame--;
  }
  void vMoveTtoB() {
    for (int i = 0; i < total; i++) {
      if (int(i/xMax) == animationFrame) activeIndex(i);
      if (finishCheck()) return;
    }
    animationFrame++;
  }
  void vMoveBtoT() {
    for (int i = 0; i < total; i++) {
      if (int(i/xMax) == animationFrame) activeIndex(i);
      if (finishCheck()) return;
    }
    animationFrame--;
  }
  //----- Timer Class -----
  void call() {
    frameTimer.call();
    intervalTimer.call();
  }
  void checkEnd() {
    isEnd = (!isPlaying)? true: false;
  }
  void setupTimer() {
    frameTimer = new FrameTimer(3);
    frameTimer.addAction(new AnimationAction() {
      void frameEndAction() {
        play();
        int a = effect.size();
        countLastLength = (a != total)?a: 0;
        //if(isPlaying) actionCall = true;
        if (!isEnd) actionCall = true;
        //println(effect);
      }
    }
    );

    intervalTimer = new FrameTimer(24);
    intervalTimer.addAction(new AnimationAction() {
      void frameEndAction() {
        if (intervalTimer.process) {
          start();
          intervalTimer.process = false;
        }
      }
    }
    );
  }
  //----- Inner Class -----
  class Archor {
    int x;
    int y;
    boolean notSelect = true;
    Archor(int x, int y) {
      this.x = x;
      this.y = y;
    }
  }
}
