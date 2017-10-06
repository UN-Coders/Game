int i = 0;

Player p1;
Terrain t1;

void setup() {
  size(1300, 730, P3D);
  //fullScreen(P3D);
  p1 = new Player();
  t1 = new Terrain();
  p1.init();
  t1.init();
}

void draw() {
  println(frameRate);
  if (frameCount%7 == 0) {
    i++;
    if (i == 3)i=0;
    background(0);
    t1.paint();
    p1.paint();
  }
  p1.move();
}