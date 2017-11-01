class Room {
  PVector pos = new PVector();
  int nPath, xSize, ySize, nr, group = 0, nrg;
  boolean link = true;
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
  void n() {
    pushMatrix();
    translate(s/2, s/2);
    strokeWeight(s*0.3);
    stroke(0);
    line((int)(pos.x*s), (int)(pos.y*s), (int)(room.get(nr).pos.x*s), (int)(room.get(nr).pos.y*s));
    popMatrix();
  }
  void c() {
    pushMatrix();
    translate(s/2, s/2);
    strokeWeight(s*0.2);
    stroke(160, 100, 50);
    line((int)(pos.x*s), (int)(pos.y*s), (int)(room.get(nr).pos.x*s), (int)(room.get(nr).pos.y*s));
    popMatrix();
  }
  void paint() {
    fill(160, 100, 50);
    pushMatrix();
    stroke(200);
    strokeWeight(2);
    translate(pos.x*s+s/2, pos.y*s+s/2);

    rect(-xSize/2, -ySize/2, xSize, ySize);
    popMatrix();
  }
  void paintN() {
    pushMatrix();
    stroke(0);
    strokeWeight(2);
    translate(pos.x*s+s/2, pos.y*s+s/2);

    fill(0, 255, 0);
    textSize(50);
    text(group, 0, 0);
    popMatrix();
  }
  void paintLGroup() {
    delay(10);
    pushMatrix();
    translate(s/2, s/2);
    strokeWeight(s*0.1);
    stroke(0, 0, 255);

    line((int)(pos.x*s), (int)(pos.y*s), (int)(room.get(nrg).pos.x*s), (int)(room.get(nrg).pos.y*s));
    popMatrix();
  }
  void nearestGroup() {
    for (int r = 0; r<room.size(); r++) { 
      if ((pos.copy().sub(room.get(r).pos)).mag()<near && (pos.copy().sub(room.get(r).pos)).mag()!=0) { 

        if (room.get(r).group != this.group) {
          near = (pos.copy().sub(room.get(r).pos)).mag();
          nrg = r;
          //println("hey", near, group, room.get(r).group);
        }
      }
    }  
    near = width;
  }
  void selectNearest() {
    if (nrg < nearest2) {
      nearest2 = nrg; 
      //nearestR = this;
    }
  }
  void nearest() {
    for (int r = 0; r<room.size(); r++) { 
      if ((pos.copy().sub(room.get(r).pos)).mag()<near && (pos.copy().sub(room.get(r).pos)).mag()!=0) { 
        near = (pos.copy().sub(room.get(r).pos)).mag();
        nr = r;
      }
    }  
    near = width;
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
    this.xSize = (int)random(s*0.4, s);
    this.ySize = (int)random(s*0.4, s);
  }
  Room() {
    this.pos = new PVector((int)random(0, width/s), (int)random(0, height/s));
    this.nPath = 1;
    this.xSize = (int)random(s*0.4, s);
    this.ySize = (int)random(s*0.4, s);
  }
}