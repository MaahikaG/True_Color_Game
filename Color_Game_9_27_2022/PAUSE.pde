void pause () {
}

void pauseClicks () {
  if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 60) {
    mode = GAME;
    music.play ();
  }
}
