class Button{
	String text;
	PFont font= new PFont();

	Button(String fontType){
		font = loadFont("font/"+fontType);
	}

/*	boolean selectedButton(float posX, float posY, float posX2, float posY2){
			this.text=text;
	}*/
	void paint(String text, float posX, float posY, float posX2, float posY2){
		textFont(font);
		// textSize(20);
		text(text, posX, posY, posX2, posY2);
		strokeWeight(2);
		stroke(255, 0, 0);
		noFill();
		rect(posX, posY, posX2, posY2);
	}
}