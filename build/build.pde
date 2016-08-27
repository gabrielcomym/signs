/*

 This program was written by Gabriel Comym as final course work for the MA in Computational Arts at
 Goldsmiths University of London. 
 
 Signs is a human-machine collaboration on modern calligraphy and the explorational practice of new imaginary
 procedurally generated linguistic symbols.
 
 In this example, 888 different SVG strokes from different handmade scripts are loaded onto a grid system. A toggle allows you
 to alternate between horizontal and radial compositions.
 
 In this version of the software I'm showing how to read a text file and search for blocks of text loading it into a temporary string.
 Once loaded, each single character calls back a set value of strokes and displays it onto the grid. This is happening with the
 Black Letter script only. The other two scripts, Fraktur arabic and Modern, I'm showing how to control how many strokes to be displayed
 on the grid. A simple GUI on allow you to control all the margins, font size, number of elements, radial position for all scrips,
 number of strokes to be loaded and also the option to toggle between the normal horizontal grid and a radial one.
 
 This code was written from scratch only with the help of Processing official documentation.
 https://processing.org/reference/
 
 Press "s" to save a jpg screenshot of the screen
 Press spacebar to load a different composition
 Press "h" followed by spacebar to hide or restore the GUI
 
 */


import controlP5.*;
ControlP5 cp5;


int marginX = 100;
int marginY = 100;
int marginX2 = 100;
int marginY2 = 100;

int radial1 = 200;
int radial2 = 500;
int radial3 = 400;


int numBL = 2;
int numFA = 2;
int numM1 = 2;


int numelEments = 20;
int fontSize = 40;


boolean activeBL = true;
boolean activeRadial1 = true;
boolean activeRadial2 = true;
boolean activeRadial3 = true;
boolean activeRadial4 = true;
boolean activeRadial5 = true;
boolean activeRadial6 = true;

boolean activeFA = true;
boolean activeM1 = true;
boolean displayGUI = true;
boolean toggleNormal = true;
boolean toggleRadial = true;


int totalStrokesBL = 111;
int totalStrokesFA = 264;
int totalStrokesM1 = 513;

PShape[] frakturArabik = new PShape [totalStrokesFA];
PShape[] blackLetter = new PShape [totalStrokesBL];
PShape[] modern1 = new PShape [totalStrokesM1];


String[] lines;
String words;

String tempLetter;
int tempStroke;

