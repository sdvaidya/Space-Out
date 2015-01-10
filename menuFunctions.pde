public class menuFunctions{
  public void drawMenu(){
    background(255);
    fill(0);
    text("Circles", width/2, 100);
    rect(width/2, height-(height/5), width-40, 200, 50, 50, 50, 50);
    fill(255);
    text("Play", width/2, height-(height/5));
  }
  
  public void buttons(){
    if ( (mouseX > (width/2 - (width-40)/2)) && (mouseX < (width/2 + (width-40)/2))
      && (mouseY > (height-(height/5)) - 100) && (mouseY < (height-(height/5)) + 100) ) {
      screenState = 1;
      background(0);    //controls the playGame function background
    }
  }
}  
