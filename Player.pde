int north, south, west, east;											/*Direcciones del jugador*/

class Player {
	int x, y, z, pS;													/*Position, pS = player spriteSize*/
	float spriteCount = 0, spriteSpeed = 0.2;							/*Sprite frame visualization control value*/
	PImage sprite = new PImage();										/*Sprite complete Image*/
	ArrayList<PImage> sp = new ArrayList<PImage>();						/*Sprite div of `PImage sprite` in an arrayList*/
	/**/																/*Initialization of the object, arg "k" = (key of keyListener)*/
	void init(int k) {
		sprite = loadImage("Sprites/Sprite "+(k-(int)'0')+".png");
		sp.clear();
		while (mapT.map.getFloat((x+mapT.mapSize/2)+"-"+(z+mapT.mapSize/2)) != 0) {
			x = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
			z = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
		}
		mapT.pX = this.x;
		mapT.pY = this.z;
		for (int j = 512; j<767; j+=64) {								/*Sprite movement section*/
			for (int i = 0; i<575; i+=64)
				sp.add(sprite.get(i, j, 64, 64));
		}
	}
	void paint() {
		spriteCount = spriteCount>=8? 0: spriteCount+spriteSpeed;

		pushMatrix();
		imageMode(CENTER);
		rotateX(PI/2);
		translate(x*pS, z*pS, 1);
		if      (south - north == -1) 
			image(sp.get( 0+(int)spriteCount), 0, 0, pS, pS);
		else if (east  - west  == -1) 
			image(sp.get( 9+(int)spriteCount), 0, 0, pS, pS);
		else if (east  - west  ==  1) 
			image(sp.get(27+(int)spriteCount), 0, 0, pS, pS);
		else if (south - north ==  1) 
			image(sp.get(18+(int)spriteCount), 0, 0, pS, pS);
		else
			image(sp.get(18), 0, 0, pS, pS);
		popMatrix();
	}

	/*<--Start Test-->*/
	void move(Terrain m) {
		int tx = x, tz = z;												/*Temporal values of position*/
		tx += x<m.mapSize/2 && x>-m.mapSize/2?east  - west:0;
		tz += z<m.mapSize/2 && z>-m.mapSize/2?south - north:0;
		/**/															/*Rewrite position values just if is permitted*/
		if (m.map.getFloat((tx+m.mapSize/2)+"-"+(tz+m.mapSize/2))!=1) {
			m.pX = x = tx;
			m.pY = z = tz;
		}
		for (int i = 0; i < 9; i++) {
			if (m.map.getFloat((tx+m.mapSize/2)+"-"+(tz+m.mapSize/2))==10*(i+1)) {
				dialogue = "Dungeon"+(i+1);
				mapTD[i+1] = new TerrainDungeon(""+(i+1));
				filenames = file.list();
				if(filenames.length > 1){
					mode = 't';
					m.pY += 1;													/*<needs to improve>*/
					numDungeon = i+1;
				}
			}
		}
	}
	void move(TerrainDungeon m) {
		int tx = x, tz = z;												/*Temporal values of position*/
		tx += x<m.mapSize/2 && x>-m.mapSize/2?east  - west:0;
		tz += z<m.mapSize/2 && z>-m.mapSize/2?south - north:0;
		/**/															/*Rewrite position values just if is permitted*/
		if (!m.map.isNull((tx+m.mapSize/2)+"-"+(tz+m.mapSize/2))) {
			if(chance(1))
				dialogue = "Battle";
			m.pX = x = tx; 
			m.pY = z = tz;
		}
	}
	/*<--End Test-->*/

	/**/																/*k = keyListener, spd if 1 "true" direction: stop*/
	void setDirection(int k, int spd) {									
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
		this.x = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
		this.y = 0;
		this.z = (int)random(15-mapT.mapSize/2, mapT.mapSize/2-15);
		this.pS = mapT.mapSquareSize;
		init((int)'1');													/*Player Initialization, arg = key*/
	}
}