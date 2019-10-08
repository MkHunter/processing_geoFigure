float randomness = random(256);
int randomnessRGB = int(random(3));
class Triangle{
  public PVector p1, p2, p3;
  public int colorIndx;
  public color c;
  Triangle(float x1,float y1,float x2,float y2,float x3,float y3, int colorIndex){
    p1 = new PVector(x1,y1);
    p2 = new PVector(x2,y2);
    p3 = new PVector(x3,y3);
    colorIndx = colorIndex;
  }
  color getColor(){
    color temp = 0;
    float xprom = 255*(p1.x + p2.x + p3.x) /3 / width;
    float yprom = 255*(p1.y + p2.y + p3.y) /3 / height;
    switch(randomnessRGB){
      case(0): temp = color(randomness,xprom,yprom) ;break;
      case(1): temp = color(xprom,randomness,yprom) ;break;
      case(2): temp = color(xprom,yprom,randomness) ;break;
    }
    return temp;
  }
  void display(){
    c = getColor();
    //fill(Colors.get(colorIndx));
    fill(c);
    triangle( p1.x, p1.y, 
              p2.x, p2.y, 
              p3.x, p3.y );
  }
}