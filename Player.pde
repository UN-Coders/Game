class Player {
  float x =0, y =0, z =0, pS =100/*Player size*/, fov =1000, speed = 50;
  int spriteCount = 0;
  PImage[] spl = new PImage[3];//Sprite Player Lateral
  PImage[] spb = new PImage[3];//Sprite Player Back
  PImage[] spf = new PImage[3];//Sprite Player Front
  void init() {
    for (int i = 0; i<3; i++) {
      spl[i] = loadImage("Sprites/SPL"+(i+1)+".png");
      spb[i] = loadImage("Sprites/SPE"+(i+1)+".png");
      spf[i] = loadImage("Sprites/SPF"+(i+1)+".png");
    }
  }
  void paint() {
    spriteCount++;
    if (spriteCount == 3)spriteCount=0;
    pushMatrix();
    translate(x, y, z);
    rotateX(PI/4);
    imageMode(CENTER);
    if (key == 'd' || key == 'D') {
      if (keyPressed)image(spl[spriteCount], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'a' || key == 'A') {
      scale(-1, 1);
      if (keyPressed)image(spl[spriteCount], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'w' || key == 'W') {
      if (keyPressed)image(spb[spriteCount], 0, 0, pS, pS);
      else image(spb[0], 0, 0, pS, pS);
    } else if (key == 's' || key == 'S') {
      if (keyPressed)image(spf[spriteCount], 0, 0, pS, pS);
      else image(spf[0], 0, 0, pS, pS);
    } else image(spf[0], 0, 0, pS, pS);

    popMatrix();
    camera(x, y-fov, z+fov, x, y, z, 0, 1, 0);
  }
  void move() {
    if (keyPressed) {
      x += key == 'd'&& x<(t1.mapSize/2-1)*t1.mapSquareSize? speed: key == 'a'&& x>-t1.mapSize/2*t1.mapSquareSize? -speed:0;
      z += key == 's'&& z<(t1.mapSize/2-1)*t1.mapSquareSize? speed: key == 'w'&& z>-t1.mapSize/2*t1.mapSquareSize? -speed:0;
      fov += keyCode == DOWN && fov<2000? speed: keyCode == UP && fov>200? -speed:0;
    }
  }
}