class Camera {
  void paint() {
    camera(p1.x, p1.y-p1.fov, p1.z+p1.fov, p1.x, p1.y, p1.z, 0, 1, 0);
  }
}