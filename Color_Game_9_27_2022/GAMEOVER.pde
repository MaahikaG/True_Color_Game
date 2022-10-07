void gameover () {
  background (black);
  textSize (100);
  
  //line pattern
  strokeWeight (1);
  int y = 990;
  int x = 0;
  int i = 0;
  while (y >= 0) {
    stroke (colors[i]);
    line (1000 - y, 1000, 0, y);
    y -= 30;
    i += 1;
    if (i > 6) i = 0;
  }
  
  while (x <= 1000) {
    stroke (colors[i]);
    line (x, 0, 800+x, 800);
    x += 30;
    i += 1;
    if (i > 6) i = 0;
  }
  
  //title
  fill (white);
  text ("Gameover", 500, 200);
  
  //Restart and Exit Buttons
  textSize (50);
  tactileRect (300, 500, 400, 100);
  text ("Restart", 500, 550);
  tactileRect (300, 650, 400, 100);
  text ("Exit", 500, 700); 
  
  //highscore
  if (score > highscore) highscore = score;
  fill (white);
  text ("Highscore = " + highscore, 500, 300);
}

void gameoverClicks () {
  //Restart
  if (mouseX > 300 && mouseX < 700 && mouseY > 500 && mouseY < 600) {
    mode = INTRO;
    score = 0;
    lives = 3;
    wordvy = 2;
    wordy = -50;
    music.rewind ();
  }
  
  //Exit
  if (mouseX > 300 && mouseX < 700 && mouseY > 650 && mouseY < 750) {
    exit ();
  }
}
