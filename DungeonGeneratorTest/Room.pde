class Room {
  PVector pos = new PVector();
  int nPath, xSize, ySize;

  void paint() {

    fill(160, 100, 50);
    strokeWeight(0);
    rect(pos.x*s, pos.y*s, xSize, ySize);
  }
  void nearest() {
    for (int r2 = 0; r2<room.size(); r2++) { 
      if ((pos.copy().sub(room.get(r2).pos)).mag()<near && (pos.copy().sub(room.get(r2).pos)).mag()!=0) { 
        near = (pos.copy().sub(room.get(r2).pos)).mag();
        nr = r2;
      }
    }  

    //pushMatrix(); 
    //beginShape();
    //translate(xSize/2, ySize/2);
    //vertex((int)pos.x*s, (int)pos.y*s);
    //strokeWeight(0);
    //fill(0, 255, 0, 200);
    //ellipse((int)pos.x*s, (int)pos.y*s, 20, 20);
    //translate(-xSize/2, -ySize/2);
    //translate(room.get(nr).xSize/2, room.get(nr).ySize/2);
    //vertex((int)room.get(nr).pos.x*s, (int)room.get(nr).pos.y*s);
    //strokeWeight(0);
    //fill(0, 0, 255, 200);
    //ellipse((int)room.get(nr).pos.x*s, (int)room.get(nr).pos.y*s, 20, 20);
    //strokeWeight(5);
    //endShape();
    //popMatrix();


    pushMatrix();
    translate(s/2, s/2);
    strokeWeight(s*0.2);
    line((int)pos.x*s, (int)pos.y*s, (int)room.get(nr).pos.x*s, (int)room.get(nr).pos.y*s);
    strokeWeight(0);
    fill(0, 255, 0, 200);
    ellipse((int)pos.x*s, (int)pos.y*s, s*0.6, s*0.2);
    fill(255, 0, 0, 200);
    ellipse((int)room.get(nr).pos.x*s, (int)room.get(nr).pos.y*s, s*0.2, s*0.6);
    popMatrix();
    near = 1000;
  }
  Room(int posX, int posY, int nPath, int xSize, int ySize) {
    this.pos.set(posX, posY);
    this.nPath = nPath;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  Room(int posX, int posY) {
    this.pos.set(posX, posY);
    this.nPath = 1;
    this.xSize = (int)random(s*0.2, s);
    this.ySize = (int)random(s*0.2, s);
  }
  Room() {
    this.pos = new PVector((int)random(0, width/s), (int)random(0, height/s));
    this.nPath = 1;
    this.xSize = (int)random(s*0.2, s);
    this.ySize = (int)random(s*0.2, s);
  }
}