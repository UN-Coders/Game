int s, cols, rows, nRooms;
ArrayList<Room> room = new ArrayList<Room>();
ArrayList<Path> path = new ArrayList<Path>();

boolean[][] space;

void setup() {
  size(1500, 1500);
  s = 50;
  nRooms = 50;
  cols = width/s;
  rows = height/s;
  space = new boolean[cols][rows];

  for (int x = 0; x<cols; x++) {     
    for (int y = 0; y<rows; y++) {    
      if (chance(5)) {    
        if (!space[x][y]==true) room.add(new Room(x, y));    
        space[x][y]=true;
      }
    }
  }

  //for (int r = 0; r < nRooms; r++) {
  //  Room t = new Room();
  //  for (Room rr : room)
  //    if (rr == t)t = new Room();
  //  room.add(t);
  //}
  room.get(0).detectRelation();
} 
int cont = 0;
void draw() {
  translate(s/2, s/2);
  if (cont == 0)
    for (Room r : room) 
      r.paint();
  if (cont < path.size()) 
    path.get(cont++).paint();
  delay(400);
}
boolean chance(float percentage) {    
  return random(0, 100)<percentage;
}