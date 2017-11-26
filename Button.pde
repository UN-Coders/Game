class Button{
	float x,y,x2,y2;
	String text;
	color nCol, sCol;
	int tWidth,tHeight;
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
	void resize(){
		init(text,(x-10)/tWidth,(y-10)/tHeight,(x2+10)/tWidth,(y2+10)/tHeight,nCol);
	}
	void init(String text,float x,float y,float x2,float y2, color col){
		this.text = text;
		this.x = (width*x)+10;
		this.y = (height*y)+10;
		this.x2 = (width*x2)-10;
		this.y2 = (height*y2)-10;
		this.nCol = col;
		this.sCol = color(red(col), green(col)-50, blue(col),alpha(col));
		this.tWidth = width;
		this.tHeight = height;
	}
	Button (String text,float x,float y,float x2,float y2, color col) {
		init(text, x, y, x2, y2, col);
	}
	Button (String text,float x,float y,float x2,float y2) {
		init(text, x, y, x2, y2, color(150, 100, 150, 200));
	}
}