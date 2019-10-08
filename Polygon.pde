class Polygon{
  Circle[] nodes;
  color fillcolor, strokeColor;
  boolean noFill;
  
  Polygon(Circle[] nodes){    
    this.nodes = nodes;
  }
  
  void display(){
    beginShape(TRIANGLE_FAN); //Inicio del poligono
    //Por cada nodo existente de la figura
    for(int i = 0;i<nodes.length; i++){
      if(nodes[i] == null){
        continue;
      }
      fill(255);
      //Muevelo y despliégalo 
      nodes[i].move();
      nodes[i].display();
      noFill();
      vertex(nodes[i].Center.x+nodes[i].movement.x,
             nodes[i].Center.y+nodes[i].movement.y);
    }
    endShape(CLOSE); //Cierre del polígono
  }
}