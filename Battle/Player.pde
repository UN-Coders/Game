class Player {
	boolean inMap=true;
	//stats
	Table stats,habilities,inventory,config;
	TableRow rowStats,rowInventory,rowConfig,rowHabilities;
	int totalDef;
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
	int animationSpeed = 200, animationCount = 0;
	void atkAnimations(String atk){
		TableRow ani= habilities.findRow(atk,"name");
		pushMatrix();
		imageMode(CORNER);
		delay(animationSpeed);
		switch (ani.getInt("animation")) {
			case 1 :
			image(spBattle.get((int)animationCount+14), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+14 >= 19){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 2 :
			image(spBattle.get((int)animationCount+21), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+21 == 26){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 3 :
			image(spBattle.get((int)animationCount+28), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+28 >= 34){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 4 :
			image(spBattle.get((int)animationCount+35),0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+35 >= 41){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 5 :
			image(spBattle.get((int)animationCount+42), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+42 >= 48){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 6 :
			image(spBattle.get((int)animationCount+49), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+49 >= 54){
				animationCount = 0;
				cAnimation = " ";
			}
			break;
			case 7 :
			image(spBattle.get((int)animationCount+56), 0,height/7,width*1.3/4,height*1.5/3);	
			animationCount++;
			if(animationCount+56 >= 61){
				animationCount = 0;
				cAnimation = " ";
			}
			break;	
		}
		popMatrix();
	}

	void effectAnimations(String effect){
		imageMode(CORNER);
		pushMatrix();
		switch (effect) {
			case "hitted" :
			for (int i = 7; i < 11; ++i) {
				image(spBattle.get(0),0,height/7,width*1.3/4,height*1.5/3);
				delay(200);
			}
			break;	
			case "redMagic" :
			for(int i=0; i<10; i++){
				image(spBattle.get(4),0,height/7,width*1.3/4,height*1.5/3);
				delay(100);
				image(spBattle.get(4),0,(height/7)+height/120,width*1.3/4,(height*1.5/3)+height/120);
				delay(100);
			}
			break;	
			case "purpMagic" :
			for(int i=0; i<10; i++){
				image(spBattle.get(5),0,height/7,width*1.3/4,height*1.5/3);
				delay(100);
				image(spBattle.get(5),0,(height/7)+height/120,width*1.3/4,(height*1.5/3)+height/120);
				delay(100);
			}
			break;
			case "yellMagic" :
			for(int i=0; i<10; i++){
				image(spBattle.get(6),0,height/7,width*1.3/4,height*1.5/3);
				delay(100);
				image(spBattle.get(6),0,(height/7)+height/120,width*1.3/4,(height*1.5/3)+height/120);
				delay(100);
			}
			break;	
			case "lPos" :
			image(spBattle.get(2),0,height/7,width*1.3/4,height*1.5/3);
			delay(350);
			break;
			case "mPos" :
			image(spBattle.get(3),0,height/7,width*1.3/4,height*1.5/3);
			delay(350);
			break;		
			case "sPos" :
			image(spBattle.get(1),0,height/7,width*1.3/4,height*1.5/3);
			delay(350);
			break;
			default :
			image(spBattle.get(0),0,height/7,width*1.3/4,height*1.5/3);
			break;	
		}
		popMatrix();
	}

	int atk(String atk){
		totalDef=0;
		TableRow hab= habilities.findRow(atk,"name");
		TableRow weap= weapons.findRow(rowInventory.getString("weapon"),"name");
		totalDef=hab.getInt("baseDef");
		if(hab.getString("type")=="physical")
			return int(rowStats.getInt("phyAtk")*random(10)/10*rowStats.getInt("lvl"))+hab.getInt("baseAtk")+weap.getInt("baseAtk");
		else
			return int(rowStats.getInt("magAtk")*random(10)/10*rowStats.getInt("lvl"))+hab.getInt("baseAtk")+weap.getInt("baseAtk");
	}
	int def(String atkType){
		TableRow arm= armor.findRow(rowInventory.getString("armor"),"name");
		if(atkType=="physical")
			return int(rowStats.getInt("phyDef")/random(1, 10)*rowStats.getInt("lvl"))+arm.getInt("baseDef")+totalDef;
		else
			return int(rowStats.getInt("magDef")/random(1, 10)*rowStats.getInt("lvl"))+arm.getInt("baseDef")+totalDef;
	}
	void checkLvl(){
		int lvl=rowStats.getInt("lvl");
		if(rowStats.getInt("exp")>=pow(2,lvl)*1000)
			rowStats.setInt("lvl",lvl++);
		saveTable(stats,"Saves/1/Player/playerConfig.csv");
	}
}