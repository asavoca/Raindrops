int timeChange,currentTime,oldTime;

void setup() {
  size(500,500);
  oldTime = 0;
}

void draw() {
  currentTime = millis();
  if (currentTime - oldTime > 2000) {
    background(random(255),random(255),random(255));
    oldTime=currentTime;
  }
}

