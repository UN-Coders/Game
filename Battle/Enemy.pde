class Enemy extends Mob{
	ArrayList<String> loot=new ArrayList<String>();

	void init(){
		sprite = loadImage("Sprites/Enemies/"+type+".png");
		sp.clear();
		if(type=="physical"){
			for (int i = 0; i<594; i+=66) {
				for (int j = 0; j<700; j+=100) {
					sp.add(sprite.get(j, i, 100, 66));
				}
			}
		}
		else{
			for(int i=0; i<594; i+=66){
				for(int j=700; j>0; j-=100){
					sp.add(sprite.get(j,i,-100,66));
				}
			}
		}
	}

	void atkAnimation(int nAtk){
		pushMatrix();
		imageMode(CORNER);
		if(type=="physical"){
			TableRow ani = phyHab.findRow(habilities.get(nAtk),"name");
			if(ani.getInt("animation")==1){
				for(int i=14; i<19; i++){
					image(sp.get(i),width*2/3,height/7,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else {
				for(int i=20; i<26; i++){
					image(sp.get(i),width*2/3,height/7,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
		}
		else {
			TableRow ani = magHab.findRow(habilities.get(nAtk),"name");
			if(ani.getInt("animation")==1){
				for(int i=28; i<33; i++){
					image(sp.get(i),width*2/3,height/7,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else if(ani.getInt("animation")==2){
				for(int i=35; i<40; i++){
					image(sp.get(i),width*2/3,height/7,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
			else {
				for(int i=42; i<47; i++){
					image(sp.get(i),width*2/3,height/7,width*1.3/4,height*1.5/3);
					delay(200);
				}
			}
		}
		popMatrix();
	}
	Enemy(String type, String saveSlot){
		super(type,saveSlot);
	}
}