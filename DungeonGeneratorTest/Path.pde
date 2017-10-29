class Path {
  Room a, b;
  PVector pathV;
  void paint() {
    pushStyle();
    stroke(205, 30, 15);
    strokeWeight(10);
    line(a.pos.x*s, a.pos.y*s, b.pos.x*s, b.pos.y*s);
    popStyle();
  }
  Path(Room a, Room b) {
    this.a = a;
    this.b = b;
    pathV = PVector.sub(this.a.pos,this.b.pos);
  }
}