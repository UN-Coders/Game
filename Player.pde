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
    int tx = x, tz = z;
    tx += x<mapT.mapSize/2 && x>-mapT.mapSize/2?east  - west:0;
    tz += z<mapT.mapSize/2 && z>-mapT.mapSize/2?south - north:0;
    mapC.fov += keyCode == DOWN && mapC.fov<2000? 10: keyCode == UP && mapC.fov>1000? -10:0;
    println(mapT.hMap.get("X"+(tx+mapT.mapSize/2)+"Y"+(tz+mapT.mapSize/2)));
    if (mapT.hMap.get("X"+(tx+mapT.mapSize/2)+"Y"+(tz+mapT.mapSize/2))<40) {
      x = tx; 
      z = tz;
    }
  }
  void setDirection(int k, int spd) {
    if      (k == 'W')  north = spd;
    else if (k == 'S')  south = spd;
    else if (k == 'A')  west  = spd;
    else if (k == 'D')  east  = spd;
  }
}