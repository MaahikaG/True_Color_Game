//Maahika Gupta
//Programming 12
//Color Game
//09-27-2022

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer music, success, failure;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//color pallete
color red = #ffadad;
color orange = #ffd6a5;
color yellow = #fdffb6;
color green = #caffbf;
color blue = #9bf6ff;
//color darkblue = #a0c4ff;
color purple = #bdb2ff;
color pink = #ffc6ff;
color white = #ffffff;
color black = #000000;

//GIF Arrays
PImage [] gif;
int numberOfFrames;
int f;

//Intro Variables
int titleSize;
boolean titleGrow;

//Game Variables
int score;
int lives;
int wordy;
float wordvy;
boolean match_clicked;
boolean dont_match_clicked;
int randomWord = (int) random (0, 7);
int randomColor = (int) random (0, 7);
String [] words = {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE", "PINK"};
color [] colors = {red, orange, yellow, green, blue, purple, pink};
float half_split = random (0, 1);

//Gameover Variables
int highscore;

PFont font;

void setup () {
  size (1000, 800);
  mode = INTRO;
  textAlign (CENTER, CENTER);
  font = createFont("aAbstractGroovy.ttf", 40);
  
  //Initialize Array Variables
  numberOfFrames = 4;
  gif = new PImage [4];
  
  //While Loop Frames
  int i = 0;
  while (i < numberOfFrames) {
    gif[i] = loadImage ("frame_" + i + "_delay-0.06s.png");
    i ++;
  }
  
  //Initializing Variables
  titleSize = 100;
  titleGrow = true;
  score = 0;
  lives = 3;
  wordy = 0;
  wordvy = 2;
  highscore = 0;
  
  //initialize minim
  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  success = minim.loadFile("SUCCESS.wav");
  failure = minim.loadFile("FAILURE.wav");
}

void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Error: Mode = " + mode);
  }
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (5);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (255);
    fill (255);
    rect (x, y, w, l, 5);
    fill (0);
    stroke (0);
  } else {
    stroke (0);
    fill (0);
    rect (x, y, w, l, 5);
    fill (255);
    stroke (255);
  }
}
