Player player;
Mob mob;
Battles battle;
PFont font = new PFont();

Table phyHab,magHab,potions,weapons;

void setup() {
	font = loadFont("font/ARESSENCE-48.vlw");							/*Set font*/
	textFont(font, 48);
	phyHab=loadTable("World/Habilities/phyHabilitiesList.csv","header");
	magHab=loadTable("World/Habilities/magHabilitiesList.csv","header");
	potions=loadTable("World/Items/potions.csv","header");
	weapons=loadTable("World/Items/weapons.csv","header");
	mob = int(random(1))==0 ? new Mob("pshysical","1") : new Mob("Magical","1");
	player=new Player("1");
	battle=new Battles(0,"1");
	size(1200,800);
	//fullScreen();
}
void draw() {
	battle.paintBattle();
}