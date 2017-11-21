class Mob {
  //stats
  Table stats;
  TableRow row=stats.getRow(0);
  //sprites
  PImage sprite = new PImage();
  ArrayList<PImage> sp = new ArrayList<PImage>();
  int spriteCount = 0;

  int x, y, z, pS =100/*Player size pls dont modify*/;

  void init() {
    int key_= int(random(1,5));
    sprite = loadImage("sprites/Sprite "+(int)key_+".png");
    sp.clear();
    for (int j = 512; j<767; j+=64) {
      for (int i = 0; i<575; i+=64) {
        sp.add(sprite.get(i, j, 64, 64));
      }
    }
  }
  void paint() {

  }
}