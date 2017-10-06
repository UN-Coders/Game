class Terrain {
  int nTerrain = 8, mapSize = 70, mapSquareSize = 100;
  PImage[] s = new PImage[nTerrain];
  ArrayList<Integer> terrainX = new ArrayList<Integer>();
  ArrayList<Integer> terrainY = new ArrayList<Integer>();
  HashMap<String, Integer> hMap = new HashMap<String, Integer>();
  void init() {
    for (int i = 0; i<nTerrain; i++)s[i] = loadImage("Terrain/Suelo"+(i+1)+".jpg");

    terrainX.add((int)(p1.x-p1.x%300));
    terrainY.add((int)(p1.z-p1.z%300));
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
  void paint() {
    pushMatrix();
    translate(-mapSquareSize*mapSize/2,p1.pS/2, -mapSquareSize*mapSize/2);
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
    //float nois =0;
    /*if (terrainX.get(terrainX.size()-1) != (int)(x-x%300) || terrainY.get(terrainY.size()-1) != (int)(z-z%300)) {
     terrainX.add((int)(x-x%300));
     terrainY.add((int)(z-z%300));
     
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
  }
  Terrain() {
  }
}