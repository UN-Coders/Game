class Text {
  void paint() {
    pushMatrix();
    textSize(50);
    text("x: "+p1.x,width/2,height/2);
    popMatrix();
  }
}