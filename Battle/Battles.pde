class Battles {
	Table pStats;
	TableRow row;
	//interface
	PImage battleBackground = new PImage();
	ArrayList<Button> buttons = new ArrayList<Button>();
	//mobs in battle
	int nEnemies = int(random(3));
	ArrayList<Enemy> enemies= new ArrayList<Enemy>();
	int nAllies;
	ArrayList<Ally> allies= new ArrayList<Ally>();

	Battles(int nAllies, String saveSlot){
		battleBackground=loadImage("World/Art/battleBackground(3).png");
		pStats=loadTable("Saves/"+saveSlot+"/Player/playerStats.csv", "header");
		row=pStats.getRow(0);
		this.init();
	}
	void init(){
		//init buttons for stats
		// buttons.add(new Button("LIFE: "+row.getString("life"),1/50,0.5,4/15,0.7,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("MANA: "+row.getString("mana"),1/50,0.7,4/15,0.9,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("STAMINA: "+row.getString("stamina"),1/50,2/3,4/15,29/30,color(0,0,0,255),color(255,255,0)));
		//init buttons for actions
		// buttons.add(new Button("ATACK",(1.2/50)*2, 89/120+width/150, ((4/15)-width/150)*2, 98/120,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("DEFENSE",(1.2/50)*2, 98/120+width/150, ((4/15)-width/150)*2, 107/120,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("INVENTORY",(1.2/50)*2,107/120+width/150, ((4/15)-width/150)*2, 116/120,color(0,0,0,255),color(255,255,0)));
		// //init buttons for habilities
		// buttons.add(new Button("<ACTION 1>",(1.2/50)*3, 89/120+width/150, ((4/15)-width/150)*3, 98/120,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("<ACTION 2>",(1.2/50)*4, (89/120+width/150)+(98/120)*1.2, ((4/15)-width/150)*4, 116/120,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("<ACTION 3>",(1.2/50)*3, 89/120+width/150, ((4/15)-width/150)*3, 98/120,color(0,0,0,255),color(255,255,0)));
		// buttons.add(new Button("<ACTION 4>",(1.2/50)*4, (89/120+width/150)+(98/120)*1.2, ((4/15)-width/150)*4,  116/120,color(0,0,0,255),color(255,255,0)));
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
		text(player.rowConfig.getString("name"),width*1.2/50, (height*2/3)+width/150, (width*4/15)-width/150, height*89/120);
		for (Button o : buttons) {
			o.paint();
		}
		popMatrix();
		player.paintInBattle();
	}
}