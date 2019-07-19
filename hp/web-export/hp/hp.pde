// This sketch will be for the homepage of my desktop
/* @pjs preload="ax.jpg";*/

PImage bg;
float y=380;
String[] poem={"Greetings, greetings!","I cross through the frontal of demand, dancing, delighted and thankful.",
    "From outside, I arrived inside. From the view point, to the view, the viewer.",
    "Not in the shape of a plant, not in the shape of a butterfly,",
    "not in the shape of a rock, not in the shape of a pond-",
    "I was born in the shape of “US”, in the elegant shape of a human being",
    "To witness the rainbow of a butterfly in the plant’s flowering,",
    "To discern the pride of a mountain, and to hear the greatness of a sea",
    "To get to know my beliefs and ",
    "interpret the universe to the extent of my ambition and occasion.",
    "As an endeavor like this is beyond the ability of trees, birds,rocks and waterfalls.",
    "…","The opportunity was brief and the journey was backbreaking,",
    "But it was unique and needed nothing more.",
    "Parts of a poem by Ahmad Shamlou"};
void setup(){
  size(700,420);
  bg=loadImage("ax.jpg");
}
void draw(){
  tint(255, 127); 
  background(bg);
  fill(#F5A62F);
  textSize(18);
  for (int i = 0; i < poem.length; i = i+1) {
    if (y+(i*40)>300 ){
    text(poem[i],5,y+(i*40));  
  }}
  
  y=y-0.3;
  if ( y < -280){
     y=360;
  }
  
}

