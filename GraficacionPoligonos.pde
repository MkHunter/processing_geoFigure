//Listas contenedoras de información
ArrayList<Integer> Colors;     //Lista de Colores
ArrayList<Circle> WhiteCircles;//Lista de Circulos Blancos
ArrayList<Circle> BlackCircles;//Lista de Circulos Negros
ArrayList<Triangle> Triangles; //Lista de Triángulos
ArrayList<Polygon> Polygons;   //Lista de Polígonos

//Método para inicializar
void setup(){
  //Titulo de la ventana
  surface.setTitle("Icosphere - Mike López"); 
  //Tamaño de la ventana of 1200 x 800
  size(1200,800);
  //Carga la información de todas las figuras
  //En sus listas correspondientes.
  loadData();
  textSize(30);
}
//Método de dibujo que se ejecuta a 60fps
void draw(){
  //Se dibuja el fondo Gris
  background(128);
  //Mensaje de texto
  text("Press the mouse to show static image.",0,height-50);
  text("Press the any key to display Noise movement.",0,height-20);
  //Se dibuja la imagen
  drawShapes();
}

void loadData(){
  //Se inicializan las listas cargando la información
  //desde los archivos data/*.csv
  WhiteCircles = getCircles(1);  
  BlackCircles = getCircles(0);  
  Colors = getColors();          
  Polygons = getPolygons();     
  Triangles = getTriangles();    
}
//Metodo para obtener la lista de Triangulos
ArrayList<Triangle> getTriangles(){
  //Se cargan los datos de la tabla de Excel
  Table TrianglesData = loadTable("../data/Triangles.csv","header");
  ArrayList<Triangle> temp = new ArrayList<Triangle>();
    for(int i = 0; i < TrianglesData.getRowCount();i++){
    TableRow row = TrianglesData.getRow(i);
    int x1 = row.getInt("x1");
    int y1 = row.getInt("y1");
    int x2 = row.getInt("x2");
    int y2 = row.getInt("y2");
    int x3 = row.getInt("x3");
    int y3 = row.getInt("y3");
    int colorIndx = row.getInt("fillColor");
    temp.add(new Triangle(x1,y1,x2,y2,x3,y3,colorIndx));
  }
  return temp;
}
//Metodo para obtener la lista de Colores
ArrayList<Integer> getColors(){
  //Se cargan los datos de la tabla de Excel
  Table ColorsData = loadTable("data/Colors.csv","header");
  ArrayList<Integer> temp = new ArrayList<Integer>();
  
  for(int i = 0; i < ColorsData.getRowCount();i++){
    TableRow row = ColorsData.getRow(i);
    int r = row.getInt("r");
    int g = row.getInt("g");
    int b = row.getInt("b");
    temp.add(color(r,g,b));
  }
  return temp;
}

//Metodo para obtener la lista de Circulos de cierto color
ArrayList<Circle> getCircles(int circleColor){
  //Se cargan los datos de la tabla de Excel
  Table CirclesData = loadTable("data//Nodes.csv","header");
  if (circleColor == 255)
      circleColor = 1;
  if (circleColor < 0 || circleColor > 1){
    println("SHAPES: Color not recognized as (0 : Black ) || (255|1 : White)");
    exit();
  }
  fill(circleColor*255);//fill(0,214,15,200);
  ArrayList<Circle> Circles = new ArrayList<Circle>(50);
  
  for(int i = 0; i < CirclesData.getRowCount();i++){
    TableRow row = CirclesData.getRow(i);
    int id = row.getInt("id");
    int c = row.getInt("Color");
    int xCenter = row.getInt("xCenter");
    int yCenter = row.getInt("yCenter");
    int radius = row.getInt("radius");
    if(c == circleColor){
      Circles.add(new Circle(id,xCenter,yCenter,radius,c));
    }
  }
  return Circles;
}
//Metodo para obtener las listas con Polígonos
ArrayList<Polygon> getPolygons(){
  //Se cargan los datos de la tabla de Excel
  Table PolyTable = loadTable("data/Polygons.csv","header");
  //Se crea la lista de Poligonos
  ArrayList<Polygon> temp = new ArrayList<Polygon>();
  String [] headers = {"Aid","Bid","Cid","Did"};
  
  for(int i = 0; i < PolyTable.getRowCount();i++){
      TableRow row = PolyTable.getRow(i);
      int sc = row.getInt("strokeColor");
      ArrayList<Circle> whiteOrBlackNodes = (sc == 1 ? WhiteCircles: BlackCircles);
      //Se toman los ID's de los Circulos
      int [] ids = new int[4];
      for(int h = 0; h < ids.length ; h++)
          ids[h] = row.getInt(headers[h]);
      //Se toman los Circulos con con los ID's obtenidos.
      Circle [] nodes = new Circle[4];
      for(Circle n : whiteOrBlackNodes)
        for(int j = 0; j < ids.length ; j++)
          if(n.id == ids[j])
            nodes[j] = n;
      //Se crea un nuevo polígono con el vector de nodos.
      temp.add(new Polygon(nodes));
    }
  return temp;
}
