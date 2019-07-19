PImage img;
Table table;
float bx;
float by;
int boxSize = 10;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(1000, 800);
  img = loadImage("udf_3color.jpg");  // Load the image into the program  
  table= loadTable("udf.csv"); //Load the table into the program
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() { 
  image(img, 0, 0);
  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(#FFFF79); 
      noFill();
    } 
  } else {
    stroke(#39F0FF);
    strokeWeight(5);
    noFill();
    overBox = false;
    textSize(25);
    //ra,dec,z,m,s=find_close(bx*2.18+10685,by*3.487+5705);
    text(str(bx*2.18+10685)+','+str((-1*(by-790))*3.487+5705), bx+12, by+2);
    fill(#39F0FF);
    noFill();
}
  
  // Draw the box
  rect(bx, by, boxSize, boxSize); 
}

//void find_close(x,y,table){
//  TableRow result = table.matchRow(x-X<,"X");
  
//}

void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(319);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}