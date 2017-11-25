class TerrainDungeon{
	JSONObject map;
	Dungeon n1;
	int mapSize;
	int pX, pY;															/*Save player position*/

	void init(String s) {
		n1 = new Dungeon(s);
		//map = loadJSONObject("Save/Dungeon/"+s+"/Mini.json");			/*Use for load the save*/
		map = loadJSONObject("Save/Dungeon/"+s+"/Final.json");			/*Use for load the save*/
	}

	void paint() {
		pushMatrix();
		rotateX(PI/2);
		translate(-mapSize/2-mapSize*mapSize/2, -mapSize/2-mapSize*mapSize/2);
		rectMode(CORNER);
		for (int x = 0; x < n1.mSize*n1.rSize; x++) {
			for (int y = 0; y < n1.mSize*n1.rSize; y++) {
				if(map.isNull(x+"-"+y)) fill(81,51,81);
				else fill(100);
				rect(x*mapSize, y*mapSize, mapSize, mapSize);
			}
		}
		popMatrix();
	}
	TerrainDungeon(String s){
		mapSize = mapT.mapSize;											/*12*8 is the mapmapSize of the dungeon*/
		pX = pY = -47;													/*Spawn point player in each Dungeon*/
		init(s);
	}
}