Player player;
Button button;

PImage battleBackground = new PImage();

void setup() {
	player=new Player("1");
	button= new Button("ARESSENCE-48.vlw");
	battleBackground=loadImage("world/battleBackground(1).png");
	size(1200,800);
	//fullScreen();
}
void draw() {
	battle();
}
void battle(){
	pushMatrix();
	image(battleBackground, 0, 0, width, height);
	noStroke();
	fill(183, 175, 175, 100);
	rectMode(CORNERS);
	rect(width/50, height*2/3, width*4/15, height*29/30, 10);//for stats
	rect(width*4.1/15, height*2/3, width*7.7/15, height*29/30, 10);//for actions
	rect(width*7.8/15, height*2/3, width*49/50, height*29/30, 10);//for habilities
	fill(240,248,19);
	textAlign(CENTER);
	button.paint("<NAME>",width*1.2/50, (height*2/3)+width/150, (width*4/15)-width/150, height*89/120);
	textAlign(LEFT);
	button.paint("<LIFE>",width*1.2/50, height*89/120+width/150, (width*4/15)-width/150, height*98/120);
	button.paint("<MANA>",width*1.2/50, height*98/120+width/150, (width*4/15)-width/150, height*107/120);
	button.paint("<STAMINA>",width*1.2/50, height*107/120+width/150, (width*4/15)-width/150, height*116/120);
	popMatrix();
  player.paintCharacter();
}