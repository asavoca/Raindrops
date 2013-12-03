class Raindrop {
  int d;
  PVector loc;
  PVector vel;
  PVector grav;
  Raindrop() {
    loc = new PVector(random(0, width), random(-height, 0));
    vel = new PVector(0, 4);
    grav = new PVector(0, .2);
    d = 6;
  }
  void Raindrop() {
    fill(150, 150, 255);
    ellipse(loc.x, loc.y, d, d);
    loc.add(vel);
    if (loc.y > 0) {
      vel.add(grav);
    }
    vel.x = random(-.2, .2);
    if (loc.y > height) {
      loc.y = 0;
      vel.y = 2;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.x > width) {
      loc.x = 0;
    }
  }
}

