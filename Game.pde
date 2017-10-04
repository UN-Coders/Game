float cx, cy, cz;
int nTerrain = 8, i = 0, mapSize = 40, mapSquareSize = 300, fov =1000, speed = 10;
PImage[] s = new PImage[nTerrain];
PImage[] spl = new PImage[3];
PImage[] spe = new PImage[3];
PImage[] spf = new PImage[3];
float pS;
ArrayList<Integer> terrainX = new ArrayList<Integer>();
ArrayList<Integer> terrainY = new ArrayList<Integer>();
HashMap<String, Integer> hMap = new HashMap<String, Integer>();
void setup() {
  //size(1500, 1000, P3D);
  fullScreen(P3D);
  for (int i = 0; i<nTerrain; i++) {
    s[i] = loadImage("Terrain/Suelo"+(i+1)+".jpg");
  }
  for (int i = 0; i<3; i++) {
    spl[i] = loadImage("Sprites/SPL"+(i+1)+".png");
    spe[i] = loadImage("Sprites/SPE"+(i+1)+".png");
    spf[i] = loadImage("Sprites/SPF"+(i+1)+".png");
  }
  cx = width/2;
  cy = height/2;
  pS = width/10;
  terrainX.add((int)(cx-cx%300));
  terrainY.add((int)(cz-cz%300));
  float yoff = 0;
  for (int i = 0; i<mapSize; i++) {
    float xoff = 0;
    for (int j = 0; j<mapSize; j++) {
      hMap.put("X"+i+"Y"+j, (int)map(noise(xoff, yoff), 0, 1, 0, nTerrain*10));
      xoff += 0.2;
    }
    yoff += 0.2;
  }
}

float nois =0;

void draw() {
  if (frameCount%7 == 0) {
    background(0);
    i++;
    if (i == 3)i=0;


    pushMatrix();
    translate(width/2-mapSquareSize*mapSize/2, height/2+pS/2, -mapSquareSize*mapSize/2);
    rotateX(PI/2);
    imageMode(CENTER);
    //rect(0,0,10000,10000);

    for (int i = 0; i<mapSize; i++) {
      for (int j = 0; j<mapSize; j++) {
        int r = 0;
        for (int k = 0; k < nTerrain; k++) {
          if (hMap.get("X"+i+"Y"+j) >= r && hMap.get("X"+i+"Y"+j)<r+10)image(s[k], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
          r+=10;
        }
      }
    }
    /*if (terrainX.get(terrainX.size()-1) != (int)(cx-cx%300) || terrainY.get(terrainY.size()-1) != (int)(cz-cz%300)) {
     terrainX.add((int)(cx-cx%300));
     terrainY.add((int)(cz-cz%300));
     
     terrainN.add((int)(map(noise(nois), 0, 1, 0, 40)));
     
     nois += 0.2;
     }
     println(terrainN.get(terrainN.size()-1));
     for (int i = 0; i<terrainN.size(); i++) {
     if (terrainN.get(i) >= 0 && terrainN.get(i)<10)image(s3, terrainX.get(i)-600, terrainY.get(i), 300, 300);
     if (terrainN.get(i) >= 10 && terrainN.get(i)<15)image(s5, terrainX.get(i)-600, terrainY.get(i), 300, 300);
     if (terrainN.get(i) >= 15 && terrainN.get(i)<26)image(s4, terrainX.get(i)-600, terrainY.get(i), 300, 300);
     if (terrainN.get(i) >= 26 && terrainN.get(i)<30)image(s, terrainX.get(i)-600, terrainY.get(i), 300, 300);
     if (terrainN.get(i) >= 30 && terrainN.get(i)<40)image(s2, terrainX.get(i)-600, terrainY.get(i), 300, 300);
     }*/
    popMatrix();

    pushMatrix();
    translate(cx, cy, cz);
    imageMode(CENTER);
    if (key == 'd') {
      if (keyPressed)image(spl[i], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'a') {
      scale(-1, 1);
      if (keyPressed)image(spl[i], 0, 0, pS, pS);
      else image(spl[0], 0, 0, pS, pS);
    } else if (key == 'w') {
      if (keyPressed)image(spe[i], 0, 0, pS, pS);
      else image(spe[0], 0, 0, pS, pS);
    } else if (key == 's') {
      if (keyPressed)image(spf[i], 0, 0, pS, pS);
      else image(spf[0], 0, 0, pS, pS);
    } else image(spf[0], 0, 0, pS, pS);

    popMatrix();

    camera(cx, cy-fov, cz+fov, cx, cy, cz, 0, 1, 0);
    if (cy<height/2)cy = height/2;
  }
  if (keyPressed) {
    cx += key == 'd'? speed: key == 'a'? -speed:0;
    cz += key == 's'? speed: key == 'w'? -speed:0;
    fov += keyCode == DOWN? speed: keyCode == UP? -speed:0;
  }
}