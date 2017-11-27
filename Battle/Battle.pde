Player player;
Mob mob;
Battles battle;

Table phyHab,magHab;

void setup() {
	phyHab=loadTable("World/Habilities/phyHabilitiesList.csv","header");
	magHab=loadTable("World/Habilities/magHabilitiesList.csv","header");
	mob = int(random(1))==0 ? new Mob("pshysical","1") : new Mob("Magical","1");
	player=new Player("1");
	battle=new Battles(0,"1");
	size(1200,800);
	//fullScreen();
}
void draw() {
	battle.paintBattle();
}