class Camera {
  float  fov =1000;
  void paint() {
    camera(p1.x, p1.y-fov, p1.z+fov, p1.x, p1.y, p1.z, 0, 1, 0);
  }
}