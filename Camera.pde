class Camera {
	float eye;
	int x, y, z;
	void paint() {
		camera(x, mapP.y-eye, z+eye/4, x, y, z, 0, 1, 0);
	}

	/*<--StartTest-->*/
	void move(Terrain m) {														/*Camera movement relative to player movement*/
		if (mapP.x> 15-m.mapSize/2 && mapP.x<m.mapSize/2-15)
			x = m.pX*mapP.pS;
		if (mapP.z> 15-m.mapSize/2 && mapP.z<m.mapSize/2-15)
			z = m.pY*mapP.pS;
	}
	void move(TerrainDungeon m) {														/*Camera movement relative to player movement*/
		x = m.pX*mapP.pS;
		z = m.pY*mapP.pS;
	}
	/*<--EndTest-->*/

	Camera(){
		this.eye = 4000;
	}
}