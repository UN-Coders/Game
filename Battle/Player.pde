class Player {
  boolean inMap=true;
  //stats
  Table stats,inventory,config;
  TableRow rowStats,rowInventory,rowConfig;
  //sprites
  PImage sprite = new PImage();
  ArrayList<PImage> sp = new ArrayList<PImage>();
  ArrayList<PImage> spBattle=new ArrayList<PImage>();
  int spriteCount = 0;
  int x,y,z,pS=100;   /*Position, pS = player spriteSize*/
  
  Player(String saveSlot){
    config=loadTable("saves/"+saveSlot+"/playerConfig.csv", "header");
    stats= loadTable("saves/"+saveSlot+"/playerStats.csv", "header");
    inventory= loadTable("saves/"+saveSlot+"/playerInventory.csv", "header");
    rowStats=stats.getRow(0);
    rowInventory=inventory.getRow(0);
    rowConfig=config.getRow(0);
    this.init();
  }
  
  void init(){
    sprite = loadImage("sprites/Sprite "+rowConfig.getString("sprite")+".png");
    sp.clear();
    for (int j = 512; j<767; j+=64) {
      for (int i = 0; i<575; i+=64) {
        sp.add(sprite.get(i, j, 64, 64));
      }
    }
  }
  void paintCharacter(){
    pushMatrix();
    rectMode(CORNER);
    image(sp.get(27),width/10,height/7,width*1.3/4,height*1.5/3);
    image(sp.get(17),width*6/10,height/7,width*1.3/4,height*1.5/3);
    popMatrix();
  }
  
  ///Do not uncomment until the final merge with the master branch
  
  //void paintInMap() {
  //  println(mapT.hMap.get("X"+(x+mapT.mapSize/2)+"Y"+(z+mapT.mapSize/2)));
  //  spriteCount++;
  //  if (spriteCount == 8)spriteCount=0;
  //  pushMatrix();
  //  imageMode(CENTER);
  //  rotateX(PI/2);
  //  translate(x*pS, z*pS);
  //  if      (south - north == -1) image(sp.get( 0+spriteCount), 0, 0, pS, pS);
  //  else if (east  - west  == -1) image(sp.get( 9+spriteCount), 0, 0, pS, pS);
  //  else if (east  - west  ==  1) image(sp.get(27+spriteCount), 0, 0, pS, pS);
  //  else if (south - north ==  1) image(sp.get(18+spriteCount), 0, 0, pS, pS);
  //  else image(sp.get(18), 0, 0, pS, pS);
  //  popMatrix();
  //}
  void paintInBattle(){
    pushMatrix();
    imageMode(CENTER);
    translate(x*pS*2, y*pS*2);
    image(sp.get(1), x, y, width, height);
    popMatrix();
  }
}