void keyReleased () {
  if (mode == GAME) {
    if (keyCode == LEFT ) {
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
    if (keyCode == RIGHT) {
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
}
