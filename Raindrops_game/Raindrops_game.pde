import ddf.minim.*;

int index = 0;
int lives;
int stage;
boolean loser = false;
int score = 0;
int rcount = 3000;
int oldTime = 0;
Minim minim;                    //Not really sure how this works
AudioSnippet lost;              //but it does so....
int currentTime;
Raindrop[] r = new Raindrop[rcount];
Catcher player;
void setup() {
  size(600, 600);
  minim = new Minim(this);
  lost = minim.loadSnippet("loser.mp3"); //loading the audio file
  player = new Catcher();           //creates catcher known as player
  for (int i = 0; i < rcount; i++) {
    r[i] = new Raindrop();          //Creating the raindrops
  }
}
void draw() {
  currentTime = millis();
  fill(0,50);
  rect(0,0,width,height);
  player.display();
  player.move();
  text(score, width - 200, 50);
  for (int i = 0; i < index; i++) {
    r[i].Raindrop();             //Makes raindrops fall
    player.catchDrops(r[i]);     //and checks if they are caught
    if (r[i].loser == true) {
      loser = true;      //checks if raindrops are missed
    }
  }
  if (currentTime - oldTime >= 2000) {  //checks if 2 seconds have passed since last drop
    index++;
    oldTime = currentTime;  //resets the timer
  }
  if (loser == true) {
    background(0);       //if you lose
    fill(255, 0, 0);     //you will know
    textAlign(CENTER);
    textSize(75);
    lost.play();
    text("LOSER", width/2, height/2);
    noLoop();
  }
}

