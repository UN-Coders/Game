class Camera {
	float fov;
	int x, y, z;
	void paint() {
		camera(x, mapP.y-fov, z+fov/4, x, y, z, 0, 1, 0);
	}
	void move() {														/*Camera movement relative to player movement*/
		if (mapP.x> 15-mapT.mapSize/2 && mapP.x<mapT.mapSize/2-15)
			x = mapP.x*mapP.pS;
		if (mapP.z> 15-mapT.mapSize/2 && mapP.z<mapT.mapSize/2-15)
			z = mapP.z*mapP.pS;
	}
	Camera(){
		this.fov = 4000;
	}
}