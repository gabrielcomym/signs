// this function loads all Fraktur Arabic strokes


void displayFA() {
  shapeMode(CENTER);

  if (activeFA == true) { // ifstrokes are active, do this
    for (int i = 0; i < numFA; i++) {

      int spaceX = width/numelEments;
      int spaceY = height/numelEments;



      for (int b=marginX; b<width - marginX2; b +=spaceX) {
        for (int a=marginY; a<height - marginY2; a +=spaceY) {

          shape(frakturArabik[(int)random(totalStrokesFA)], b, a, fontSize, fontSize);
        }
      }
    }
  }
  activeFA = false;
}