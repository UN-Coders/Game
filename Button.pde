class Button{
	float x, y, x2, y2;
	String text;
	color nCol, sCol, nColText, sColText;
	int tWidth,tHeight;
	void paint(){
		pushMatrix();
		rectMode(CORNERS);
		if(selected())
			fill(sCol);
		else
			fill(nCol);
		rect(x, y, x2, y2, 10);
		textAlign(CENTER , CENTER);
		textSize(y2-y);
		if(selected())
			fill(sColText);
		else
			fill(nColText);
		text(text, x, y, x2, y2);
		popMatrix();
	}
	boolean selected(){
		if(mouseX>x && mouseY>y && mouseX<x2 && mouseY<y2)
			return true;
		else return false;
	}
	int oseg = 0;
	boolean clicked(){
		if(!selected())
			oseg = 0;
		if(selected() && mousePressed && oseg == 0){
			oseg = 1;
			return true;
		}else
			return false;
	}
	void resize(){
		init(text,(x-10)/tWidth,(y-10)/tHeight,(x2+10)/tWidth,(y2+10)/tHeight,nCol,nColText);
	}
	void init(String text,float x,float y,float x2,float y2, color col, color colText){
		this.text = text;
		this.x = (width*x)+10;
		this.y = (height*y)+10;
		this.x2 = (width*x2)-10;
		this.y2 = (height*y2)-10;
		this.nCol = col;
		this.sCol = color(red(col)+100, green(col)+50, blue(col)+30, alpha(col));
		this.nColText = colText;
		this.sColText = color(red(col)+150, green(col)+80, blue(col),alpha(col));
		this.tWidth = width;
		this.tHeight = height;
	}
	Button (String text,float x,float y,float x2,float y2, color col, color colText) {
		init(text, x, y, x2, y2, col, colText);
	}
	Button (String text,float x,float y,float x2,float y2, color col) {
		init(text, x, y, x2, y2, col, color(10));
	}
	Button (String text,float x,float y,float x2,float y2) {
		init(text, x, y, x2, y2, color(150, 100, 150, 200), color(10));
	}
}