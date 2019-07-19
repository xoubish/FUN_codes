import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class click_udf extends PApplet {

PImage img;
Table table;
float bx;
float by;
int boxSize = 10;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0f; 
float yOffset = 0.0f; 

public void setup() {
  
  img = loadImage("udf_3color.jpg");  // Load the image into the program  
  table= loadTable("udf.csv"); //Load the table into the program
  bx = width/2.0f;
  by = height/2.0f;
  rectMode(RADIUS);  
}

public void draw() { 
  image(img, 0, 0);
  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(0xffFFFF79); 
      noFill();
    } 
  } else {
    stroke(0xff39F0FF);
    strokeWeight(5);
    noFill();
    overBox = false;
    textSize(25);
    //ra,dec,z,m,s=find_close(bx*2.18+10685,by*3.487+5705);
    text(str(bx*2.18f+10685)+','+str((-1*(by-790))*3.487f+5705), bx+12, by+2);
    fill(0xff39F0FF);
    noFill();
}
  
  // Draw the box
  rect(bx, by, boxSize, boxSize); 
}

//void find_close(x,y,table){
//  TableRow result = table.matchRow(x-X<,"X");
  
//}

public void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(319);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}

public void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}

public void mouseReleased() {
  locked = false;
}
  public void settings() {  size(1000, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "click_udf" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
