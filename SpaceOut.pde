import android.view.MotionEvent;
import ketai.ui.*;

KetaiGesture gesture;
PFont myFont;

// 0 -> menu
// 1 -> game
// 2 -> options
int screenState = 0;
float rFill = 0, gFill = 255, bFill = 255, alphaFill = 20;
float shapeAngle = 0;

//options menu background STAR color
final int optionMenuStarCount = 500;
int[] optionStar_x = new int[optionMenuStarCount];
int[] optionStar_y = new int[optionMenuStarCount];

//VARIABLE TO CONTROL SHAPE TYPE// 0->triangle    1->ellipse    2->rectangle    3->pentagon
int shapeType = 0;

menuFunctions mainMenu = new menuFunctions();
gameFunctions game = new gameFunctions();
optionsMenuFunctions optionMenu = new optionsMenuFunctions();

void setup(){
  background(255);
  orientation(PORTRAIT);
  size(displayWidth, displayHeight);
  rectMode(CENTER);
  smooth();
  frameRate(130);
  ellipseMode(RADIUS);
  
  gesture = new KetaiGesture(this);
  
  //textSize
  textSize(96);
  textAlign(CENTER, CENTER);
  
  //randomize options menu stars
  for(int i = 0; i < optionMenuStarCount; i++){
    optionStar_x[i] = int(random(width));
    optionStar_y[i] = int(random(height));
  }
}

void draw(){
  strokeWeight(1);
  if (screenState == 0){
    mainMenu.drawMenu();
    mainMenu.buttons();
  }
  if (screenState == 1)
    game.playGame();
  if (screenState == 2){
    optionMenu.optionsMenu();
    optionMenu.buttons();
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == MENU){
      screenState = (screenState == 1) ? 2 : 1;  //change from GAME to OPTIONS screen
    }
    if (screenState == 1)
      background(0);    //controls playGame function background
  } // end of CODED if statement
}

// HANDLE ALL KETAI FUNCTIONS
void onDoubleTap(float x, float y){
  background(0);
}
void onRotate(float x, float y, float ang){
  shapeAngle += ang;
}
void onLongPress(){
  screenState = (screenState == 1) ? 2 : 1;
  if(screenState == 1)
    background(0);
}
public boolean surfaceTouchEvent(MotionEvent event) {
  super.surfaceTouchEvent(event);
  return gesture.surfaceTouchEvent(event);
}
