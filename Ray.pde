class Ray {

  //Possiton x, y; Angle A
  PVector A;
  PVector B;
  float ang;
  float len;
  Ray(PVector pos, float ang) {
    this.ang = ang;
    this.len = dist(0, 0, width, height);

    this.A = pos;

    this.B = PVector.fromAngle(ang);
    this.B.setMag(len);
    this.B.add(A);
  }

  void display() {

    line(this.A.x, this.A.y, this.B.x, this.B.y);
  }
  void setAngle() {
  }
}
