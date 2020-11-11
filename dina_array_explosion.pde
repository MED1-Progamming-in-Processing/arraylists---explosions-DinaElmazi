//Defining array list
ArrayList<BouncingShape> shapes;

//Minimum and maximum values for shape speed along x axis.
float mini = 0.5;
float maxi = 1;

//Integer that keeps track of shape creation.
int shapetracker = 1;

//General Variables
color grey = #E0DEDE;
int AmountOfShapes = 6;


void setup(){
  size(800,500);
  
  //New Array List created.
  shapes = new ArrayList<BouncingShape>();
  
  //add a new element to the array that is a new object of the BouncingShape class.
  shapes.add(new BouncingShape(mouseX, mouseY, random(40,50), random(mini,maxi), shapetracker));
}


void draw(){
  background(grey);
  fill(0,255,0);
  
  //For loop pulling different functions from the BouncingShape class, along with linking the shape created to the variable i and the array list.
  for (int i = shapes.size()-1; i >= 0; i--) { 
    
    BouncingShape Shape = shapes.get(i);
    shapes.get(i).display();
    shapes.get(i).movement();
    shapes.get(i).reversebounce();
    if (Shape.bounceFinished()) {
      //When shape parameters reach the outer bounds of the size of the sketch, they are removed.
      shapes.remove(i);
    }
  }
}


void mousePressed(){
  //New shape objects are added to the end of the array list.
  
  for(int i = 0; i < AmountOfShapes; i++)
    shapes.add(new BouncingShape(mouseX, mouseY, random(40, 50), random(mini, maxi), shapetracker));
  shapetracker++;
  
  //Shape boolean counter
  if (shapetracker > 3){
     shapetracker = 1;}
}
