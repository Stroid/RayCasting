class Emitter {

  PVector pos;
  ArrayList<PVector> rays = new ArrayList();

  float n;

  Emitter(float x, float y, float n) {
    pos = new PVector(x, y);
    this.n = n;

    //for (float i = 0; i < this.n; i++) {
    //  float ang = TWO_PI / this.n * i;
    //  PVector ray = getRayVector(this.pos, ang, walls);
    //  if (ray != null) rays.add(getRayVector(this.pos, ang, walls));
    //}
  }
  void display() {

    pos.x = mouseX;
    pos.y = mouseY;
    ellipse(this.pos.x, this.pos.y, 10, 10);

    for (float i = 0; i < this.n; i++) {
      float ang = TWO_PI / this.n * i;
      PVector ray = getRayVector(this.pos, ang, walls);
      if (ray != null) {
        line(this.pos.x, this.pos.y, ray.x, ray.y);
      }
    }
  }


  PVector getRayVector(PVector pos, float ang, ArrayList<Boundary> walls) {
    float maxMag = dist(0, 0, width, height);
    float mag = maxMag;
    PVector ray = PVector.fromAngle(ang);
    ray.setMag(mag);
    ray.add(pos);

    boolean hit = false;
    for ( int i = 0; i < walls.size(); i++) {
      Boundary tempWall = walls.get(i);

      //Point of intersection
      PVector  Intersection = lineLine(pos, ray, tempWall.A, tempWall.B);

      //If a intersection exist ray = Intersection
      if (Intersection != null) {
        ray = Intersection;
        hit = true;
      }
    }
    if (hit) return ray;
    return null;
  }

  // Find the point of intersection for linte AB and CD
  PVector lineLine(PVector A, PVector B, PVector C, PVector D) {
    Float uA =   ((D.x-C.x)*(A.y-C.y) - (D.y-C.y)*(A.x-C.x)) / ((D.y-C.y)*(B.x-A.x) - (D.x-C.x)*(B.y-A.y));
    Float uB =   ((B.x-A.x)*(A.y-C.y) - (B.y-A.y)*(A.x-C.x)) / ((D.y-C.y)*(B.x-A.x) - (D.x-C.x)*(B.y-A.y));

    //IF uA AND uB in the range of 0-1 THEN return Intersecton point
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
      float intersectionX = A.x + (uA * (B.x-A.x));
      float intersectionY = A.y + (uA * (B.y-A.y));
      PVector intersecton = new PVector(intersectionX, intersectionY);
      return intersecton;
    }
    return null;
  }
}
