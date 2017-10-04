class Player {
  float cx, cy, cz, pS, fov =1000, speed = 10;
  PImage[] spl = new PImage[3];
  PImage[] spe = new PImage[3];
  PImage[] spf = new PImage[3];
  Player(float cx, float cy, float cz, float pS) {
    this.cx = cx;
    this.cy = cy;
    this.cz = cz;
    this.pS = pS;
  }
  void init() {
    for (int i = 0; i<3; i++) {
      spl[i] = loadImage("Sprites/SPL"+(i+1)+".png");
      spe[i] = loadImage("Sprites/SPE"+(i+1)+".png");
      spf[i] = loadImage("Sprites/SPF"+(i+1)+".png");
    }
  }
  void paint() {

    pushMatrix();
    translate(cx, cy, cz);
    fill(255, 0, 0);
    rotateX(PI/4);
    //box(45);
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
  void move() {
    if (keyPressed) {
      cx += key == 'd'? speed: key == 'a'? -speed:0;
      cz += key == 's'? speed: key == 'w'? -speed:0;
      fov += keyCode == DOWN? speed: keyCode == UP? -speed:0;
    }
  }
}