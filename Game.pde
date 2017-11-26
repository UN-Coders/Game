Terrain mapT;															/*Declaration of the Terrain object*/
Player mapP;															/*Declaration of the Player object*/
Camera mapC;															/*Declaration of the Map object*/
Debug text;																/*Declaration of the Debug object*/
Menu menu;																/*Declaration of the Menu object*/
ArrayList<TerrainDungeon> mapTD = new ArrayList<TerrainDungeon>();		/*Declaration of the TerrainDungeon object*/
Dialogue talk;
String dialogue;
PFont font = new PFont();												/*Text font*/
char mode = 'i';														/*Game status mode*/

void setup() {
	frameRate(60);														/*Set max fps*/
	menu = new Menu();													/*Initialization of the Menu object*/
	font = loadFont("font/ARESSENCE-48.vlw");							/*Set font*/
	textFont(font, 48);
	talk = new Dialogue();
	dialogue = ".";
	noStroke();
	// fullScreen(P3D);
	size(1200, 800, P3D);
	surface.setResizable(true);											/*Let change window size*/
}
void draw() {
	background(0);														/*Set a black background*/
	try {
		talk.paint(dialogue);
		switch (mode) {
			case 'g' :
			mapC.eye = 2000;
			mapP.x = mapT.pX;
			mapP.z = mapT.pY;
			game();														/*Game main map mode*/
			break;
			case 't' :
			mapC.eye = 1000;
			mapP.x = mapTD.get(0).pX;
			mapP.z = mapTD.get(0).pY;
			dungeon();													/*Game dungeon mode*/
			break;
			case 'm':
			mapT.paintMinimap();										/*Minimap Visualization*/
			break;
			case 'i':
			menu.paint();												/*Game Menu*/
			break;
			case 'c':
			credits();													/*Credit **Need Design Enhacement***/
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
void game(){
	/**/																/*Paint terrain, player and camera*/
	pushMatrix();
	mapC.paint();
	mapT.paint();
	mapP.paint();
	popMatrix();
	text.paint();
	/**/																/*Camera and player Movement*/
	mapP.move(mapT);
	mapC.move(mapT);
}
void dungeon(){															/*Paint dungeonTerrain*/
	pushMatrix();
	mapC.paint();
	mapTD.get(0).paint();
	mapP.paint();
	popMatrix();
	text.paint();

	mapP.move(mapTD.get(0));
	mapC.move(mapTD.get(0));
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
			mode = key;
			break;	
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