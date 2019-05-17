ArrayList<Boundary> walls = new ArrayList();
Emitter emitter;

void setup() {
  size(500, 500);
  strokeWeight(1);
  stroke(255);
  fill(255);

  for ( int i = 0; i < 3; i++) {
    float Ax = random(width);
    float Ay = random(height);
    float Bx = random(width);
    float By = random(height);
    walls.add(new Boundary(Ax, Ay, Bx, By));
  }
  emitter = new Emitter(width / 2, height / 2, 160);
}

void draw() {
  background(0);
  for ( int i = 0; i < walls.size(); i++) {
    float Ax = walls.get(i).A.x;
    float Ay = walls.get(i).A.y;
    float Bx = walls.get(i).B.x;
    float By = walls.get(i).B.y;
    line(Ax, Ay, Bx, By);
  }
  emitter.display();
}
