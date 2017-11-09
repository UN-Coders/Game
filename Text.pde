class Text {															/*Debug Screen*/
	 void paint() {
		pushMatrix();
		textSize(50);
		textAlign(LEFT, TOP);
																		/*@@@ DataInformation @@@*/
		text("x: "+mapP.x+"  cX: "+mapC.x, 0, 0);
		text("z: "+mapP.z+"  cZ: "+mapC.z, 0, 50);
		text("fov: "+mapC.fov, 0, 100);
		text("fps: "+(int)frameRate, 0, 150);
																		/*@@@ end @@@*/
		translate(width-mapT.mapSize*mapT.mapSquareSize*0.02, height-mapT.mapSize*mapT.mapSquareSize*0.02);
																		/*@@@ Minimap @@@*/
		pushMatrix();
		scale(0.02);
		rotateX(-PI/2);
		mapT.paint();
		popMatrix();
																		/*Player in minimap*/
		rect(mapP.x*2, mapP.z*2, 5, 5);
		popMatrix();
																		/*@@@ end @@@*/
	 }
}