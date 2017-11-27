abstract class Mob {
	//stats
	Table pStats;
	TableRow row;
	HashMap<String,Integer> stats= new HashMap<String,Integer>();
	ArrayList<String> habilities= new ArrayList<String>();
	String type;
	//sprites
	PImage sprite = new PImage();
	ArrayList<PImage> sp = new ArrayList<PImage>();

	
	Mob(String type, String saveSlot){
		this.type=type;
		pStats=loadTable("Saves/"+saveSlot+"/Player/playerStats.csv", "header");
		row=pStats.getRow(0);
		for(int i=0; i<4; i++){
			if(type=="physical")
				habilities.add(phyHab.getString(int(random(phyHab.getRowCount())),"name"));
			else 
				habilities.add(magHab.getString(int(random(magHab.getRowCount())),"name")); 
		}
		stats.put("atk",50);
		if(type=="magical"){
			stats.put("phyDef",30);
			stats.put("magDef",70);
		}
		else{
			stats.put("phyDef",70);
			stats.put("magDef",30);
		}
		if(row.getInt("lvl")<5)
			stats.put("lvl",int(random(1,row.getInt("lvl")+5)));
		else
			stats.put("lvl",int(random(row.getInt("lvl")-5,row.getInt("lvl")+5)));
		stats.put("life",100*stats.get("lvl"));
	}	

	abstract int selecAtk();

	void atkAnimation(int nAtk, float x, float y){
		pushMatrix();
		imageMode(CORNER);
		if(type=="physical"){
			TableRow ani = phyHab.findRow(habilities.get(nAtk),"name");
			if(ani.getInt("animation")==1){
				for(int i=14; i<19; i++){
					image(sp.get(i),x,y,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else {
				for(int i=20; i<26; i++){
					image(sp.get(i),x,y,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
		}
		else {
			TableRow ani = magHab.findRow(habilities.get(nAtk),"name");
			if(ani.getInt("animation")==1){
				for(int i=28; i<33; i++){
					image(sp.get(i),x,y,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else if(ani.getInt("animation")==2){
				for(int i=35; i<40; i++){
					image(sp.get(i),x,y,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else {
				for(int i=42; i<47; i++){
					image(sp.get(i),x,y,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
		}
		popMatrix();
	}
	void effectAnimation(String effect, float x, float y){
		pushMatrix();
		imageMode(CORNER);
		switch (effect) {
			case "hitted":
			for(int i=7; i<11; i++){
				image(sp.get(i), x, y,width*1.3/4,height*1.5/3);
			}
			break;
			case "redMagic" :
			image(sp.get(4), x, y, width*1.3/4,height*1.5/3);
			break;
			case "purpMagic" :
			image(sp.get(5), x, y, width*1.3/4,height*1.5/3);
			break;
			case "yellMagic" :
			image(sp.get(6), x, y, width*1.3/4,height*1.5/3);
			break;
			case "lPos" :
			image(sp.get(2), x, y, width*1.3/4,height*1.5/3);
			break;
			case "mPos" :
			image(sp.get(3), x, y, width*1.3/4,height*1.5/3);
			break;
			case "sPos" :
			image(sp.get(1), x, y, width*1.3/4,height*1.5/3);
			break;
			default :
			image(sp.get(0), x, y, width*1.3/4,height*1.5/3);
			break;	
		}
		popMatrix();
	}

	void paintInBattle(float x,float y){
		pushMatrix();
		imageMode(CORNER);
		image(sp.get(0),x,y,width*1.3/4,height*1.5/3);//x=0,y=height/7
		popMatrix();
	}

	int atk(int nAtk){
		if(type=="physical"){
			TableRow hab = phyHab.findRow(habilities.get(nAtk),"name");
			return int((stats.get("atk")*random(10)/10*stats.get("lvl"))+hab.getInt("baseAtk"));
		}
		else{
			TableRow hab = magHab.findRow(habilities.get(nAtk),"name");
			return int((stats.get("atk")*random(10)/10*stats.get("lvl"))+hab.getInt("baseAtk"));
		}
	}
	int def(String atkType){
		if(atkType == "physical")
			return int(stats.get("phyDef")/random(1,10)*stats.get("lvl"));
		else
			return int(stats.get("magDef")/random(1,10)*stats.get("lvl"));
	}
}
