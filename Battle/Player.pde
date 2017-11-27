class Player {
	boolean inMap=true;
	//stats
	Table stats,habilities,inventory,config;
	TableRow rowStats,rowInventory,rowConfig,rowHabilities;
	//sprites
	PImage sprite = new PImage();
	ArrayList<PImage> sp = new ArrayList<PImage>();
	ArrayList<PImage> spBattle=new ArrayList<PImage>();
	int spriteCount = 0;
	int x,y,z,pS=100;   /*Position, pS = player spriteSize*/
	
	Player(String saveSlot){
		config=loadTable("Saves/"+saveSlot+"/Player/playerConfig.csv", "header");
		stats= loadTable("Saves/"+saveSlot+"/Player/playerStats.csv", "header");
		inventory= loadTable("Saves/"+saveSlot+"/Player/playerInventory.csv", "header");
		habilities= loadTable("Saves/"+saveSlot+"/Player/playerHabilities.csv","header");
		rowStats=stats.getRow(0);
		rowInventory=inventory.getRow(0);
		rowConfig=config.getRow(0);
		rowHabilities=habilities.getRow(0);
		this.init();
	}
	
	void init(){
		sprite = loadImage("Sprites/MainCharacter/battleSprite.png");
		spBattle.clear();
		for (int i = 0; i<594; i+=66) {
			for (int j = 0; j<700; j+=100) {
				spBattle.add(sprite.get(j, i, 100, 66));
			}
		}
	}
	void paintInBattle(){
		pushMatrix();
		imageMode(CORNER);
		image(spBattle.get(0),0,height/7,width*1.3/4,height*1.5/3);
		popMatrix();
	}
	int atk(String atk){
		TableRow hab= habilities.findRow(atk,"name");
		TableRow weap= weapons.findRow(rowInventory.getString("weapon"),"name");
		if(hab.getString("type")=="physical")
			return int(rowStats.getInt("phyAtk")*random(10)/10*rowStats.getInt("lvl"))+hab.getInt("baseAtk")+weap.getInt("baseAtk");
		else
			return int(rowStats.getInt("magAtk")*random(10)/10*rowStats.getInt("lvl"))+hab.getInt("baseAtk")+weap.getInt("baseAtk");
	}
}