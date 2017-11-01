int s = 100, cols, rows, nGr = 1, percentage = 40;
float near = width;
ArrayList<Room> room = new ArrayList<Room>();
boolean[][] space;
boolean nearest = false, secondClick = false;
ArrayList<Room> groups = new ArrayList<Room>();
int nearest2;
void setup() {
  //fullScreen();
  size(1500, 1500);
  cols = width/s;
  rows = height/s;
  space = new boolean[cols][rows];



  for (int i = 0; i<width/s; i++) {
    for (int j = 0; j<height/s; j++) {
      fill(255, 100);
      //rect(i*s, j*s, s, s);
    }
  }
}
void reset() {
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows; y++) {
      if (chance(percentage)) {
        if (!space[x][y]==true) room.add(new Room(x, y));
        space[x][y]=true;
      }
    }
  }
}
//Room nearestR;
void draw() {
  background(0);
  for (int i = 0; i<width/s; i++) {
    for (int j = 0; j<height/s; j++) {
      pushMatrix();
      translate(i*s, j*s);
      fill(255, 100);
      strokeWeight(0);
      //rect(0, 0, s, s);
      fill(0);
      textAlign(RIGHT);
      //text(i+" "+j,s,s);
      popMatrix();
    }
  }
  for (int r = 0; r<room.size() && !nearest; r++) room.get(r).nearest();

  for (int r = 0; r<room.size() && !nearest; r++) room.get(r).n();
  for (int r = 0; r<room.size(); r++) room.get(r).paint();
  for (int r = 0; r<room.size() && !nearest; r++) room.get(r).c();
  for (int r = 0; r<room.size(); r++) room.get(r).paintN();

  

  for (int r = 0; r<room.size(); r++)  room.get(r).detectRelation(r);                          // Split in groups


  
  //while (groups.size()<room.size()) {
  //  //println(groups.size(),room.size());
  //  groups.clear();
  //  for (Room g : room) 
  //    if (g.group == 1) groups.add(g);
  //  //println(groups.size());
  for (Room g : groups) g.nearestGroup();
  nearest2 = width; 
  //  //habitacion mas cercana
  for (Room g : groups) g.selectNearest();
    
  //  for (Room g : room) {
  //    println(g.link);
  //    if (nearest2 == g.nrg) { 
  //      room.get(g.nrg).group = 1;
  //      room.get(g.nrg).link = true;
  //    }
  //  }
  //}

  for (Room g : groups) 
    if (g.link)g.paintLGroup();
  //if (secondClick)noLoop();
}
boolean chance(float percentage) {
  return random(0, 100)<percentage;
}
void mouseClicked() {
  if (mouseButton == RIGHT && !secondClick) {
    reset(); 
    secondClick = true;
  }
  if (mouseButton == LEFT)setup();
}