class Terrain {
	int mapSize, mapSquareSize, worldEdge;								/*mapSquareSize is the size of each map rectangle section, worldEdge is the size of the border*/
	PImage[] s = new PImage[8];											/*Array of the Terrain textures*/
	PImage cMap;														/*Image of the complete map*/
	JSONObject map = new JSONObject();									/*Map with key:value setting in .json*/
	int pX, pY;															/*Save player position*/

	void init() {														/*Initialization of the object*/
		cMap = createImage(1000,1000,RGB);								/*map unique image*/
		for (int i = 0; i<8; i++){
			s[i] = loadImage("Terrain/Floor ("+(i+1)+").jpg");				/*Load the terrain textures*/
			s[i].resize(cMap.width/mapSize,cMap.width/mapSize);
		}
		/**/															/*<-- Noise Generator in HashMap and minimap -->*/
		noiseDetail(4, 0.53);
		float increment = 0.1;
		float xoff = 0.0;
		for (int x = 0; x <= mapSize; x++) {							/*Terrain preset*/
			xoff += increment;
			float yoff = 0.0;
			for (int y = 0; y <= mapSize; y++) {
				yoff += increment;
				float perlinValue = noise(xoff, yoff);
				if(perlinValue<0.25) {
					map.setFloat(x+"-"+y,3);
					cMap.set(x*cMap.width/mapSquareSize,y*cMap.width/mapSquareSize,s[6]);
				}else if(perlinValue<0.55) {
					map.setFloat(x+"-"+y,0);
					cMap.set(x*cMap.width/mapSquareSize,y*cMap.width/mapSquareSize,s[4]);
				}else if(perlinValue<0.8) {
					map.setFloat(x+"-"+y,1);
					cMap.set(x*cMap.width/mapSquareSize,y*cMap.width/mapSquareSize,s[3]);
				}else {
					map.setFloat(x+"-"+y,2);
					cMap.set(x*cMap.width/mapSquareSize,y*cMap.width/mapSquareSize,s[2]);
				}
				worldEdge = (int)map(noise(xoff,yoff*2), 0, 1, 5, 15);
				if (x<worldEdge || y<worldEdge || x > mapSize-worldEdge || y > mapSize-worldEdge) {
					map.setFloat(x+"-"+y,1);
					cMap.set(x*cMap.width/mapSquareSize,y*cMap.width/mapSquareSize,s[3]);
				}
			}
		}
		
		PVector dun = new PVector(int(random(0,mapSize)),int(random(0,mapSize)));
		for (int i = 0; i < 9; i++) {
			while(map.getFloat((int)dun.x+"-"+(int)dun.y) != 0){
				dun = new PVector(int(random(15,mapSize-15)),int(random(15,mapSize-15)));
			}
			map.setInt((int)dun.x+"-"+(int)dun.y,10*(i+1));
			cMap.set(int(dun.x)*cMap.width/mapSquareSize,int(dun.y)*cMap.width/mapSquareSize,s[5]);
		}

		cMap.save("data/Save/Map.png");									/*save Minimap image*/
		saveJSONObject(map,"data/Save/Map.json");						/*save Map json*/
		/**/															/*<-- end -->*/
	}

	void paint() {														/*Terrain Visualization*/
		pushMatrix();
		rotateX(PI/2);
		translate(-mapSquareSize*mapSize/2, -mapSquareSize*mapSize/2);
		for (int x = 0; x <= mapSize; x++) {
			for (int y = 0; y <= mapSize; y++) {
				if (map.getFloat(x+"-"+y)==0)
					image(s[4], x*mapSquareSize, y*mapSquareSize, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==1)
					image(s[3], x*mapSquareSize, y*mapSquareSize, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==2)
					image(s[2], x*mapSquareSize, y*mapSquareSize, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==3)
					image(s[6], x*mapSquareSize, y*mapSquareSize, mapSquareSize, mapSquareSize);
				if (map.getInt(x+"-"+y)==10 || map.getInt(x+"-"+y)==20 || map.getInt(x+"-"+y)==30 || map.getInt(x+"-"+y)==40 || map.getInt(x+"-"+y)==50 || map.getInt(x+"-"+y)==60 || map.getInt(x+"-"+y)==70 || map.getInt(x+"-"+y)==80 || map.getInt(x+"-"+y)==90)
					image(s[5], x*mapSquareSize, y*mapSquareSize, mapSquareSize, mapSquareSize);
			}
		}
		popMatrix();
	}
	void paintMinimap() {												/*Minimap*/
		pushMatrix();
		translate(width/2, height/2);
		imageMode(CENTER);
		image(cMap, 0, 0, height,height);
		/**/															/*Player in minimap*/
		fill(255, 0, 0);
		rectMode(CORNER);
		rect(map(mapP.x,-mapSize/2,mapSize/2,-height/2,height/2), map(mapP.z,-mapSize/2,mapSize/2,-height/2,height/2), height/mapSquareSize, height/mapSquareSize);
		popMatrix();
	}
	Terrain() {
		noiseSeed((int)random(0, 1000));								/*Random noiseSeed for terrain*/
		mapSize = mapSquareSize = 100;
		init();
	}
}