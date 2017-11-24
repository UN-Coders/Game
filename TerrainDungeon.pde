class TerrainDungeon{
	JSONObject h;
	Dungeon n1;
	int size;
	void init(String s) {
		n1 = new Dungeon(s);
		//h = loadJSONObject("save/Dungeon/"+s+"/mini.json");			/*Use for load the save*/
		h = loadJSONObject("save/Dungeon/"+s+"/final.json");			/*Use for load the save*/
	}

	void paint() {
		pushMatrix();
		rotateX(PI/2);
		translate(size/2-size*size/2, size/2-size*size/2);
		for (int x = 0; x < n1.mSize*n1.rSize; x++) {
			for (int y = 0; y < n1.mSize*n1.rSize; y++) {
				if(h.isNull(x+"-"+y)) fill(81,51,81);
				else fill(100);
				rect(x*size, y*size, size, size);
			}
		}
		popMatrix();
	}
	TerrainDungeon(String s){
		size = mapT.mapSize;											/*12*8 is the mapSize of the dungeon*/
		init(s);
	}
}