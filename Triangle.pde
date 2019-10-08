class Triangle{
  public PVector p1, p2, p3;
  public int colorIndx;
  
  Triangle(float x1,float y1,float x2,float y2,float x3,float y3, int colorIndex){
    p1 = new PVector(x1,y1);
    p2 = new PVector(x2,y2);
    p3 = new PVector(x3,y3);
    colorIndx = colorIndex;
  }
  
  void display(){
    fill(Colors.get(colorIndx));
    triangle( p1.x, p1.y, 
              p2.x, p2.y, 
              p3.x, p3.y );
  }
}