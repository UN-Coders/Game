class Debug {															/*Debug Screen*/
	void paint() {
		resizeDialogue();
		pushMatrix();
		textSize(50);
		fill(255);
		textAlign(LEFT, TOP);
		/**/															/*@@@ DataInformation @@@*/
		text("x: "+mapP.x, 0, 0);
		text("z: "+mapP.z, 0, 50);
		text("Eye dist: "+mapC.eye, 0, 100);
		text("fps: "+(int)frameRate, 0, 150);
		/**/															/*@@@ end @@@*/
		popMatrix();
	}
	int w = width, h = height;
	void resizeDialogue(){
		if(w != width || h != height){
			talk.resize();
			w = width;
			h = height;
		}
	}
}