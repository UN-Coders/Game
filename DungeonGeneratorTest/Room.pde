float nearest;
Room tR;
class Room {
  PVector pos;
  Room nr;
  int group;

  void detectRelation() {
    nearest = width;

    for (Room r : room)
      if (PVector.sub(pos, r.pos).mag()<nearest && PVector.sub(pos, r.pos).mag() >= 1 && r.nr == null) {
        nearest = PVector.sub(pos, r.pos).mag();
        println(nearest);
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
    strokeWeight(5);
    fill(160, 100, 50);
    translate(pos.x*s, pos.y*s);
    rect(-s/2, -s/2, s, s);
    popStyle();
    popMatrix();
  }
  Room() {
    pos = new PVector((int)random(0, cols), (int)random(0, rows));
  }
}