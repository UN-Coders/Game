class Dungeon{
	JSONObject map = new JSONObject();									/*JSON temporal map*/
	JSONObject fmap = new JSONObject();									/*JSON final map*/
	int mSize = 12, rSize = 8;											/*map size, room size*/
	ArrayList<Room> vis = new ArrayList<Room>();						/*Visited rooms*/
	Room[][] room;														/*All the rooms*/
	void init(String s) {
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
		saveJSONObject(map,"data/save/miniDungeon"+s+".json");
		transformMap(s);
	}
	void transformMap(String s){
		for (int x = 0; x < mSize; x++) {
			for (int y = 0; y < mSize; y++) {
				float temp = map.getFloat(x+"-"+y);
				if(!(int(temp*0.1)*10 == temp)){
					for (int mx = 3; mx < 5; mx++) {
						for (int my = 0; my < 5; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				} /*UP*/
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){
					for (int mx = 3; mx < rSize; mx++) {
						for (int my = 3; my < 5; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				} /*RIGHT*/
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){
					for (int mx = 3; mx < 5; mx++) {
						for (int my = 3; my < rSize; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				} /*DOWN*/
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){
					for (int mx = 0; mx < 5; mx++) {
						for (int my = 3; my < 5; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				} /*LEFT*/
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){
					for (int mx = 2; mx < 6; mx++) {
						for (int my = 2; my < 6; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				} /*ROOM*/
			}
		}
		saveJSONObject(fmap,"data/save/finalDungeon"+s+".json");
	}
	Dungeon(String s){
		init(s);
	}
}