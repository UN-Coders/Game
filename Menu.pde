class Menu{
	PImage m = new PImage();
	ArrayList<Button> buttons = new ArrayList<Button>();
	void paint(){
		image(m, width/2,height/2,width,height);
		for (Button b : buttons)
			b.paint();
	}
	Menu(){
		m = loadImage("Menu/menu.jpg");
		String[] buttonsText = {"New Game","Load Game","Options", "Credits"};
		for(int t = 0; t < buttonsText.length; t++)
			buttons.add(new Button(buttonsText[t],width/5,height*(t+4)/8,width*4/5,height*(t+5)/8));
	}
}