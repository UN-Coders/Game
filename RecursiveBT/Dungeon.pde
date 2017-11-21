class Dungeon{
	String s;
	JSONObject map = new JSONObject();									/*JSON map*/
	int mSize = 15;														/*map size*/
	ArrayList<Room> vis = new ArrayList<Room>();						/*Visited rooms*/
	Room[][] room;														/*All the rooms*/
	void init() {
		room= new Room[mSize][mSize];									/*Create the space*/
		/**/															/*init each room in the space*/
		for (int x = 0; x<mSize; x++)
			for (int y = 0; y<mSize; y++)
				room[x][y] = new Room(x, y);
		/**/															/*init the walls between rooms*/
		for (int x = 0; x<mSize; x++)
			for (int y = 0; y<mSize; y++)
				room[x][y].initWalls(room, mSize);

		room[0][0].current = true;										/*The starting point of de algorithm*/
		/**/															/*Dungeon Creation*/
		boolean finish = false;
		while (!finish) {
			finish = true;
			for (int x = 0; x<mSize; x++)
				for (int y = 0; y<mSize; y++) {
					room[x][y].createDungeon(vis);
					if(!room[x][y].visited && finish)
						finish = false;
				}
		}
		/**/															/*End of creation*/
		/**/															/*Save Dungeon in .json*/
		for (int x = 0; x<mSize; x++)
			for (int y = 0; y<mSize; y++)
				room[x][y].saveDungeon(map);
			saveJSONObject(map,"data/save/saveMap"+s+".json");
		}
	Dungeon(String s){
		this.s = s;
		init();
	}
}