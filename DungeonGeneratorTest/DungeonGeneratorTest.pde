int nr, s = 50, cols, rows;
float near = 100;
ArrayList<Room> room = new ArrayList<Room>();
boolean[][] space;
void setup() {
  //fullScreen();
  size(1000, 600);
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
      if (chance(10)) {
        if (!space[x][y]==true) room.add(new Room(x, y));
        space[x][y]=true;
      }
    }
  }
}
void draw() {
  for (int i = 0; i<width/s; i++) {
    for (int j = 0; j<height/s; j++) {
      fill(255, 100);
      strokeWeight(0);
      rect(i*s, j*s, s, s);
    }
  }
  for (int r = 0; r<room.size(); r++) {
    room.get(r).paint();
  }
  for (int r = 0; r<room.size(); r++) {
    room.get(r).nearest();
  }
}
boolean chance(float percentage) {
  return random(0, 100)<percentage;
}
void mouseClicked() {
  if (mouseButton == RIGHT)reset();
  if (mouseButton == LEFT)setup();
}