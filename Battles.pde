class Battles {
	Table pStats;
	TableRow row;
	boolean playerTurn = true;
	//interface
	PImage battleBackground = new PImage();
	ArrayList<Button> buttons = new ArrayList<Button>();
	//mobs in battle
	int nEnemies = int(random(1,3));
	ArrayList<Enemy> enemies= new ArrayList<Enemy>();


	Battles(int nAllies, String saveSlot){
		battleBackground=loadImage("World/Art/battleBackground(3).png");
		pStats=loadTable("Saves/"+saveSlot+"/Player/playerStats.csv", "header");
		row=pStats.getRow(0);
		for(int i=0; i<nEnemies; i++) if(int(random(1)) == 0) enemies.add(new Enemy("physical","1")); else enemies.add(new Enemy("Magical","1"));
		this.init();
	}
	void init(){
		for(int i=0; i<nEnemies; i++) enemies.get(i).init();
		/*init buttons for stats*/
		buttons.add(new Button("LIFE: "+row.getString("life"),0.017,0.67,0.27,0.77,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("MANA: "+row.getString("mana"),0.017,0.77,0.27,0.87,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("SP: "+row.getString("stamina"),0.017,0.87,0.27,0.97,color(0,0,0,1),color(160,150,0,255)));
		/*init buttons for actions*/
		buttons.add(new Button("PHYSIC",0.27,0.67,0.517,0.77,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("MAGIC",0.27,0.77,0.517,0.87,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("INVENTORY",0.27,0.87,0.517,0.97,color(0,0,0,1),color(160,150,0,255)));
		/*init buttons for habilities*/
		buttons.add(new Button("<ACTION 1>",0.517,0.72,0.751,0.82,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("<ACTION 2>",0.517,0.82,0.751,0.92,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("<ACTION 3>",0.751,0.72,0.985,0.82,color(0,0,0,1),color(160,150,0,255)));
		buttons.add(new Button("<ACTION 4>",0.751,0.82,0.985,0.92,color(0,0,0,1),color(160,150,0,255)));
	}
	void paintBattle(){
		pushMatrix();
		imageMode(CORNERS);
		image(battleBackground, 0, 0, width, height);
		noStroke();
		fill(183, 175, 175, 100);
		rectMode(CORNERS);
		rect(width/50, height*2/3, width*4/15, height*29/30, 10);//for stats
		rect(width*4.1/15, height*2/3, width*7.7/15, height*29/30, 10);//for actions
		rect(width*7.8/15, height*2/3, width*49/50, height*29/30, 10);//for habilities
		textAlign(CENTER);
		textSize(100);
		textAlign(CENTER,LEFT);

		text(player.rowConfig.getString("name"),width/40, height/40, width/2.5,height/2);
		for (Button o : buttons) {
			o.paint();
		}
		popMatrix();
		player.effectAnimations(" ");
		enemies.get(0).paintInBattle(width*2/3,height/7);
	}
	void turn(){
		if(buttons.get(3).clicked())
			for(int i=0; i<4; i++) buttons.get(i+6).text=player.habilities.getString(i,0);
		else if(buttons.get(4).clicked())
			for(int i=0; i<4; i++) 	buttons.get(i+6).text=player.habilities.getString(i+4,0);
		else if(buttons.get(5).clicked())
			for(int i=0; i<4; i++) buttons.get(i+6).text=player.rowInventory.getString(i+3);

		String at="Stab",ty="";
		int l=0;
		if(buttons.get(6).text=="Stab") ty="physical";
		else ty="magical";

		if(playerTurn){
			for(int i=0; i<4; i++){
				if(buttons.get(i+6).clicked()){
					cAnimation=buttons.get(i+6).text;
					at=cAnimation;
				}
			}
			for (int i=0; i<nEnemies; i++){
				if(enemies.get(i).selected(0,0)){
					l=enemies.get(i).stats.get("life");
					l-=(player.atk(at)-enemies.get(i).def(ty));
					enemies.get(i).stats.put("life",l);
					player.rowHabilities=player.habilities.findRow(at,"name");
					if(ty=="physical")player.rowStats.setInt("stamina",(player.rowStats.getInt("stamina"))-(player.rowHabilities.getInt("resourcesExpense")));
					else player.rowStats.setInt("mana",player.rowStats.getInt("mana")-player.rowHabilities.getInt("resourcesExpense"));
					saveTable(player.stats,"Saves/1/Player/playerConfig.csv");
					break ;
				}
			}
			playerTurn=false;
		}
		else {
			for(int i=0; i<nEnemies; i++){
				player.rowStats.setInt("life",enemies.get(i).atk(enemies.get(i).selecAtk())-player.def(enemies.get(i).type));
			}
			playerTurn=true;
		}
	}
}