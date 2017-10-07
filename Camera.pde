class Camera {
  float  fov =1000;
  float x,y,z;
  void paint() {
    if(p1.x> 1500-t1.mapSize/2*t1.mapSquareSize && p1.x<t1.mapSize/2*t1.mapSquareSize-1500)x = p1.x;
    if(p1.z> 1100-t1.mapSize/2*t1.mapSquareSize && p1.z<t1.mapSize/2*t1.mapSquareSize-1100)z = p1.z;
    camera(x, p1.y-fov, z+fov/2, p1.x, p1.y, p1.z, 0, 1, 0);
  }
}