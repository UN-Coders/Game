class Terrain {
	int mapSize, mapSquareSize, worldEdge;								/*mapSquareSize is the size of each map rectangle section, worldEdge is the size of the border*/
	PImage[] s = new PImage[8];											/*Array of the Terrain textures*/
	JSONObject map = new JSONObject();

	void init() {														/*Initialization of the object*/
		for (int i = 0; i<8; i++)
			s[i] = loadImage("Terrain/Suelo"+(i+1)+".jpg");				/*Load the terrain textures*/
		/**/															/*@@@ Noise Generator in HashMap @@@*/
		noiseDetail(4, 0.53);
		float increment = 0.1;
		float xoff = 0.0;
		for (int x = 0; x <= mapSize; x++) {
			xoff += increment;
			float yoff = 0.0;
			for (int y = 0; y <= mapSize; y++) {
				yoff += increment;
				float perlinValue = noise(xoff, yoff);
				if(perlinValue<0.25)
					map.setFloat(x+"-"+y,3);
				else if(perlinValue<0.55)	
					map.setFloat(x+"-"+y,0);
				else if(perlinValue<0.8)
					map.setFloat(x+"-"+y,1);
				else
					map.put(x+"-"+y,2);
				worldEdge = (int)map(noise(xoff,yoff*2), 0, 1, 5, 15);
				if (x<worldEdge || y<worldEdge || x > mapSize-worldEdge || y > mapSize-worldEdge) 
					map.setFloat(x+"-"+y,1);
			}
		}
		saveJSONObject(map,"data/saveMap.json");
		/**/																/*@@@ end @@@*/
	}

	void paint() {														/*Terrain Visualization*/
		for (int x = 0; x<=mapSize; x++) {
			for (int y = 0; y<=mapSize; y++) {
				pushMatrix();
				rotateX(PI/2);
				translate(x*mapSquareSize-mapSquareSize*mapSize/2, y*mapSquareSize-mapSquareSize*mapSize/2);
				if (map.getFloat(x+"-"+y)==0)
					image(s[4], 0, 0, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==1)
					image(s[3], 0, 0, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==2)
					image(s[2], 0, 0, mapSquareSize, mapSquareSize);
				if (map.getFloat(x+"-"+y)==3)
					image(s[6], 0, 0, mapSquareSize, mapSquareSize);
				popMatrix();
			}
		}
	}
	Terrain() {
		noiseSeed((int)random(0, 1000));								/*Random noiseSeed for terrain*/
		this.mapSize = this.mapSquareSize = 100;
		init();
	}
}