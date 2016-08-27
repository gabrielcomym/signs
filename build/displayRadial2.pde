// LOADING THE STROKES ONTO THE RADIAL GRID

void displayRadial2() {
  shapeMode(CENTER);

  if (activeRadial2 == true) {


    for (int i = 0; i < numelEments; i++) {

      float delta = TWO_PI / numelEments; 


      pushMatrix(); // remember to always push the matrix to the center of the screen. That is all starting point for the global rotation.
      translate( width/2, height/2 );
      rotate( delta * i);

      for (int w = 0; w < numBL; w++) {
        shape(blackLetter[(int)random(totalStrokesBL)], 0, radial2, fontSize, fontSize);
      }

      for (int w = 0; w < numFA; w++) {
        shape(frakturArabik[(int)random(totalStrokesFA)], 0, radial2, fontSize, fontSize);
      }

      for (int w = 0; w < numM1; w++) {
        shape(modern1[(int)random(totalStrokesM1)], 0, radial2, fontSize, fontSize);
      }

      popMatrix();
    }

    activeRadial2 = false;
  }
}