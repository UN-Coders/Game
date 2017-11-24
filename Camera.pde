class Camera {
	float fov;
	int x, y, z;
	void paint() {
		camera(x, mapP.y-fov, z+fov/4, x, y, z, 0, 1, 0);
	}

	/*<--StartTest-->*/
	void move(Terrain m) {														/*Camera movement relative to player movement*/
		if (mapP.x> 15-m.mapSize/2 && mapP.x<m.mapSize/2-15)
			x = mapP.x*mapP.pS;
		if (mapP.z> 15-m.mapSize/2 && mapP.z<m.mapSize/2-15)
			z = mapP.z*mapP.pS;
	}
	void move(TerrainDungeon m) {														/*Camera movement relative to player movement*/
		//if (mapP.x> 15-m.mapSize/2 && mapP.x<m.mapSize/2-15)
			x = mapP.x*mapP.pS;
		//if (mapP.z> 15-m.mapSize/2 && mapP.z<m.mapSize/2-15)
			z = mapP.z*mapP.pS;
	}
	/*<--EndTest-->*/

	Camera(){
		this.fov = 4000;
	}
}