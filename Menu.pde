class Menu{
	PImage m = new PImage();
	ArrayList<Button> buttons = new ArrayList<Button>();
	void paint(){
		resizeButton();
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
	void resizeButton(){
		if(w != width){
			for (Button b : buttons) 
				b.resize();
			w = width;
		}
	}
	Menu(){
		m = loadImage("Menu/Menu.jpg");
		String[] buttonsText = {"New Game","Load Game","Options", "Credits"};
		color bCol = color(100, 100, 100, 200);
		for(int t = 0; t < buttonsText.length; t++)
			buttons.add(new Button(buttonsText[t],0.25,0.10*(t+5),0.75,0.10*(t+6),bCol));
	}
}