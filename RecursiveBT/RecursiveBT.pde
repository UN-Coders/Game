JSONObject h;
Dungeon n1;
int s = 1000/12;
void setup() {
	size(1000,1000);
	strokeWeight(6);
	n1 = new Dungeon("test");
	h = loadJSONObject("save/saveMaptest.json");	/*Use for load the save*/
	rectMode(CENTER);
}

void draw() {
	for (int x = 0; x < 12; x++) {
		for (int y = 0; y < 12; y++) {
			float temp = h.getFloat(x+"-"+y);
			if(!(int(temp*0.1)*10 == temp)) /*UP*/
				line(x*s+s/2, y*s+s/2, x*s+s/2, y*s);
			temp = int(temp*0.1);
			if(!(int(temp*0.1)*10 == temp)) /*RIGHT*/
				line(x*s+s/2, y*s+s/2, x*s+s, y*s+s/2);
			temp = int(temp*0.1);
			if(!(int(temp*0.1)*10 == temp)) /*DOWN*/
				line(x*s+s/2, y*s+s/2, x*s+s/2, y*s+s);
			temp = int(temp*0.1);
			if(!(int(temp*0.1)*10 == temp)) /*LEFT*/
				line(x*s+s/2, y*s+s/2, x*s, y*s+s/2);
			temp = int(temp*0.1);
			if(!(int(temp*0.1)*10 == temp)) /*ROOM*/
				rect(x*s+s/2, y*s+s/2, s/2, s/2);
		}
	}
	
}
boolean chance(float percentage) {
	return random(0, 100)<percentage;
}