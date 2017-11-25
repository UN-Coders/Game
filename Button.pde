class Button{
	int x,y,x2,y2;
	String text;
	color nCol, sCol;
	void paint(){
		pushMatrix();
		rectMode(CORNERS);
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
	boolean clicked(){
		if(selected() && mousePressed)
			return true;
		else
			return false;
	}
	void init(String text,int x,int y,int x2,int y2, color col){
		this.text = text;
		this.x = x+10;
		this.y = y+10;
		this.x2 = x2-10;
		this.y2 = y2-10;
		this.nCol = col;
		this.sCol = color(red(col), green(col)-50, blue(col),alpha(col));
	}
	Button (String text,int x,int y,int x2,int y2, color col) {
		init(text, x, y, x2, y2, col);
	}
	Button (String text,int x,int y,int x2,int y2) {
		init(text, x, y, x2, y2, color(150, 100, 150, 200));
	}
}