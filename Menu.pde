class Menu{
	PImage m = new PImage();
	ArrayList<Button> buttons = new ArrayList<Button>();
	void paint(){
		imageMode(CORNER);
		image(m, 0, 0, width, height);
		for (Button b : buttons){
			b.paint();
			if(b.clicked()){
				switch (b.text) {
					case "New Game" :
					newGame();
						mode = 'g';
					break;
					case  "Load Game" :
						println("Load Game not implementated yet");
					break;
					case "Options" :
						println("Options not implementated yet");
					break;
					case "Credits" :
						println("Credits not implementated yet");
					break;	
				}
			}
		}
	}
	Menu(){
		m = loadImage("Menu/Menu.jpg");
		String[] buttonsText = {"New Game","Load Game","Options", "Credits"};
		color bCol = color(100, 100, 100, 200);
		for(int t = 0; t < buttonsText.length; t++)
			buttons.add(new Button(buttonsText[t],width/5,height*(t+4)/8,width*4/5,height*(t+5)/8,bCol));
	}
}