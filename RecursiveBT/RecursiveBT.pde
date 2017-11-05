int s = 200, cols, rows;
ArrayList<Room> vis = new ArrayList<Room>();
Room[][] room;
boolean[][] rooms;
void setup() {
  //size(1000, 1000);
  fullScreen();
  cols=width/s;
  rows=height/s;
  room= new Room[cols][rows];
  rooms= new boolean[cols][rows];
  for (int x = 0; x<cols; x++)
    for (int y = 0; y<rows; y++)
      room[x][y] = new Room(x, y);
  for (int x = 0; x<cols; x++)
    for (int y = 0; y<rows; y++)
      room[x][y].initWalls();
  for (int x = 0; x<cols; x++)
    for (int y = 0; y<rows; y++)
      if(chance(90))rooms[x][y]=true;
      else rooms[x][y]=false;
  room[0][0].current = true;
}
void draw() {
  for (int x = 0; x<cols; x++)
    for (int y = 0; y<rows; y++)
      room[x][y].paintDungeon();
}
boolean chance(float percentage) {    
  return random(0, 100)<percentage;
}