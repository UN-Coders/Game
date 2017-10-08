class Player {
  int x =0, y =0, z =0, pS =100/*Player size*/, temx, temz;
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
    imageMode(CENTER);
    rotateX(PI/2);
    translate(x*pS, z*pS);
    if (key == 'd' | key == 'D') {
      if (keyPressed)image(spl[spriteCount], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'a' | key == 'A') {
      scale(-1, 1);
      if (keyPressed)image(spl[spriteCount], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'w' | key == 'W') {
      if (keyPressed)image(spb[spriteCount], 0, 0, pS, pS);
      else image(spb[0], 0, 0, pS, pS);
    } else if (key == 's' | key == 'S') {
      if (keyPressed)image(spf[spriteCount], 0, 0, pS, pS);
      else image(spf[0], 0, 0, pS, pS);
    } else image(spf[0], 0, 0, pS, pS);
    popMatrix();
  }
  void move() {
    if (keyPressed) {
      /*temx*/ x += key == 'd'&& x<mapT.mapSize/2? 1: key == 'a'&& x>-mapT.mapSize/2? -1:0;
      /*temz*/ z += key == 's'&& z<mapT.mapSize/2? 1: key == 'w'&& z>-mapT.mapSize/2? -1:0;
      mapC.fov += keyCode == DOWN && mapC.fov<2000? 10: keyCode == UP && mapC.fov>500? -10:0;
      //if (!(mapT.hMap.get("X"+temx+"Y"+temz)==50))x = temx;
      //if (!(mapT.hMap.get("X"+temx+"Y"+temz)==50))z = temz;
    }
  }
}