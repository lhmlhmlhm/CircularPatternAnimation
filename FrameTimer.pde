class FrameTimer {
  //----- Setup -----
  int interval, savedFrame = 0;
  //----- Interface -----
  int passVariable = 0;
  boolean process = true;
  FrameAction FAction;
  AnimationAction AAction;
  FrameTimer(int interval) {
    this.interval = interval;
  }
  //----- Main Function For Timer -----
  void call() {
    if (checkTimer()) {
      savedFrame = frameCount;
      if(FAction!=null) FAction.frameEndAction();
      if(AAction!=null)AAction.frameEndAction();
    } else return;
  }
  boolean checkTimer() {
    return (frameCount >= (savedFrame+interval))? true: false;
  }
  void restartTimer(){
    savedFrame = frameCount;
    process = true;
  }
  void addAction(FrameAction _action) {
    FAction = _action;
  }
  void addAction(AnimationAction _action) {
    AAction = _action;
  }
  void setInterval(int interval){
    this.interval = interval;
  }
}
interface FrameAction {
  void frameEndAction();
  int getVariable();
}
interface AnimationAction {
  void frameEndAction();
}
