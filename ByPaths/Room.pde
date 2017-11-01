float nearest;
Room tR;
class Room {
  PVector pos;
  Room nr;
  int group, xSize, ySize;

  void detectRelation() {
    nearest = width;

    for (Room r : room)
      if (PVector.sub(pos, r.pos).mag()<nearest && PVector.sub(pos, r.pos).mag() >= 1 && r.nr == null) {
        nearest = PVector.sub(pos, r.pos).mag();
        tR = r;
      }
    for (Room r : room)
      if (r == tR && nr == null) {
        nr = r;
        path.add(new Path(this, nr));
      }
    if (nr.nr == null)
      nr.detectRelation();
  }
  void paint() {
    pushMatrix();
    pushStyle();
    stroke(0);
    strokeWeight(1);
    fill(160, 100, 50);
    translate(pos.x*s, pos.y*s);
    rect(-xSize/2, -ySize/2, xSize, ySize);
    popStyle();
    popMatrix();
  }
  Room(int posX, int posY) {
    pos = new PVector(posX,posY);
    this.xSize = (int)random(s*0.2, s);    
    this.ySize = (int)random(s*0.2, s);
  }
  Room() {
    pos = new PVector((int)random(0, cols), (int)random(0, rows));
    this.xSize = (int)random(s*0.2, s);    
    this.ySize = (int)random(s*0.2, s);
  }
}