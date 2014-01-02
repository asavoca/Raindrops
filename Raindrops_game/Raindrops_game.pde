import ddf.minim.*;

int lives = 10;
int stage = 0;
int index = 0;
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
  background(0, 200);
  if (stage == 0) {
    if (mouseX >= 250 && mouseY >= 275 && mouseX <= 350 && mouseY <= 325) {
      stroke(255);
    } 
    else {
      stroke(0, 255, 0);
    }
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(30);
    text("START", width/2, height/2);
    line(250, 275, 250, 325);
    line(250, 275, 350, 275);
    line(350, 275, 350, 325);
    line(250, 325, 350, 325);
  }
  if (stage == 1) {
    currentTime = millis();
    player.display();
    player.move();
    text(score, width - 200, 50);
    text(lives, 200,50);
    text("Press r to restart", 200,80);
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
  if(lives == 0) {
    loser = true;
  }
}
void mousePressed() {
  if (mouseX >= 250 && mouseY >= 275 && mouseX <= 350 && mouseY <= 325) {
    stage = 1;
    loser = false;
  }
}
void keyPressed() {
  if (key == 'r') {
    stage = 0;
    score = 0;
    lives = 10;
    loser = false;
    loop();
  }
}
