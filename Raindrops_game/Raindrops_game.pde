int rcount = 3000;
Raindrop[] r = new Raindrop[rcount];
Catcher player;
void setup() {
  size(600,600);
  player = new Catcher();
  for(int i = 0; i < rcount; i++){
    r[i] = new Raindrop();
  }
}
void draw() {
  background(255);
  for(int i = 0; i < rcount; i++){
    r[i].Raindrop();
  }
}
