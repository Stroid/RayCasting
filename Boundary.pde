class Boundary {
  PVector A, B;
  Boundary(float x, float y, float x1, float y1) {
    this.A = new PVector(x, y);
    this.B = new PVector(x1, y1);
  }

  void display() {
    line(A.x, A.y, B.x, B.y);
  }
}
