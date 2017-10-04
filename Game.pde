int i = 0;

Player p1;
Terrain t1;

void setup() {
  size(1500, 1000, P3D);
  //fullScreen(P3D);
  p1 = new Player(width/2, height/2, width/10, 100);
  t1 = new Terrain();
  p1.init();
  t1.init();
}

void draw() {
  if (frameCount%7 == 0) {
    i++;
    if (i == 3)i=0;

    t1.paint();
    p1.paint();
  }
  p1.move();
}