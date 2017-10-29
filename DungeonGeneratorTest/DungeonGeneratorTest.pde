int s, cols, rows, nRooms;
ArrayList<Room> room = new ArrayList<Room>();
ArrayList<Path> path = new ArrayList<Path>();

void setup() {
  size(1500, 1500);
  s = 50;
  nRooms = 50;
  cols = width/s;
  rows = height/s;
  for (int r = 0; r < nRooms; r++) {
    Room t = new Room();
    for (Room rr : room)
      if (rr == t)t = new Room();
    room.add(t);
  }
  room.get(0).detectRelation();
} 
int cont = 0;
void draw() {
  translate(s/2, s/2);
  if(cont == 0)
    for (Room r : room) 
      r.paint();
  if (cont < path.size()) 
    path.get(cont++).paint();
  delay(400);
}