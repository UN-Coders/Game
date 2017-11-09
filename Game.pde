Terrain mapT; 															/*Declaration of the Terrain object*/
Player mapP; 															/*Declaration of the Player object*/
Camera mapC; 															/*Declaration of the Map object*/
Text text; 																/*Declaration of the Text object*/
void setup() {
  	frameRate(60); 														/*Set max fps*/
  	mapT = new Terrain(); 												/*Initialization of the Terrain object*/
  	mapP = new Player(); 												/*Initialization of the Player object*/
  	mapC = new Camera(); 												/*Initialization of the Map object*/
  	text = new Text(); 													/*Initialization of the Text object*/
  	fullScreen(P3D); 													/* **Bug** if active produce lag, have to fix*/
} 
void draw() {
	background(0); 														/*Set a black background*/
	pushMatrix(); 														/*Paint terrain, player and camera*/
	mapC.paint(); 
	mapT.paint(); 
	mapP.paint(); 
	popMatrix(); 
	text.paint(); 														/*Paint debug Screen*/
	  																	/*Camera and player Movement*/
 	mapP.move(); 
	mapC.move(); 
	delay(40);															/*Speed of repainting*/
}
																		/*Player Movement Directions*/
void keyPressed() {
  	mapP.setDirection(keyCode, 1); 
  	if (key == '1' || key == '2' || key == '3' || key == '4')mapP.init(key);
} 
void keyReleased() {
  	mapP.setDirection(keyCode, 0);
}