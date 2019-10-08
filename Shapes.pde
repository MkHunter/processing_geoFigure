//MÉTODOS DE DIBUJO
//Dibujar todas las figuras
public void drawShapes(){
  //Dibuja las figuras de colores <> Blanco
  drawColorShapes();
  //Dibuja los círculos de color RGB(0,0,0) Negro
  drawCircles(BlackCircles, 0); 
  //Dibuja las figuras de color Blanco
  drawWhiteShapes();
}
//Dibuja los triángulos con su color de relleno
void drawColorShapes(){
  stroke(Colors.get(0));
  for(Triangle t : Triangles){
    t.display();
  }
}

void drawCircles(ArrayList<Circle> Circles, color c){
  noStroke();
  fill(c);
  for(Circle circle : Circles)
    circle.display();
  noFill();
}

void drawWhiteShapes(){
  drawCircles(WhiteCircles, 255);
  drawWhiteLines();
}

void drawWhiteLines(){
  stroke(255);
  fill(255);
  //Dibuja todos los polígonos
  //Que tienen movimiento (dinámicos)
  
  for(Polygon p : Polygons){
    p.display();
  }
  //Se dibuja la figura central estática color blanco
  //BIG SHAPE 
  beginShape(TRIANGLE_FAN);
  vertex( 649, 513 );
  vertex( 582, 326 );
  vertex( 467, 469 );
  vertex( 547, 580 );
  vertex( 630, 632 );
  vertex( 727, 722 );
  vertex( 694, 576 );
  vertex( 784, 622 );
  vertex( 785, 482 );
  vertex( 746, 373 );
  vertex( 582, 326 );
  endShape();
  
  beginShape(TRIANGLE_FAN);
  vertex( 908, 304 );
  vertex( 752, 229 );
  vertex( 705, 228 );
  vertex( 746, 373 );
  vertex( 785, 482 );
  endShape();
  
  beginShape(TRIANGLE_FAN);
  vertex( 539, 198 );
  vertex( 512, 168 );
  vertex( 505, 82 );
  vertex( 638, 175 );
  vertex( 706, 228 );
  vertex( 583, 328 );
  vertex( 439, 314 );
  vertex( 430, 135 );
  vertex( 512, 168 );
  endShape(CLOSE);
 
  beginShape(TRIANGLE_FAN);
  vertex( 392, 398 );
  vertex( 466, 468 );
  vertex( 440, 313 );
  vertex( 407, 261 );
  vertex( 397, 353 );
  vertex( 281, 374 );
  vertex( 412, 491 );
  endShape(CLOSE);
  
  beginShape(TRIANGLE_STRIP);
  vertex( 785, 524 );
  vertex( 785, 484 );
  vertex( 852, 634 );
  vertex( 898, 608 );
  endShape(CLOSE);
  
  triangle(907, 305, 832, 475,866, 453 );
  triangle(706, 229, 751, 230, 657, 164);
  triangle(577, 626,547, 580,440, 606);
  triangle(630, 630,615, 684,647,647);
 
  line(657, 164, 662, 195);
  line(440,606,465, 468);
  line(825, 426, 832, 475);
  line(577, 627, 615, 684);
  line(407,261,438,280);
  line(412, 491, 439, 605);
  
  noStroke();
}