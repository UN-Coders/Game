Player mapP = new Player();
Terrain mapT = new Terrain();
Camera mapC = new Camera();
Terrain miniT = mapT;
Text text = new Text();


void setup() {
  size(1500, 1000, P3D);
  frameRate(60);
  noiseSeed((int)random(0,100));
  //fullScreen(P3D);
  mapT.init();
  mapP.init();
}

void draw() {
  if (frameCount%2 == 0) {
    background(0);
    pushMatrix(); // Print terrain, player and camera apart of the debug Screen ("text")
    mapC.paint();
    mapT.paint();
    mapP.paint();
    popMatrix();
    text.paint();
  }
  mapC.move();
  mapP.move();
}