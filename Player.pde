class Player {
  int x, y, z, pS =100/*Player size*/, temx, temz;
  int spriteCount = 0;
  PImage sprite = new PImage();
  ArrayList<PImage> sp = new ArrayList<PImage>();
  void init(int k) {
    println(k);
    sprite = loadImage("Sprite "+(k-48)+".png");
    sp.clear();
    for (int j = 512; j<767; j+=64) {
      for (int i = 0; i<575; i+=64) {
        sp.add(sprite.get(i, j, 64, 64));
      }
    }
    while (mapT.hMap.get("X"+(x+mapT.mapSize/2)+"Y"+(z+mapT.mapSize/2))<65 && mapT.hMap.get("X"+(x+mapT.mapSize/2)+"Y"+(z+mapT.mapSize/2)) >= 40) {
      x = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
      z = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
    }
  }
  void paint() {
    println(mapT.hMap.get("X"+(x+mapT.mapSize/2)+"Y"+(z+mapT.mapSize/2)));
    spriteCount++;
    if (spriteCount == 8)spriteCount=0;
    pushMatrix();
    imageMode(CENTER);
    rotateX(PI/2);
    translate(x*pS, z*pS);
    if      (south - north == -1) image(sp.get( 0+spriteCount), 0, 0, pS, pS);
    else if (east  - west  == -1) image(sp.get( 9+spriteCount), 0, 0, pS, pS);
    else if (east  - west  ==  1) image(sp.get(27+spriteCount), 0, 0, pS, pS);
    else if (south - north ==  1) image(sp.get(18+spriteCount), 0, 0, pS, pS);
    else image(sp.get(18), 0, 0, pS, pS);
    popMatrix();
  }
  void move() {
    int tx = x, tz = z;
    tx += x<mapT.mapSize/2 && x>-mapT.mapSize/2?east  - west:0;
    tz += z<mapT.mapSize/2 && z>-mapT.mapSize/2?south - north:0;
    mapC.fov += keyCode == DOWN && mapC.fov<2000? 10: keyCode == UP && mapC.fov>1000? -10:0;
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
  Player() {
    x = (int)random(-mapT.mapSize/2, mapT.mapSize/2);
    y = 0;
    z = (int)random(-mapT.mapSize/2, mapT.mapSize/2);
  }
}