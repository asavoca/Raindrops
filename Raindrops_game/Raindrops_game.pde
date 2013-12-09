int index = 0;
int score = 0;
int rcount = 3000;
Raindrop[] r = new Raindrop[rcount];
Catcher player;
void setup() {
  size(600, 600);
  player = new Catcher();
  for (int i = 0; i < rcount; i++) {
    r[i] = new Raindrop();
  }
}
void draw() {
  background(60);
  player.display();
  for (int i = 0; i < index; i++) {
    r[i].Raindrop();
    player.catchDrops(r[i]);
  }
}
void mousePressed() {
  index++;
}

void keyPressed() {
  if (keyCode == LEFT) {
    player.loc.x-= 10;
  }
  if (keyCode == RIGHT) {
    player.loc.x+= 10;
  }
}
