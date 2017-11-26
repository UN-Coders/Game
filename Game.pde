Terrain mapT;															/*Declaration of the Terrain object*/
Player mapP;															/*Declaration of the Player object*/
Camera mapC;															/*Declaration of the Map object*/
Text text;																/*Declaration of the Text object*/
Menu menu;																/*Declaration of the Menu object*/
ArrayList<TerrainDungeon> mapTD = new ArrayList<TerrainDungeon>();		/*Declaration of the TerrainDungeon object*/
PFont font = new PFont();												/*Text font*/
char mode = 'i';														/*Game status mode*/

int w;
void setup() {
	frameRate(60);														/*Set max fps*/
	menu = new Menu();													/*Initialization of the Menu object*/
	font = loadFont("font/ARESSENCE-48.vlw");							/*Set font*/
	textFont(font, 48);
	noStroke();
	// fullScreen(P3D);
	size(1200, 800, P3D);
	surface.setResizable(true);
	w = width;
}
void draw() {
	background(0);														/*Set a black background*/
	try {
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
			dungeon();													/*Game dungeon mode **test state*/
			break;
			case 'm':
			mapT.paintMinimap();
			break;
			case 'i':
			menu.paint();
			break;
		}	
	} catch (Exception e) {
		println("exeption: "+e);
	}
}
void newGame(){
	mapT = new Terrain();												/*Initialization of the Terrain object*/
	// for (int i = 0; i < 9; i++) {
	// 	mapTD.add(new TerrainDungeon(""+i));							/*Initialization of the Terrain Dungeon object*/
	// }
	mapP = new Player();												/*Initialization of the Player object*/
	mapC = new Camera();												/*Initialization of the Map object*/
	text = new Text();													/*Initialization of the Text object*/
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

	text.paint();
}
boolean chance(float percentage) {										/*Chance boolean*/
	return random(0, 100)<percentage;
}
/**/																	/*Player Movement Directions*/
void keyPressed() {
	try {
		mapP.setDirection(keyCode, 1);
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
			mode = key;
			break;	
		}
	} catch (Exception e) {
		println("exeption: "+e);
	}
}
void keyReleased() {
	try {
		mapP.setDirection(keyCode, 0);
	} catch (Exception e) {
		println("exeption: "+e);
	}
}