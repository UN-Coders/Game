Terrain mapT;															/*Declaration of the Terrain object*/
Player mapP;															/*Declaration of the Player object*/
Camera mapC;															/*Declaration of the Map object*/
Text text;																/*Declaration of the Text object*/
ArrayList<TerrainDungeon> mapTD = new ArrayList<TerrainDungeon>();		/*Declaration of the TerrainDungeon object*/
char mode = 'g';
void setup() {
	frameRate(60);														/*Set max fps*/
	mapT = new Terrain();												/*Initialization of the Terrain object*/
	for (int i = 0; i < 9; i++) {
		mapTD.add(new TerrainDungeon(""+i));							/*Initialization of the Terrain Dungeon object*/
	}
	mapP = new Player();												/*Initialization of the Player object*/
	mapC = new Camera();												/*Initialization of the Map object*/
	text = new Text();													/*Initialization of the Text object*/
	//fullScreen(P3D);
	size(1000, 1000, P3D);
}
void draw() {
	background(0);														/*Set a black background*/
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
	}
	text.paint();														/*Paint debug Screen*/
}

void game(){
	pushMatrix();														/*Paint terrain, player and camera*/
	mapC.paint();
	mapT.paint();
	mapP.paint();
	popMatrix();
	/**/																/*Camera and player Movement*/
	mapP.move(mapT);
	mapC.move(mapT);
	//delay(40);														/*Speed of repainting  **Produce low fps** */
}
void dungeon(){															/*Paint dungeonTerrain*/
	pushMatrix();
	//translate(width/2, height/2);
	mapC.paint();
	mapTD.get(0).paint();
	mapP.paint();
	popMatrix();
	mapP.move(mapTD.get(0));
	mapC.move(mapTD.get(0));
}
boolean chance(float percentage) {										/*Chance boolean*/
		return random(0, 100)<percentage;
	}
/**/																	/*Player Movement Directions*/
void keyPressed() {
	mapP.setDirection(keyCode, 1); 
	if (key == '1' || key == '2' || key == '3' || key == '4')
		mapP.init(key);
	if (key == 'm'|| key == 'g' || key == 't')
		mode = key;
}
void keyReleased() {
	mapP.setDirection(keyCode, 0);
}