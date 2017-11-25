class Dungeon{
	JSONObject map = new JSONObject();									/*JSON temporal map*/
	JSONObject fmap = new JSONObject();									/*JSON final map*/
	int mSize = 10, rSize = 10;											/*map size, room size*/
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
		saveJSONObject(map,"data/Save/Dungeon/"+s+"/Mini.json");
		transformMap(s);
	}
	void transformMap(String s){
		for (int x = 0; x < mSize; x++) {
			for (int y = 0; y < mSize; y++) {
				float temp = map.getFloat(x+"-"+y);
				if(!(int(temp*0.1)*10 == temp)){						/*UP*/
					for (int mx = (rSize/4)+1; mx < (rSize*3/4)-1; mx++) {
						for (int my = 0; my < (rSize*3/4)-1; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				}
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){						/*RIGHT*/
					for (int mx = (rSize/4)+1; mx < rSize; mx++) {
						for (int my = (rSize/4)+1; my < (rSize*3/4)-1; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				}
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){						/*DOWN*/
					for (int mx = (rSize/4)+1; mx < (rSize*3/4)-1; mx++) {
						for (int my = (rSize/4)+1; my < rSize; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				}
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){						/*LEFT*/
					for (int mx = 0; mx < (rSize*3/4)-1; mx++) {
						for (int my = (rSize/4)+1; my < (rSize*3/4)-1; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				}
				temp = int(temp*0.1);
				if(!(int(temp*0.1)*10 == temp)){						/*ROOM*/
					for (int mx = (rSize/8)+1; mx < (rSize*7/8)-1; mx++) {
						for (int my = (rSize/8)+1; my < (rSize*7/8)-1; my++) {
							fmap.setFloat((x*rSize+mx)+"-"+(y*rSize+my),1);
						}
					}
				}
			}
		}
		saveJSONObject(fmap,"data/Save/Dungeon/"+s+"/Final.json");
	}
	Dungeon(String s){
		init(s);
	}
}