void setup() {
  background(255);
  //size(595, 842); // A4
  //size(763, 1080);
  fullScreen();

  cp5 = new ControlP5(this);

  lines = loadStrings("text.rtf");
  //println("there are " + lines.length + " lines");
  //println(lines);
  for (int i=0; i < lines.length; i++) {
    //println(lines[i]);
    words = words + lines[i];
  }


  // add a vertical slider
  cp5.addSlider("marginX")
    .setPosition(20, 20)
    .setRange(50, 200)
    .setValue(200)
    ;

  cp5.addSlider("marginY")
    .setPosition(20, 40)
    .setRange(50, 200)
    .setValue(200)
    ;

  cp5.addSlider("marginX2")
    .setPosition(20, 60)
    .setRange(50, 200)
    .setValue(200)
    ;

  cp5.addSlider("marginY2")
    .setPosition(20, 80)
    .setRange(50, 200)
    .setValue(200)
    ;

  cp5.addSlider("numelEments")
    .setPosition(20, 100)
    .setRange(1, 50)
    .setValue(10)
    ;

  cp5.addSlider("fontSize")
    .setPosition(20, 120)
    .setRange(1, 150)
    .setValue(100)
    ;

  cp5.addSlider("numBL")
    .setPosition(20, 140)
    .setRange(0, 5)
    .setValue(2)
    ;

  cp5.addSlider("numFA")
    .setPosition(20, 160)
    .setRange(0, 5)
    .setValue(0)
    ;

  cp5.addSlider("numM1")
    .setPosition(20, 180)
    .setRange(0, 5)
    .setValue(0)
    ;

  // create a toggle
  cp5.addToggle("toggleNormal")
    .setPosition(20, 200)
    .setSize(50, 20)
    //.setValue(true)
    .setMode(ControlP5.SWITCH)
    ;

  cp5.addSlider("radial1")
    .setPosition(width - 120, 20)
    .setRange(50, 500)
    .setValue(200)
    ;

  cp5.addSlider("radial2")
    .setPosition(width - 120, 40)
    .setRange(50, 500)
    .setValue(300)
    ;

  cp5.addSlider("radial3")
    .setPosition(width - 120, 60)
    .setRange(50, 500)
    .setValue(400)
    ;


  // reposition the Label for controller 'slider'
  cp5.getController("marginX").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("marginX").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("marginY").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("marginY").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("marginX2").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("marginX2").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("marginY2").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("marginY2").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("numelEments").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("numelEments").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("fontSize").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("fontSize").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("numBL").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("numBL").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("numFA").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("numFA").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("numM1").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("numM1").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("radial1").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("radial1").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("radial2").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("radial2").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);

  cp5.getController("radial3").getValueLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(0);
  cp5.getController("radial3").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(0);


  // LOADING SVGS
  for (int i = 0; i < totalStrokesBL; i++) {
    blackLetter[i] = loadShape("bl" + i + ".svg"); // loads all the blackLetter strokes into the array
  }

  for (int i = 0; i < totalStrokesFA; i++) {
    frakturArabik[i] = loadShape("ar1_" + i + ".svg"); // loads all the frakturArabic strokes into the array
  }

  for (int i = 0; i < totalStrokesM1; i++) {
    modern1[i] = loadShape("m1_" + i + ".svg"); // loads all the modernScript strokes into the array
  }
}

void draw() {

  if (toggleNormal==true) { // if the toggle is set to normal composition loads into horizontal grid
    displayBL();
    displayFA();
    displayM1();
  } else if (toggleNormal ==false) {  // if the toggle is set to radial composition loads into radial grid

    displayRadial1();
    displayRadial2();
    displayRadial3();
  }
}

void keyPressed() {
  if (key == ' ') {   // if the space bar is pressed, reload all strokes
    background(255);
    activeBL = true;
    activeFA = true;
    activeM1 = true;
    activeRadial1 = true;
    activeRadial2 = true;
    activeRadial3 = true;
  }

  if (key == 's') {
    // Saves each frame as line-000001.png, line-000002.png, etc.
    saveFrame("line-######.jpg");
  }

  if (key == 'h') {  // hides GUI
    displayGUI = !displayGUI;
    hideButton();
  }
}

void mouseDragged() 
{

  if (toggleNormal==true) {  // if mouse is dragged anywhere on screen, reloads horizontal grid
    background(255);
    activeBL = true;
    activeFA = true;
    activeM1 = true;

    activeRadial1 = false;
    activeRadial2 = false;
    activeRadial3 = false;
  } else if (toggleNormal ==false) { // if mouse is dragged anywhere on screen, reloads radial grid

    background(255);
    activeBL = false;
    activeFA = false;
    activeM1 = false;
    activeRadial1 = true;
    activeRadial2 = true;
    activeRadial3 = true;
  }
}


void hideButton() {  // hide GUI function

  if (displayGUI == false) {
    cp5.hide();
  } else if (displayGUI == true) {
    cp5.show();
  }
}


void toggle(boolean theFlag) {   // boolean flag indicates toggle position
  if (theFlag==true && toggleNormal==true) {

    activeBL = true;
    activeFA = true;
    activeM1 = true;
    activeRadial1 = false;
    activeRadial2 = false;
    activeRadial3 = false;
  } else if (theFlag==false && toggleNormal==false) {   // boolean flag indicates toggle position

    toggleNormal=false;
    activeBL = false;
    activeFA = false;
    activeM1 = false;
    activeRadial1 = true;
    activeRadial2 = true;
    activeRadial3 = true;
  }
  background(255);
  println("a toggle event.");
}