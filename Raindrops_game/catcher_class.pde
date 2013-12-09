class Catcher {
  PVector loc;
  Catcher() {
    loc = new PVector(mouseX, height-100);
  }
  void display() {
    fill(0, 50, 200);
    ellipse(mouseX, mouseY, 100, 100);
  }
  void catchDrops(Raindrop r) {
    if(dist(r.loc.x,r.loc.y,mouseX,mouseY) <= 52){
      score++;
      index++;
      r.loc.x = 10000;
    }
  }
}

