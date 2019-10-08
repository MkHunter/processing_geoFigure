float s = 0;

class Circle{
  public int  id;
  public PVector Center;
  public float r;
  public PVector offsetMovement;
  public PVector movement;
  private PVector noiseMovement;
  Circle(int id,float x,float y,float radius, int sc){
    this.id = id;
    //Si el ID de la figura tiene cualquiera de los siguientes ID's
    //Entonces, pertenece a la figura Mayor y, por lo tanto no se moverá
    if(id< 179 && id>166 || id == 153 || id == 162|| id == 159|| id == 181|| id == 192|| id == 188|| id == 195)
      sc = 0;
    Center = new PVector(x,y);
    r = radius;
    // Si c = 0 (Circulo negro o figura principal) no debe existir movimiento PVector = <0,0>
    offsetMovement = new PVector(sc*random(5,50),sc*random(5,50)); 
    noiseMovement = new PVector(sc*random(5,50),sc*random(5,50));
    t = sin(id/1000)*255;
    movement = new PVector();
  }
  void move(){
    if(mousePressed){
      randomness = random(256);
      randomnessRGB = int(random(3));
      movement.x = 0;
      movement.y = 0;
      s = 0;
      return;
    }else{
      s+=.0001;
      if(!keyPressed){
        movement.x = offsetMovement.x* sin(s);
        movement.y = offsetMovement.y* sin(s);
      }else{
        movement.x = offsetMovement.x* noise(s+noiseMovement.x);
        movement.y = offsetMovement.y* noise(s+noiseMovement.y);
      }
    }
  }
  float t;
  void display(){
    //if(offsetMovement != new PVector(0,0,0))
      colorea();
    //else
      //fill(255);
    ellipse(Center.x+movement.x,Center.y+movement.y,r,r);
  }
  
  private void colorea(){
    float xprom = 255*Center.x/width, yprom = 255*Center.y/height;
    color col = 0;
    switch(randomnessRGB){
      case(0): col = color(randomness,xprom,yprom) ;break;
      case(1): col = color(xprom,randomness,yprom) ;break;
      case(2): col = color(xprom,yprom,randomness) ;break;
    }
    stroke(col);
    fill(col);
  }
}