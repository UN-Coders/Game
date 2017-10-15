int s = 50, cols, rows,nGr = 1;
float near = 100;
ArrayList<Room> room = new ArrayList<Room>();
boolean[][] space;
boolean nearest = false, secondClick = false;
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
      if (chance(5)) {
        if (!space[x][y]==true) room.add(new Room(x, y));
        space[x][y]=true;
      }
    }
  }
}
void draw() {
  for (int i = 0; i<width/s; i++) {
    for (int j = 0; j<height/s; j++) {
      pushMatrix();
      translate(i*s,j*s);
      fill(255, 100);
      strokeWeight(0);
      
      rect(0, 0, s, s);
      fill(0);
      textAlign(RIGHT);
      text(i+" "+j,s,s);
      popMatrix();
    }
  }
  for (int r = 0; r<room.size(); r++) {
    room.get(r).paint();
  }
  for (int r = 0; r<room.size() && !nearest; r++) {
    room.get(r).nearest();
  }
  for (int r = 0; r<room.size(); r++) { 
      room.get(r).detectRelation(r);
      println(room.get(r).group, room.get(r).pos.x, room.get(r).pos.y);
    }
  if(secondClick )noLoop();
}
boolean chance(float percentage) {
  return random(0, 100)<percentage;
}
void mouseClicked() {
  if (mouseButton == RIGHT && !secondClick){reset(); secondClick = true;}
  if (mouseButton == LEFT)setup();
}