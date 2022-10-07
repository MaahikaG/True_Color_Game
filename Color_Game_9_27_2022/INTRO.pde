void intro () {
  textFont (font, 128);
  music.play ();
  
  //GIF
  image (gif [f], 0, 0, width, height);
  f = f + 1;
  if (f == numberOfFrames) f = 0;
  
  //Title Banner
  fill (white);
  textSize (titleSize);
  text ("Color Game", 500, 200);
  if (titleGrow) titleSize += 1;
  if (titleGrow == false) titleSize -= 1;
  if (titleSize >= 120) titleGrow = false;
  if (titleSize <= 100) titleGrow = true;
  
  //start button
  textSize (50);
  tactileRect (300, 300, 400, 100);
  text ("Start", 500, 350);
}


void introClicks () {
  if (mouseX > 300 && mouseX < 700 && mouseY > 300 && mouseY < 400) {
    mode = GAME;
  }
}
