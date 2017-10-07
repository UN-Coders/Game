class Terrain {
  int nTerrain = 8, mapSize = 100, mapSquareSize = 100;
  float noiseHeight, amplitude;
  PImage[] s = new PImage[nTerrain];
  ArrayList<Integer> terrainX = new ArrayList<Integer>();
  ArrayList<Integer> terrainY = new ArrayList<Integer>();
  HashMap<String, Float> hMap = new HashMap<String, Float>();
  void init() {
    for (int i = 0; i<nTerrain; i++)s[i] = loadImage("Terrain/Suelo"+(i+1)+".jpg");

    float timeX = 0;
    for (int i = 0; i<mapSize; i++) {
      float timeY = 0;
      for (int j = 0; j<mapSize; j++) {
        amplitude = 1;
        noiseHeight = 0;
        for (int k = 0; k<2; k++) {
          float perlinValue = noise(timeX, timeY)*2-1;
          noiseHeight += perlinValue * amplitude;
          amplitude /= 10;
        }
        timeY += 0.2;
        hMap.put("X"+i+"Y"+j, map(noiseHeight, -1, 1, 0, 1));
      }
      timeX += 0.2;
    }
  }
  void paint() {
    pushMatrix();
    translate(-mapSquareSize*mapSize/2, p1.pS/2, -mapSquareSize*mapSize/2);
    rotateX(PI/2);
    imageMode(CENTER);

    for (int i = 0; i<mapSize; i++) {
      for (int j = 0; j<mapSize; j++) {
        if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<5)image(s[7], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<10)image(s[6], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<15)image(s[5], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<40)image(s[4], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<65)image(s[3], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<70)image(s[2], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<75)image(s[1], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
        else if (map(hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<80)image(s[0], i*mapSquareSize, j*mapSquareSize, mapSquareSize, mapSquareSize);
      }
    }
    popMatrix();
  }
}