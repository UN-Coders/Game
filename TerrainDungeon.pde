class TerrainDungeon{
	JSONObject h;
	Dungeon n1;
	int s;
	void init() {
		n1 = new Dungeon("Test");
		//h = loadJSONObject("save/miniDungeonTest.json");				/*Use for load the save*/
		h = loadJSONObject("save/finalDungeonTest.json");				/*Use for load the save*/
	}

	void paint() {
		pushMatrix();
		rotateX(PI/2);
		translate(s/2-s*s/2, s/2-s*s/2);
		for (int x = 0; x < 12*8; x++) {
			for (int y = 0; y < 12*8; y++) {
				if(h.isNull(x+"-"+y)) fill(81,51,81);
				else fill(100);
				rect(x*s, y*s, s, s);
			}
		}
		popMatrix();
	}
	TerrainDungeon(){
		s = mapT.mapSize; 												/*12*8 is the mapSize of the dungeon*/
		init();
	}
}