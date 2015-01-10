public class gameFunctions{
  public void playGame(){
    translate(width/2, height/2);
    rotate(shapeAngle);
    fill(rFill, gFill, bFill, alphaFill);
    
    if(shapeType == 0)  polygon(3);
    else if(shapeType == 1) ellipse(0, 0, mouseX/2, mouseY/2);
    else if(shapeType == 2)  polygon(4);
    else if(shapeType == 3)  polygon(5);
  
    //shimmering effect
    set( int(random(width)), int(random(height)), color(255) );
  }
  
  public void polygon(int n){
    float angle = 360.0 / n;
    float r = mouseY/2;
    float cx = 0, cy = 0;

    beginShape();
    for (int i = 0; i < n; i++){
      vertex(cx + r * cos(radians(angle * i)), cy + r * sin(radians(angle * i)));
    }
    endShape(CLOSE);
  }
}
