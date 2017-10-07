class Text {
  void paint() {
    pushMatrix();
    textSize(50);
    textAlign(LEFT, TOP);
    text("x: "+p1.x,0,0);
    text("z: "+p1.z,0,50);
    text("fov: "+cam1.fov,0,100);
    text("fps: "+frameRate,0,150);
    popMatrix();
  }
}