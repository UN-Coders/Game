class Room {
  int x, y, tX, tY;
  boolean[] walls = new boolean[4];
  boolean visited, current;
  Room[] ne = new Room[4];
  void initWalls() {
    if (y-1 >= 0)this.ne[0] = room[x][y-1];
    if (x+1 < cols)this.ne[1] = room[x+1][y];
    if (y+1 < rows)this.ne[2] = room[x][y+1];
    if (x-1 >= 0)this.ne[3] = room[x-1][y];
  }
  void paintDungeon() {
    stroke(200,100,55);
    strokeWeight(0);
    if (rooms[x][y]) {
      pushMatrix();
      fill(200,100,55);
      translate(x*s+s/2, y*s+s/2);
      rect(-tX/2, -tY/2, tX, tY);
      popMatrix();
    }
    strokeWeight(s/6);
    pushMatrix();
    translate(x*s+s/2, y*s+s/2);
    if (!walls[0])line(0,0,0,-s);
    if (!walls[1])line(0,0,s,0);
    if (!walls[2])line(0,0,0,s);
    if (!walls[3])line(0,0,-s,0);
    popMatrix();
    if (current)this.visited = true;
    if (current)select();
  }
  void select() {
    int dir = (int)random(0, 4);
    if (ne[dir] != null) {

      if (!ne[0].visited || !ne[1].visited || !ne[2].visited || !ne[3].visited) {
        if (!ne[dir].visited) {
          ne[dir].current = true;
          this.current = false;
          vis.add(this);
          if (dir == 0) {
            this.walls[0] = false;
            ne[dir].walls[2] = false;
          }
          if (dir == 1) {
            this.walls[1] = false;
            ne[dir].walls[3] = false;
          }
          if (dir == 2) {
            this.walls[2] = false;
            ne[dir].walls[0] = false;
          }
          if (dir == 3) {
            this.walls[3] = false;
            ne[dir].walls[1] = false;
          }
        }
      } else {
        this.current = false;
        if (vis.size()>0) {
          vis.get(vis.size()-1).current = true;
          vis.remove(vis.size()-1);
        }
      }
    }
  }
  Room(int x, int y) {
    this.x = x;
    this.y = y;
    for (int i = 0; i<4; i++) {
      this.walls[i] = true;
      this.ne[i] = this;
    }
    this.tX = (int)random(s/6,s);
    this.tY = (int)random(s/6,s);
  }
}