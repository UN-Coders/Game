class Button{
	int x,y,x2,y2;
	String text;
	color nCol, sCol;
	void paint(){
		pushMatrix();
		rectMode(CORNERS);
		noStroke();
		if(selected())
			fill(sCol);
		else
			fill(nCol);
		rect(x, y, x2, y2, 10);
		fill(10, 10, 10);
		textAlign(CENTER);
		textSize(y2-y);
		text(text, (x+x2)/2, y2+((y-y2)/5));
		popMatrix();
	}
	boolean selected(){
		if(mouseX>x && mouseY>y && mouseX<x2 && mouseY<y2)
			return true;
		else return false;
	}
	Button (String text,int x,int y,int x2,int y2) {
		this.text = text;
		this.x = x+10;
		this.y = y+10;
		this.x2 = x2-10;
		this.y2 = y2-10;
		this.nCol = color(150,100,150,200);
		this.sCol = color(150,100,100,200);

	}

}