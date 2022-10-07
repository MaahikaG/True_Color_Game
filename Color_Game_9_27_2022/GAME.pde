void game () {
  background (black);
  
  //Colored Words
  fill (colors[randomColor]);
  text (words[randomWord], 500, wordy);
  
  //making colored words move
  wordy += wordvy;
  
  //scoreboard
  fill (black);
  stroke (black);
  rect (0, -50, 1000, 125);
  textSize (25);
  fill (white);
  stroke (white);
  text ("Score = " + score, 500, 25);
  text ("Lives = " + lives, 500, 50);
  line (0, 75, 1000, 75);
  
  //Match and Don't Match Buttons 
  textSize (45);
  tactileRect (0, 600, 500, 200);
  text ("Match", 250, 700);
  tactileRect (500, 600, 500, 200);
  text ("Don't Match", 750, 700);
  stroke (white);
  line (0, 600, 1000, 600);
  line (500, 600, 500, 800);
  
  //pause button
  tactileRect (20, 20, 50, 40);
  if (mode == GAME) {
    line (38, 30, 38, 50);
    line (53, 30, 53, 50);
  }  
  
  //word hitting the bottom of the screen
  if (wordy > 650) {
    lives -= 1;
    wordy = 50;
    failure.play ();
    failure.rewind ();
    randomColor = (int) random (0, 7);
    randomWord = (int) random (0, 7);
    // 50 50 split
    half_split = random (0, 1);
    if (half_split < 0.5) {
      randomColor = (int) random (0, 7);
      randomWord = randomColor;
    } else {
      while (randomColor == randomWord) {
        randomColor = (int) random (0, 7);
        randomWord = (int) random (0, 7);
      }
    }
  }
  
  //going to gameover 
  if (lives == 0) mode = GAMEOVER;
}

void gameClicks () {
  //Pause 
  if (mouseX > 15 && mouseX < 65 && mouseY > 30 && mouseY < 70) {
    mode = PAUSE;
    music.pause ();
    fill (white);
    stroke (white);
    rect (20, 20, 50, 40, 5);
    stroke (black);
    triangle (33, 30, 33, 50, 58, 40);
  }
  
  //clicking match
  if (mouseX > 0 && mouseX < 500 && mouseY > 600 && mouseY < 800) {
    if (randomWord == randomColor) {      //success
      score += 1;
      wordvy = wordvy * 1.1;
      success.play ();
      success.rewind ();
    }
    else {          //failure
      lives -= 1;
      failure.play ();
      failure.rewind ();
    }
    wordy = 50;
    randomColor = (int) random (0, 7);
    randomWord = (int) random (0, 7);
    // 50 50 split
    half_split = random (0, 1);
    if (half_split < 0.5) {
      randomColor = (int) random (0, 7);
      randomWord = randomColor;
    } else {
      while (randomColor == randomWord) {
        randomColor = (int) random (0, 7);
        randomWord = (int) random (0, 7);
      }
    }
  }
  
  //clicking don't match
  if (mouseX > 500 && mouseX < 1000 && mouseY > 600 && mouseY < 800) {
    if (randomWord == randomColor) {         //failure
      lives -= 1;
      failure.play ();
      failure.rewind ();
    }
    else {             //success
      score += 1;
      wordvy = wordvy * 1.1;
      success.play ();
      success.rewind ();
    }
    wordy = 50;
    // 50 50 split
    randomColor = (int) random (0, 7);
    randomWord = (int) random (0, 7);
    half_split = random (0, 1);
    if (half_split <= 0.5) {
      randomColor = (int) random (0, 7);
      randomWord = randomColor;
    } else {
      while (randomColor == randomWord) {
        randomColor = (int) random (0, 7);
        randomWord = (int) random (0, 7);
      }
    }
  }
  
}
