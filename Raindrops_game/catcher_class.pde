class Catcher {
  PVector loc;
  Catcher() {
    loc = new PVector(mouseX, height-100);
  }
  void display() {
    fill(255,0,0);
    ellipse(loc.x, loc.y, 100, 100);
  }
}
