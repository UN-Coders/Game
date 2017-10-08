class Terrain {
  int nTerrain = 8, mapSize = 100, mapSquareSize = 100, worldEdge;
  float noiseHeight, amplitude;
  PImage[] s = new PImage[nTerrain];
  HashMap<String, Integer> hMap = new HashMap<String, Integer>();
  void init() {
    for (int i = 0; i<nTerrain; i++)s[i] = loadImage("Terrain/Suelo"+(i+1)+".jpg");

    float timeX = 0;
    for (int i = 0; i<=mapSize; i++) {
      float timeY = 0;
      for (int j = 0; j<=mapSize; j++) {
        amplitude = 1;
        noiseHeight = 0;
        for (int k = 0; k<2; k++) {
          float perlinValue = noise(timeX, timeY)*2-1;
          noiseHeight += perlinValue * amplitude;
          amplitude /= 10;
        }
        timeY += 0.1;
        hMap.put("X"+i+"Y"+j, (int)map(noiseHeight, -1, 1, 0, 80));
        worldEdge = (int)map(noise(timeY*2), 0, 1, 5, 15);
        if (i<worldEdge || j<worldEdge || i > mapSize-worldEdge || j > mapSize-worldEdge) {
          hMap.put("X"+i+"Y"+j, 50);
        }
      }
      timeX += 0.1;
    }
  }
  void paint() {
    
    
    //translate(,);
    for (int i = 0; i<=mapSize; i++) {
      for (int j = 0; j<=mapSize; j++) {
        pushMatrix();
        rotateX(PI/2);
        translate(i*mapSquareSize-mapSquareSize*mapSize/2,j*mapSquareSize-mapSquareSize*mapSize/2);
        if (hMap.get("X"+i+"Y"+j)<5)image(s[7], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<10)image(s[6], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<15)image(s[5], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<40)image(s[4], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<65)image(s[3], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<70)image(s[2], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<75)image(s[1], 0, 0, mapSquareSize, mapSquareSize);
        else if (hMap.get("X"+i+"Y"+j)<80)image(s[0], 0, 0, mapSquareSize, mapSquareSize);
        popMatrix();
      }
    }
    
  }
}