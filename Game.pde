Terrain mapT;															/*Declaration of the Terrain object*/
Player mapP;															/*Declaration of the Player object*/
Camera mapC;															/*Declaration of the Map object*/
Debug text;																/*Declaration of the Debug object*/
Menu menu;																/*Declaration of the Menu object*/
TerrainDungeon[] mapTD = new TerrainDungeon[9];							/*Declaration of the TerrainDungeon object*/
int numDungeon;
Dialogue talk;
String dialogue;
PFont font = new PFont();												/*Text font*/
char mode = 'i';														/*Game status mode*/
BattlePlayer player;
Battles battle;
Intro intro;
Table phyHab,magHab,potions,weapons,armor;
PImage back;
Button mapButton;
File file;
String[] filenames;
void setup() {
	frameRate(60);														/*Set max fps*/
	// fullScreen(P3D);
	size(1200, 800, P3D);
	menu = new Menu();													/*Initialization of the Menu object*/
	font = loadFont("font/ARESSENCE-48.vlw");							/*Set font*/
	textFont(font, 48);
	talk = new Dialogue();
	dialogue = ".";
	mapButton = new Button("Map",0.90,0.90,1,1,color(100,100,100),color(100,0,0));
	file = new File(sketchPath()+"/data/Save/Dungeon/");
	filenames = file.list();
	noStroke();
	// fullScreen(P3D);
	phyHab=loadTable("World/Habilities/phyHabilitiesList.csv","header");
	magHab=loadTable("World/Habilities/magHabilitiesList.csv","header");
	potions=loadTable("World/Items/potions.csv","header");
	weapons=loadTable("World/Items/weapons.csv","header");
	armor=loadTable("World/Items/armor.csv","header");
	player=new BattlePlayer("1");
	battle=new Battles(0,"1");
	intro = new Intro();
	back = loadImage("World/Art/battleBackground(4).png");
	back.resize(width,height);
	size(1200, 800, P3D);
	surface.setResizable(true);											/*Let change window size*/
}
String cAnimation = " ";
void draw() {
	background(0);														/*Set a black background*/
	try {
		switch (mode) {
			case 'g' :
			game();														/*Game main map mode*/
			break;
			case 't' :
			dungeon();													/*Game dungeon mode*/
			break;
			case 'm':
			mapT.paintMinimap();										/*Minimap Visualization*/
			talk.paint(dialogue);
			if(mapButton.clicked())
				mode = 'g';
			mapButton.paint();
			break;
			case 'i':
			menu.paint();												/*Game Menu*/
			break;
			case 'c':
			credits();													/*Credit **Need Design Enhacement***/
			break;
			case 'p' :
			intro.paint();	
			break;		
			case 'b' :
			battle.turn();
			battle.paintBattle();
			break;	
		}	
		switch (cAnimation) {
			case "Stab" :
			case "Barrier" :
			case "Guard" :
			case "Charge" :
			case "Slice" :
			case "Healing" :
			case "FireBall" :
			case "Mesmerize" :
			player.atkAnimations(cAnimation);
			break;
		}
	} catch (Exception e) {
		println("General exeption: "+e);
	}
}
void newGame(){
	mapT = new Terrain();												/*Initialization of the Terrain object*/
	mapP = new Player();												/*Initialization of the Player object*/
	mapC = new Camera();												/*Initialization of the Map object*/
	text = new Debug();													/*Initialization of the Text object*/
	String[] dungeonF = {"some","text"};								/*For the creation of Dungeon folder **Important***/
	saveStrings("data/Save/Dungeon/dungeon.txt",dungeonF);
}
float speedPlayer = 2, timer = 0;
void game(){
	/**/																/*Paint terrain, player and camera*/
	talk.paint(dialogue);
	mapC.eye = 1500;
	mapP.x = mapT.pX;
	mapP.z = mapT.pY;
	if(mapButton.clicked())
		mode = 'm';
	mapButton.paint();
	pushMatrix();
	mapC.paint();
	mapT.paint();
	mapP.paint();
	popMatrix();
	text.paint();
	/**/																/*Camera and player Movement*/
	if(timer > 4){
		mapP.move(mapT);
		mapC.move(mapT);
		timer = 0;
	}
	timer += speedPlayer;
}
void dungeon(){															/*Paint dungeonTerrain*/
	background(81, 51, 81);
	talk.paint(dialogue);
	mapC.eye = 1000;
	mapP.x = mapTD[numDungeon].pX;
	mapP.z = mapTD[numDungeon].pY;
	pushMatrix();
	mapC.paint();
	mapTD[numDungeon].paint();
	mapP.paint();
	popMatrix();
	text.paint();
	if(timer > 6){
		mapP.move(mapTD[numDungeon]);
		mapC.move(mapTD[numDungeon]);
		timer = 0;
	}
	timer += speedPlayer;
}
void credits(){
	fill(255,250,0);
	text("Coders", width*0.5, height*0.15);
	fill(255);
	text("Sebastian Garnica", width*0.5, height*0.30);
	text("Esteban Avila", width*0.5, height*0.45);
	text("Harrison Pinto", width*0.5, height*0.60);
	fill(255,250,0);
	text("Designer", width*0.5, height*0.75);
	fill(255);
	text("Nicolas Arias", width*0.5, height*0.90);
}
boolean chance(float percentage) {										/*Chance boolean*/
	return random(0, 100)<percentage;
}
/**/																	/*Player Movement Directions*/
String typing = "New Player";
void keyPressed() {
	try {
		mapP.setDirection(keyCode, 1);
	} catch (Exception e) {
		println("exeption Player Movement: "+e);
	}
	try {
		switch (key) {
			case '1':
			case '2':
			case '3':
			case '4':
			mapP.init(key);
			break;
			case 'm':
			case 'g':
			case 't':
			case 'i':
			case 'c':
			case 'b':
			case 'p':
			mode = key;
			break;	
		}
		if (key == BACKSPACE) {
			typing = "";
		} else if (key == '\n'){
		} else {
			typing = typing + key;
		}
	} catch (Exception e) {
		println("exeption Mode: "+e);
	}
}
void keyReleased() {
	try {
		mapP.setDirection(keyCode, 0);
	} catch (Exception e) {
		println("exeption Player Movement: "+e);
	}
}
float skip = 1;
void mouseDragged(){
	skip = 5;
}
void mouseReleased() {
	skip = 1;
}