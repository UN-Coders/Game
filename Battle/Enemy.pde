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
	
	@Override
	int selecAtk(){
		return int(random(1, 4));
	}
	Enemy(String type, String saveSlot){
		super(type,saveSlot);
	}
}