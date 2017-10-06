int q = 0;

Player p1;
Terrain t1;
Camera cam1;
Text text;

void setup() {
  size(1500, 1000, P3D);
  frameRate(60);
  noiseSeed((int)random(0,100));
  //fullScreen(P3D);
  p1 = new Player();
  t1 = new Terrain();
  cam1 = new Camera();
  text = new Text();
  
  p1.init();
  t1.init();
}

void draw() {
  println(frameRate);
  if (frameCount%7 == 0) {
    q++;
    if (q == 3)q=0;
    background(0);
    pushMatrix(); // Separa el terreno, camara, y jugador, del debug Screen ("Text")
    cam1.paint();
    t1.paint();
    p1.paint();
    popMatrix();
    //text.paint();
  }
  p1.move();
}