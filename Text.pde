class Text {															/*Debug Screen*/
	void paint() {
		pushMatrix();
		textSize(50);
		fill(255);
		textAlign(LEFT, TOP);
		/**/															/*@@@ DataInformation @@@*/
		text("x: "+mapP.x, 0, 0);
		text("z: "+mapP.z, 0, 50);
		text("fov: "+mapC.fov, 0, 100);
		text("fps: "+(int)frameRate, 0, 150);
		/**/															/*@@@ end @@@*/
		popMatrix();
	}
}