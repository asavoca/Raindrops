class Raindrop {
  int d;
  PVector loc;
  PVector vel;
  PVector grav;
  Raindrop() {
    loc = new PVector(random(0, width), 0);
    vel = new PVector(0, 1);
    grav = new PVector(0, .05);
    d = 6;
  }
  void Raindrop() {
    fill(150, 150, 255);
    ellipse(loc.x, loc.y, d, d);
    loc.add(vel);
    vel.add(grav);
  }
}
