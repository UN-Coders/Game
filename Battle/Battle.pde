Player player;
//Mob mob;
Battles battle;
PFont font = new PFont();
Intro intro;
String mode = "Intro";
Table phyHab,magHab,potions,weapons,armor;
PImage back;
void setup() {
	font = loadFont("font/ARESSENCE-48.vlw");							/*Set font*/
	textFont(font, 48);
	phyHab=loadTable("World/Habilities/phyHabilitiesList.csv","header");
	magHab=loadTable("World/Habilities/magHabilitiesList.csv","header");
	potions=loadTable("World/Items/potions.csv","header");
	weapons=loadTable("World/Items/weapons.csv","header");
	armor=loadTable("World/Items/armor.csv","header");
	//mob = int(random(1))==0 ? new Mob("pshysical","1") : new Mob("Magical","1");
	player=new Player("1");
	battle=new Battles(0,"1");
	intro = new Intro();
	back = loadImage("World/Art/battleBackground(4).png");
	back.resize(width,height);
	size(1200,800);
	//fullScreen();
}
String cAnimation = " ";
void draw() {
	background(back);
	switch (mode) {
		case "Intro" :
		intro.paint();
		break;
		case "Battle" :
		battle.turn();
		battle.paintBattle();
		break;	
	}
	if(battle.buttons.get(6).clicked())
		cAnimation = "Stab";
	if(battle.buttons.get(7).clicked())
		cAnimation = "Barrier";
	if(battle.buttons.get(8).clicked())
		cAnimation = "Charge";
	if(battle.buttons.get(9).clicked())
		cAnimation = "FireBall";

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
}
String typing = "New Player";
void keyPressed() {
	if (key == BACKSPACE) {
		typing = "";
	} else if (key == '\n'){
	} else {
		typing = typing + key;
	}
}