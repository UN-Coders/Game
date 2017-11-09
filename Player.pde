int north, south, west, east; 											/*Direcciones del jugador*/

class Player {
	int x, y, z, pS;													/*Position, pS = player spriteSize*/
	int spriteCount = 0;												/*Sprite frame visualization control value*/
	PImage sprite = new PImage();										/*Sprite complete Image*/
	ArrayList<PImage> sp = new ArrayList<PImage>();						/*Sprite div of `PImage sprite` in an arrayList*/
	void init(int k) {													/*Initialization of the object, arg "k" = (key of keyListener)*/
		sprite = loadImage("Sprites/Sprite "+(k-(int)'0')+".png");
		sp.clear();
		for (int j = 512; j<767; j+=64) 								/*Sprite movement section*/
			for (int i = 0; i<575; i+=64)
				sp.add(sprite.get(i, j, 64, 64));

		while (mapT.hMap.get("X"+(x+mapT.mapSize/2)+"Y"+(z+mapT.mapSize/2))==1) {
			x = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
			z = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
		}
	}
	void paint() {
		spriteCount++;
		if (spriteCount == 8)spriteCount=0;
		pushMatrix();
		imageMode(CENTER);
		rotateX(PI/2);
		translate(x*pS, z*pS);
		if      (south - north == -1) 
			image(sp.get( 0+spriteCount), 0, 0, pS, pS);
		else if (east  - west  == -1) 
			image(sp.get( 9+spriteCount), 0, 0, pS, pS);
		else if (east  - west  ==  1) 
			image(sp.get(27+spriteCount), 0, 0, pS, pS);
		else if (south - north ==  1) 
			image(sp.get(18+spriteCount), 0, 0, pS, pS);
		else 
			image(sp.get(18), 0, 0, pS, pS);
		popMatrix();
	}
	void move() {
		int tx = x, tz = z;												/*Temporal values of position*/
		tx += x<mapT.mapSize/2 && x>-mapT.mapSize/2?east  - west:0;
		tz += z<mapT.mapSize/2 && z>-mapT.mapSize/2?south - north:0;
		mapC.fov = keyCode == DOWN? 2000: keyCode == UP? 1000: mapC.fov;
																		/*Rewrite position values just if is permitted*/
		if (mapT.hMap.get("X"+(tx+mapT.mapSize/2)+"Y"+(tz+mapT.mapSize/2))==0) {
			x = tx; 
			z = tz;
		}
	}
	void setDirection(int k, int spd) {									/*k = keyListener, spd if 1 "true" direction: stop*/
		if      (k == 'W')  
			north = spd;
		else if (k == 'S')  
			south = spd;
		else if (k == 'A')  
			west  = spd;
		else if (k == 'D')  
			east  = spd;
	}
	Player() {
		this.x = (int)random(-mapT.mapSize/2, mapT.mapSize/2);
		this.y = 0;
		this.z = (int)random(-mapT.mapSize/2, mapT.mapSize/2);
		this.pS = 100;
		init((int)'1');													/*Player Initialization, arg = key*/
	}
}