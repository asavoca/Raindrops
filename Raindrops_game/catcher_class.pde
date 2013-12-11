class Catcher {
  PVector loc;
  PVector vel;
  int d = 50;
  Catcher() {
    loc = new PVector(width/2, height-100);
    vel = new PVector(0, 0);
  }
  void display() {
    fill(0, 50, 200);
    ellipse(loc.x, loc.y, d, d);
  }
  void move() {
    loc.add(vel);
    if (loc.x - d/2 <= 0){ //makes sure the catcher stays on screen
      vel.x = 0;
      loc.x = d/2+1;
    }
    else if (loc.x + d/2 >= width) {
      vel.x = 0;
      loc.x = width-(d/2+1);
    }
    else if (keyPressed && keyCode == LEFT) {  //gradually accelerates it
      vel.x+= -.15;
    }
    else if (keyPressed && keyCode == RIGHT) {
      vel.x+= .15;
    }
    else if (keyPressed && key == ' ') {  //comes to a full stop if the SPACE button is pressed
      vel.mult(0);
    }
  }
  //This function checks for the drops to be caught
  void catchDrops(Raindrop r) {
    if (dist(r.loc.x, r.loc.y, loc.x, loc.y) <= d/2) {
      score++;
      r.loc.x = 10000;
    }
  }
}

