public class optionsMenuFunctions{
  public void optionsMenu(){    
    background(11, 0, 105);
    for (int i = 0; i < 600; i++) {
      fill(237, 237, 5);
      rect(random(width), random(height), 4, 4);
    }

    createColorWheel();

    //rectangle for FINAL fill
    fill(rFill, gFill, bFill);
    rect(width/10, height/12, 50, 50);

    //draw shape chooser buttons
    shapeChooserButtons();
    
    //draw home screen (reset) button (arrow + words)
  }

  public void buttons() {
    float mouseDist = dist((width/2)-(width/10), height/4, mouseX, mouseY);
    if (mouseDist < width/3) {
      int c = get(mouseX, mouseY);
      rFill = int(red(c));
      gFill = int(green(c));
      bFill = int(blue(c));
    }
    if( get(mouseX, mouseY) == color(255, 0, 1) ) screenState = 0;
    else if(get(mouseX, mouseY) == color(194, 29, 29)) shapeType = 0;
    else if(get(mouseX, mouseY) == color(171, 132, 232)) shapeType = 1;
    else if(get(mouseX, mouseY) == color(29, 194, 194)) shapeType = 2;
    else if(get(mouseX, mouseY) == color(193, 232, 132)) shapeType = 3;
  }

  public void createColorWheel(){
    int radius = width/3;
    int segmentCount = 100;
    noStroke();
    
    colorMode(HSB, 360, width, height);
    float angleStep = 360/segmentCount;
    beginShape(TRIANGLE_FAN);
    vertex((width/2)-(width/10), height/4);
    for(float angle = 0; angle <= 360; angle+=angleStep) {
       float vx = ((width/2)-(width/10)) + cos(radians(angle))*radius;
       float vy = ((width/2)-(width/10)) + sin(radians(angle))*radius;
       fill(angle, width, height);
       vertex(vx, vy);
    }
    endShape();
    colorMode(RGB, 255, 255, 255);
  }

  public void shapeChooserButtons() {
    noFill();
    stroke(255, 255, 0);
    strokeWeight(10);
    if(shapeType == 0)  polygon(3, width / 8);
    else if(shapeType == 1) polygon(50, (3*width) / 8);
    else if(shapeType == 2)  polygon(4, (5*width) / 8);
    else if(shapeType == 3)  polygon(5, (7*width) / 8);
    
    stroke(0);
    strokeWeight(1);
    fill(194, 29, 29);
    polygon(3, width/8);          //triangle
    fill(171, 132, 232);
    polygon(50, (3*width)/8);     //ellipse
    fill(29, 194, 194);
    polygon(4, (5*width)/8);      //rectangle
    fill(193, 232, 132);
    polygon(5, (7*width)/8);      //pentagon
  }
  
  public void polygon(int n, float cx){
    float angle = 360.0 / n;
    float r = (width/1.35) / 8;
    float cy = (9*height) / 16;

    beginShape();
    for (int i = 0; i < n; i++){
      vertex(cx + r * cos(radians(angle * i)), cy + r * sin(radians(angle * i)));
    }
    endShape(CLOSE);
  }
  
}
