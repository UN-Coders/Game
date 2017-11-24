class Terrain{
	JSONObject h;
	Dungeon n1;
	int s;
	void init() {
		n1 = new Dungeon("test");
		//h = loadJSONObject("data/save/miniMapTest.json");				/*Use for load the save*/
		h = loadJSONObject("data/save/finalMapTest.json");				/*Use for load the save*/
	}

	void paint() {
		for (int x = 0; x < 12*8; x++) {
			for (int y = 0; y < 12*8; y++) {
				if(h.isNull(x+"-"+y)) fill(81,51,81);
				else fill(100);
				rect(x*s, y*s, s, s);
			}
		}
	}
	boolean chance(float percentage) {
		return random(0, 100)<percentage;
	}
	Terrain(){
		s = width/(12*8); 												/*12*8 is the mapSize of the dungeon*/
		init();
	}
}