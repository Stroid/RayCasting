class Emitter {

  PVector pos;
  ArrayList<Ray> rays = new ArrayList();

  Emitter(float x, float y, float n) {
    pos = new PVector(x, y);

    for (int i = 0; i < n; i++) {
      rays.add(new Ray(pos, TWO_PI / n * i));
    }
  }
  void display() {
    ellipse(this.pos.x, this.pos.y, 10, 10);
    for (int i = 0; i < rays.size(); i++) {
      Ray ray = rays.get(i);

      for ( int j = 0; j < walls.size(); j++) {
        Boundary tempWall = walls.get(j);

        //Point of intersection
        PVector  POI = lineLine(ray.A, ray.B, tempWall.A, tempWall.B);
        if (POI != null) {
          ray.B = POI;
        }
      }
      ray.display();
    }
  }

  // Calculate the point of intersection for linte AB and CD
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
