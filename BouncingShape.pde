class BouncingShape {
  
//General Variables
float shapeX,shapeY,shapeSize;
float xSpeed, ySpeed, shapeBounceHeight;
float xAcceleration, gravity;
float shapecounter;
float xDecrease = 0.90;
float yDecrease = -0.90;

//Color variables
float red = random(200,255);
float green = random(200,255);
float blue = random(200,255);


  //Shape constructor
  BouncingShape(float temporaryX, float temporaryY, float temporarySize, float temporaryMovement, int temporaryShapeCounter){
  shapeX = temporaryX;
  shapeY = temporaryY;
  shapeSize = temporarySize;
  xSpeed = temporaryMovement;
  xAcceleration = temporaryMovement;
  shapecounter = temporaryShapeCounter;
  
  //Additional Constructor Aspects
  ySpeed = 0;
  gravity = 0.08;
  shapeBounceHeight = height - (shapeSize/2);
  
  }


  void display(){
    //general set-up for shapes created
    fill(red,green,blue);
    noStroke();
    
    //If statement that creates the circular shapes.
    if(shapecounter == 1){
      ellipse(shapeX,shapeY,shapeSize,shapeSize);}
    
    //If statement that creates the rectange shapes.
    if(shapecounter == 2){
      rectMode(CENTER);
      rect(shapeX,shapeY,shapeSize,shapeSize);}
    
    //If statement that creates the triangle shapes.
    if(shapecounter == 3){
      triangle(shapeX , shapeY-(shapeSize/2) , shapeX-(shapeSize/2) , shapeY+(shapeSize/2), shapeX+(shapeSize/2), shapeY+(shapeSize/2));}
    
  }
  

  //Movement function
  void movement(){
  
    //Gravity simulation to ySpeed
    ySpeed = ySpeed + gravity;
    
    //General x/y location + speed set-up. With X having acceleration as an added variable.
    shapeX = shapeX + xSpeed + xAcceleration;
    shapeY = shapeY + ySpeed;
  }


  //If shape reaches the bottom reverse and bounce off ground.
  void reversebounce(){
    if(shapeY > shapeBounceHeight){
      ySpeed = ySpeed * yDecrease;
      xAcceleration = xAcceleration * xDecrease;
      shapeY = shapeBounceHeight;}
  }

  //Boolean check to verify if shape is out of bounds.
  boolean bounceFinished(){
    if( shapeX > (width + shapeSize)){
      return true;}
    else{
      return false;}
  }
  
}
