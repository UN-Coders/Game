
Terrain mapT = new Terrain();
Player mapP = new Player();
Camera mapC = new Camera();
Terrain miniT = mapT;
Text text = new Text();

int px, py, ix, iy;
int north, south, west, east;

void keyPressed() {
  mapP.setDirection(keyCode, 1);
}

void keyReleased() {
  mapP.setDirection(keyCode, 0);
}

void setup() {
  size(1500, 1000, P3D);
  frameRate(60);
  noiseSeed((int)random(0, 1000));
  //fullScreen(P3D); if active produce lag, have to fix
  mapT.init();
  mapP.init();
}

void draw() {
  if (frameCount %3 == 0) {
    background(0);
    pushMatrix(); // Print terrain, player and camera apart of the debug Screen ("text")
    mapC.paint();
    mapT.paint();
    mapP.paint();
    popMatrix();
    text.paint();
  }
  if (frameCount %4 == 0) {
    mapP.move();
  }
  mapC.move();
}