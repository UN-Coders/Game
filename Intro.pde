class Intro {
	String name;
	Button insert;
	ArrayList<Button> save;
	int nSave = 0;
	void paint(){
		insert = new Button(typing,0.2,0.5,0.8,0.7);
		if(nSave != 0){
			player.rowConfig.setString("name",typing);
			mode = "Battle";
			saveTable(player.config,"data/Saves/"+nSave+"/Player/playerConfig.csv");
		}
		insert.paint();
		for (int i = 0; i < 3; i++) {
			save.get(i).paint();
			if(save.get(i).clicked())
				nSave = i+1;
		}
	}
	Intro(){
		name = " ";
		insert = new Button(typing,0.2,0.2,0.8,0.4);
		save = new ArrayList<Button>();
		save.add(new Button("1",0.2,0.7,0.4,0.9));
		save.add(new Button("2",0.4,0.7,0.6,0.9));
		save.add(new Button("3",0.6,0.7,0.8,0.9));
	}
}