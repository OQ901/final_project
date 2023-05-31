// Game Variables
boolean started;
boolean gameRun;
boolean isDead;
Level level;

// Images
PImage logo;


// One-time Setup
void setup() {

  size(480, 720); // 4 * 5 -- 120 pxl * 144 pxl tiles

  logo = loadImage("img/logo.jpg");

  // Set custom shifting variables
  newStart();

}


// New Game
void newStart() {
  
  // (Re)Set player status
  gameRun = false;
  isDead = false;
  level = new Level(1); // STUB
  
} // end newStart()


void keyPressed() {

  if ("1234".contains(String.valueOf(key))) {
    isDead = !level.checkMove(Character.getNumericValue(key) - 1);
  }

  // Start

  if (key == ' ' && !started) {
    started = true;
  } else
  if (started && !gameRun) {
    gameRun = true;
  }

  // Restart
  if (key == ' ' && isDead) {
    newStart();
  }

} // end keyPressed()


void draw() {

  if (!started) {
    
    background(255, 255, 255);
    image(logo, 100, 140, 280, 280);
    fill(0);
    textSize(40);
    text("Piano Tiles X", 140, 460, 280, 60);

  } else{
    
    level.levelSetup();

    // Alive
    if (gameRun & !isDead) {
      isDead = level.scroll();
    }
  }
  
  if (isDead) {
          // End Screen
      fill(255, 255, 255);
      rect(60, 180, 360, 45);
      rect(60, 240, 360, 75);
      fill(100);
      textSize(30);
      String s = "You suck!";
      text(s, 180, 185, 350, 240);
      s = "Score: TBD";
      text(s, 90, 245, 350, 240);
      s = "High Score: TBD";
      text(s, 90, 275, 350, 240);

    }

} // end draw()
