JSONObject h;
Dungeon n1;
int s = 1000/15;
void setup() {
	size(1000,1000);
	strokeWeight(6);
	n1 = new Dungeon("test");
	h = loadJSONObject("save/saveMaptest.json");	/*Use for load the save*/
}

void draw() {

	for (int x = 0; x < 20; x++) {
		for (int y = 0; y < 20; y++) {
			if(!h.isNull(x+"-"+y+"tup") || !h.isNull(x+"-"+y+"tright") || !h.isNull(x+"-"+y+"tdown") || !h.isNull(x+"-"+y+"tleft")){
				if(!h.isNull(x+"-"+y+"tup"))
					line(x*s+s/2, y*s+s/2, x*s+s/2, y*s);
				if(!h.isNull(x+"-"+y+"tright"))
					line(x*s+s/2, y*s+s/2, x*s+s, y*s+s/2);
				if(!h.isNull(x+"-"+y+"tdown"))
					line(x*s+s/2, y*s+s/2, x*s+s/2, y*s+s);
				if(!h.isNull(x+"-"+y+"tleft"))
					line(x*s+s/2, y*s+s/2, x*s, y*s+s/2);
				rect(x*s+10, y*s+10, s-20, s-20);
			}else {
				if(!h.isNull(x+"-"+y+"fup"))
					line(x*s+s/2, y*s+s/2, x*s+s/2, y*s);
				if(!h.isNull(x+"-"+y+"fright"))
					line(x*s+s/2, y*s+s/2, x*s+s, y*s+s/2);
				if(!h.isNull(x+"-"+y+"fdown"))
					line(x*s+s/2, y*s+s/2, x*s+s/2, y*s+s);
				if(!h.isNull(x+"-"+y+"fleft"))
					line(x*s+s/2, y*s+s/2, x*s, y*s+s/2);
			}
		}
	}
}
boolean chance(float percentage) {
	return random(0, 100)<percentage;
}