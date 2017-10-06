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
    translate(-mapSquareSize*mapSize/2, p1.pS/2, -mapSquareSize*mapSize/2);
    rotateX(PI/2);
    imageMode(CENTER);

    for (int i = 0; i<mapSize; i++) {
      for (int j = 0; j<mapSize; j++) {
        int r = 0;
        for (int k = 0; k < nTerrain; k++) {
          if (hMap.get("X"+i+"Y"+j) >= r && hMap.get("X"+i+"Y"+j)<r+10)image(s[k], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
          r+=10;
        }
      }
    }
    popMatrix();
  }
}