// this function loads all Fraktur Modern script

void displayM1() {
  shapeMode(CENTER);

  if (activeM1 == true) {
    //  for (int i = 0; i < 2; i++) {

    for (int i = 0; i < numM1; i++) {


      int spaceX = width/numelEments;
      int spaceY = height/numelEments;



      for (int b=marginX; b<width - marginX2; b +=spaceX) {
        for (int a=marginY; a<height - marginY2; a +=spaceY) {

          shape(modern1[(int)random(totalStrokesM1)], b, a, fontSize, fontSize);
        }
      }
    }
  }
  activeM1 = false;
}