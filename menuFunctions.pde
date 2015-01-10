public class menuFunctions{
  public void drawMenu(){
    background(0);
    for (int i = 0; i < 600; i++){
    fill(237, 237, 5);
    rect(random(width), random(height), 4, 4);
    }
    
    PFont spaceFont;
    spaceFont = loadFont("GiddyupStd-50.vlw");
    textFont(spaceFont,50);
    fill(255);
    text("Space Out", width/2, 100);
    fill(0,0,153);
    rect(width/2, height-(height/5), width-40, 200, 50, 50, 50, 50);
    fill(255);
    text("Draw Now!", width/2, height-(height/5));
  }
  
  public void buttons(){
    if ( (mouseX > (width/2 - (width-40)/2)) && (mouseX < (width/2 + (width-40)/2))
      && (mouseY > (height-(height/5)) - 100) && (mouseY < (height-(height/5)) + 100) ) {
      screenState = 1;
      background(0);    //controls the playGame function background
    }
  }
}  
