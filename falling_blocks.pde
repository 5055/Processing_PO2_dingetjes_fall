int countx = 8;
int county = 15;
int sSize = 5;
int bSize = 40;


Shape[][] shape = new Shape[countx][county];

void setup() {
  size(300, 300);
  for (int i = 0; i<countx; i++) {
    for (int j = 0; j<county; j++) {
      if (j%4 == 0) {
        if (i%2 == 0) {
          shape[i][j] =new Shape(2*bSize*(i/2) -bSize+ (bSize)/1.8+sSize, floor(j/2)*bSize+(bSize)/2.1, (bSize- sSize)*1.9, -sSize, false);
        } else if (i%2 == 1) {
          //     println(i);
          shape[i][j] =new Shape(bSize+ (bSize)/2.1+2*bSize*(i/2), floor(j/2)*bSize-bSize+ (bSize)/1.8+sSize, -sSize, (bSize- sSize)*1.9, false);
        }
      }
      if (j%4 == 1) {
        if (i%2 == 0) {
          //      println(i);
          shape[i][j] =new Shape(2*bSize*(i/2) -bSize+ (bSize)/1.8+sSize, floor(j/2)*bSize+ (bSize)/1.9, (bSize- sSize)*1.9, sSize, false);
        } else if (i%2 == 1) {
          //    println(i);
          shape[i][j] =new Shape(bSize+ (bSize)/1.9+2*bSize*(i/2), floor(j/2)*bSize-bSize+ (bSize)/1.8+sSize, sSize, (bSize- sSize)*1.9, false);
        }
      }
      if (j%4 == 2) {
        if (i%2 == 0) {
          //      println(i);
          shape[i][j] =new Shape((bSize)/2.1+2*bSize*(i/2), +floor(j/2)*bSize -bSize+ (bSize)/1.8+sSize, -sSize, (bSize- sSize)*1.9, false);
        } else if (i%2 == 1) {
          //    println(i);
          shape[i][j] =new Shape(bSize+2*bSize*(i/2) -bSize+ (bSize)/1.8+sSize, floor(j/2)*bSize +(bSize)/2.1, (bSize- sSize)*1.9, -sSize, false);
        }
      }
      if (j%4 == 3) {
        if (i%2 == 0) {
          //      println(i);
          shape[i][j] =new Shape((bSize)/1.9+2*bSize*(i/2), floor(j/2)*bSize -bSize+ (bSize)/1.8+sSize, sSize, (bSize- sSize)*1.9, false);
        } else if (i%2 == 1) {
          //    println(i);
          shape[i][j] =new Shape(bSize+2*bSize*(i/2) -bSize+ (bSize)/1.8+sSize, floor(j/2)*bSize+(bSize)/1.9, (bSize- sSize)*1.9, sSize, false);
        }
      }
    }
  }
}

void draw() {
  //  translate(20,20);
  background(255);
  for (int i = 0; i<countx; i++) {
    for (int j = 0; j<county; j++) {

      fill(255/countx*(i+1), 255/county*(j+1), 255/county/countx*(i+1)*(j+1));
      if (shape[i][j].fall &&shape[i][j].xpos < height) {
        shape[i][j].ypos = shape[i][j].ypos +1;
      }
      rect(shape[i][j].xpos, shape[i][j].ypos, shape[i][j].xs, shape[i][j].ys);
    }
  }
}
void mouseMoved() {

  //  println(shape[1][1].xpos-mouseX,shape[1][1].ypos-mouseY);
  for (int i = 0; i<countx; i++) {
    for (int j = 0; j<county; j++) {
      if (mouseX > shape[i][j].xpos && mouseX < shape[i][j].xpos+shape[i][j].xs &&mouseY< shape[i][j].ypos && mouseY > shape[i][j].ypos+shape[i][j].ys) {

        shape[i][j].fall = true;
      }
      if (mouseX < shape[i][j].xpos && mouseX > shape[i][j].xpos+shape[i][j].xs &&mouseY> shape[i][j].ypos && mouseY < shape[i][j].ypos+shape[i][j].ys  ) {

        shape[i][j].fall = true;
      }
      if (mouseX > shape[i][j].xpos && mouseX < shape[i][j].xpos+shape[i][j].xs &&mouseY> shape[i][j].ypos && mouseY < shape[i][j].ypos+shape[i][j].ys ) {

        shape[i][j].fall = true;
      }
    }
  }
}

class Shape {
  float xpos;
  float ypos;
  float xs;
  float ys;
  boolean fall;
  Shape(float nxpos, float nypos, float nxs, float nys, boolean nfall) {
    xpos  = nxpos;
    ypos  = nypos;
    xs  = nxs;
    ys  = nys;
    fall = nfall;
  }
}
