class Text {
  void paint() {
    pushMatrix();
    textSize(50);
    textAlign(LEFT, TOP);
    text("x: "+(int)p1.x, 0, 0);
    text("z: "+(int)p1.z, 0, 50);
    text("fov: "+(int)cam1.fov, 0, 100);
    text("fps: "+(int)frameRate, 0, 150);
    
    translate(width-t1.mapSize*t1.mapSquareSize*0.02,height-t1.mapSize*t1.mapSquareSize*0.02);
    rect(-5,-5,t1.mapSize*2+5,t1.mapSize*2+5);
    scale(0.02);
    
    
    for (int i = 0; i<t1.mapSize; i++) {
      for (int j = 0; j<t1.mapSize; j++) {
        if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<5)image(t1.s[7], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<10)image(t1.s[6], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<15)image(t1.s[5], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<40)image(t1.s[4], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<65)image(t1.s[3], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<70)image(t1.s[2], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<75)image(t1.s[1], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
        else if (map(t1.hMap.get("X"+i+"Y"+j), 0, 1, 0, 80)<80)image(t1.s[0], i*t1.mapSquareSize, j*t1.mapSquareSize, t1.mapSquareSize, t1.mapSquareSize);
      
        
      }
    }
    popMatrix();
  }
}