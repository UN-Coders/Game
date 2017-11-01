class Room {
  PVector pos = new PVector();
  int nPath, xSize, ySize, nr, group = 0;

  void detectRelation(int r) {

    if (room.get(room.get(room.get(r).nr).nr).equals(room.get(r))) {

      if (room.get(room.get(r).nr).group == 0) {
        if (group != 0)
          room.get(room.get(r).nr).group = group;
        else {
          room.get(room.get(r).nr).group = group = nGr;
          nGr++;
        }
      }
    } else {
      if (room.get(room.get(r).nr).group != 0) {
        if (group == 0) {
          group = room.get(room.get(r).nr).group;
        }
      } else {
        if (group != 0)
          room.get(room.get(r).nr).group = group; 
        else {
          room.get(room.get(r).nr).detectRelation(room.get(r).nr);
          room.get(r).detectRelation(r);
        }
      }
    }
  }
  void paint() {

    fill(160, 100, 50);
    strokeWeight(0);
    rect(pos.x*s, pos.y*s, xSize, ySize);
  }
  void nearest() {
    for (int r = 0; r<room.size(); r++) { 
      if ((pos.copy().sub(room.get(r).pos)).mag()<near && (pos.copy().sub(room.get(r).pos)).mag()!=0) { 
        near = (pos.copy().sub(room.get(r).pos)).mag();
        nr = r;
      }
    }  

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