int index = 0;
int score = 0;
int rcount = 3000;
int oldTime = 0;
int currentTime;
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
  currentTime = millis();
  background(0,100);
  player.display();
  player.move();
  text(score,width - 200, 50);
  for (int i = 0; i < index; i++) {
    r[i].Raindrop();
    player.catchDrops(r[i]);
  }
  if(currentTime - oldTime >= 2000) {
    index++;
    oldTime = currentTime;
  }
}
