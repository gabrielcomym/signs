// this function loads all Black Letter strokes

void displayBL() {
  shapeMode(CENTER);

  if (activeBL == true) { // ifstrokes are active, do this

    int tempLocation = (int)random(words.length());  // this is how we load random blocks of letters onto a temporary string and read it
    tempLetter = str(words.charAt( tempLocation ));   

    // every character read from the TXT code file is given a certain number of strokes to be loaded, minimum of one stroke

    if (tempLetter.equals("a") || tempLetter.equals ("A")) tempStroke = 2 ;
    if (tempLetter.equals("b") || tempLetter.equals("B")) tempStroke = 2 ;
    if (tempLetter.equals("c") || tempLetter.equals("C") ) tempStroke = 1 ;
    if (tempLetter.equals("d") || tempLetter.equals("D")) tempStroke = 2 ;
    if (tempLetter.equals("e") || tempLetter.equals("E")) tempStroke = 4 ;
    if (tempLetter.equals("f") || tempLetter.equals("F")) tempStroke = 2 ;
    if (tempLetter.equals("g") || tempLetter.equals("G")) tempStroke = 2 ;
    if (tempLetter.equals("h") || tempLetter.equals("H")) tempStroke = 3 ;
    if (tempLetter.equals("i") || tempLetter.equals("I")) tempStroke = 3 ;
    if (tempLetter.equals("j") || tempLetter.equals("J")) tempStroke = 2 ;
    if (tempLetter.equals("k") || tempLetter.equals("K")) tempStroke = 3 ;
    if (tempLetter.equals("l") || tempLetter.equals("L")) tempStroke = 1 ;
    if (tempLetter.equals("m") || tempLetter.equals("M")) tempStroke = 1 ;
    if (tempLetter.equals("n") || tempLetter.equals("N")) tempStroke = 1 ;
    if (tempLetter.equals("o") || tempLetter.equals("O")) tempStroke = 1 ;
    if (tempLetter.equals("p") || tempLetter.equals("P")) tempStroke = 2 ;
    if (tempLetter.equals("q") || tempLetter.equals("Q")) tempStroke = 2 ; 
    if (tempLetter.equals("r") || tempLetter.equals("R")) tempStroke = 2 ;
    if (tempLetter.equals("s") || tempLetter.equals("S")) tempStroke = 1 ;
    if (tempLetter.equals("t") || tempLetter.equals("T")) tempStroke = 2 ;
    if (tempLetter.equals("u") || tempLetter.equals("U")) tempStroke = 1 ;
    if (tempLetter.equals("v") || tempLetter.equals("V")) tempStroke = 1 ;
    if (tempLetter.equals("w") || tempLetter.equals("W")) tempStroke = 1 ;
    if (tempLetter.equals("x") || tempLetter.equals("X")) tempStroke = 2 ;
    if (tempLetter.equals("y") || tempLetter.equals("Y")) tempStroke = 1 ;
    if (tempLetter.equals("z") || tempLetter.equals("Z")) tempStroke = 1 ;
    if (tempLetter.equals("/")) tempStroke = 1 ;
    if (tempLetter.equals(";")) tempStroke = 2 ;
    if (tempLetter.equals("{")) tempStroke = 1 ;
    if (tempLetter.equals("}")) tempStroke = 1 ;
    if (tempLetter.equals("(")) tempStroke = 1 ;
    if (tempLetter.equals(")")) tempStroke = 1 ;
    if (tempLetter.equals("|")) tempStroke = 1 ;
    if (tempLetter.equals("=")) tempStroke = 2 ;
    if (tempLetter.equals("")) tempStroke = 1 ;
    if (tempLetter.equals(",")) tempStroke = 1 ;
    if (tempLetter.equals(".")) tempStroke = 1 ;
    if (tempLetter.equals("1")) tempStroke = 2 ;
    if (tempLetter.equals("2")) tempStroke = 1 ;
    if (tempLetter.equals("3")) tempStroke = 1 ;
    if (tempLetter.equals("4")) tempStroke = 1 ;
    if (tempLetter.equals("5")) tempStroke = 1 ;
    if (tempLetter.equals("6")) tempStroke = 1 ;
    if (tempLetter.equals("7")) tempStroke = 2 ;
    if (tempLetter.equals("8")) tempStroke = 1 ;
    if (tempLetter.equals("9")) tempStroke = 1 ;


    println("Temp letter = " + tempLetter);
    println("Temp number of strokes = " + tempStroke);


    // setting up the grid
    for (int i = 0; i < tempStroke; i++) {


      int spaceX = width/numelEments;
      int spaceY = height/numelEments;


      for (int b=marginX; b<width - marginX2; b +=spaceX) {
        for (int a=marginY; a<height - marginY2; a +=spaceY) {

          shape(blackLetter[(int)random(totalStrokesBL)], b, a, fontSize, fontSize);
        }
      }
    }
  }
  activeBL = false;
}