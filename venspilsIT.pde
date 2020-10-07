ArrayList<Event> events = new ArrayList(); 
PImage bg;
int y; 
final int DUR = 1500;
 
int time = -1;
 
// car pos and velocity
int px=0, py=540, 
  dx=1, dy=0;
 
int centerX, centerY;
String remark="";
int current_i; 
boolean lightsOn=false; 
 
// the orientation of the car 
final int north = 0;
final int east  = 1; 
final int south = 2; 
final int west  = 3;
int orientation = east; 
 
float angleFrom, angleTo;
 
int myMillis;
 
//color backgroundColor=0; 
boolean itsNight=false;
 
// --------------------------------------------------------
 
void setup() {
  size(1017, 841);
  bg = loadImage("road.jpeg"); 
  
  //size(1500, 1000);
 
  noStroke();
  fill(200, 0, 0);
  rectMode(CENTER);
 
  //events.add(new Event(0, "go")); // event starts at zero and has a duration of 30
  events.add(new Event(0, "goRight"));       // event starts at 30 and has a duration of 2220
  events.add(new Event(6900, "turnLeft"));    // event starts at 2220 and has a duration of DUR (every rotation has that duration)
  events.add(new Event(6900+DUR, "goUp"));
  events.add(new Event(6900+DUR+8000, "reset"));
 
 
  myMillis=millis();
}
 
void draw() {
 
  background(bg);
 
  int myTime = millis() - myMillis; 
 
  fill(255, 0, 0); 
  text("Millis: "+myTime+", "+remark+" ("+current_i+")", 19, 19);
 
  if (orientation>3) //4=0 virziena zinja
    orientation = 0;
 
  for (int i=events.size()-1; i>=0; i--) {
    Event e = events.get(i); 
    if (myTime >= e.from) {
      if (i!=current_i) {
        execute1("init_"+e.doCmd);
      }
      current_i=i;
      remark=e.doCmd;
      execute1(e.doCmd);
      break;
    }//if
  }//for
  //
} //draw
 
//---------------------------------------------------------------------------
 
void execute1(String doCmd1) {
  //
  switch(doCmd1) {
 
  case "reset":
    myMillis=millis();
    px= 0;
    py= 540;
    rectMode(CENTER);
    orientation=east;
    break; 
 
  case "goRight":
    if (px > 6000){
      px = 0;
      py = 540;}
    px+=dx;
    py+=dy;
    
    orientation=east; 
    fill(200, 0, 0);//red
    rect(px, py, 40, 30);
    fill(255);
    //rect(px+20, py-14, 2, 2);
    //rect(px+20, py+14, 2, 2);
    break;
 
  case "goLeft":
    px+=dx;
    py+=dy;
    orientation=west; 
    fill(200, 0, 0);//red
    rect(px, py, 40, 30);
    fill(255);
    //rect(px+20, py-14, 2, 2);
    //rect(px+20, py+14, 2, 2);
    break; 
 
 /* case "init_background0":
  case "init_background255":*/
  case "init_reset":
  case "init_go":
  case "init_goRight":
  case "init_goLeft":
  case "init_goUp":
    //ignore
    break;
  case "goUp":
    px+=dx;
    py+=dy;
    orientation=north; 
    fill(200, 0, 0);//red
    rect(px, py, 30, 40);
    fill(255);
    break; 
 
  case "go":
    px+=dx;
    py+=dy;
    fill(200, 0, 0);//red
    rect(px, py, 30, 40);
    fill(255);
    break;
 
  case "init_turnRight":
    if (orientation==east) {
      centerX=px-0;
      centerY=py+100;
      angleFrom=  -HALF_PI; 
      angleTo=  0;
      dx=0;
      dy=1;
    } else if (orientation==south) {
      centerX=px-100;
      centerY=py+0;
      angleFrom=  0; 
      angleTo=  HALF_PI;
      println("south");
      dx=-1;
      dy=0;
    } else if (orientation==west) {
      centerX=px-0;
      centerY=py-100;
      angleFrom=  HALF_PI; 
      angleTo=  HALF_PI+HALF_PI;
      println("west");
      dx=0;
      dy=-1;
    } else if (orientation==north) {
      centerX=px+100;
      centerY=py-0;
      angleFrom=  HALF_PI+HALF_PI; 
      angleTo= HALF_PI+HALF_PI+HALF_PI;
      println("north");
      dx=1;
      dy=0;
    } 
    time=millis(); 
    orientation++;
    break; 
 
  case "init_turnLeft":
      if (orientation==east) {
      centerX=px-0;
      centerY=py-100;
      angleFrom=  -HALF_PI; //-HALF_PI; 
      angleTo=  +HALF_PI+HALF_PI; //0
      dx=0;
      dy=-1;
    } else if (orientation==south) {
      centerX=px+100;
      centerY=py+0;
      angleFrom=  0; //0; 
      angleTo=  HALF_PI+HALF_PI+HALF_PI;//HALF_PI;
      println("south");
      dx=0;
      dy=1;
    } else if (orientation==west) {
      centerX=px-0;
      centerY=py+100;
      angleFrom=  HALF_PI;//HALF_PI; 
      angleTo= 0; //HALF_PI+HALF_PI;
      println("west");
      dx=1;
      dy=0;
    } else if (orientation==north) {
      centerX=px-100;
      centerY=py-0;
      angleFrom=  HALF_PI+HALF_PI;//HALF_PI+HALF_PI; 
      angleTo= HALF_PI;//HALF_PI+HALF_PI+HALF_PI;
      println("north");
      dx=-1;
      dy=0;
    } 
    time=millis(); 
    orientation++;
    break; 
    
   /* centerX=px+100;
    centerY=py-0;
    time=millis(); 
    orientation--;
    break; */
 
  case "turnRight":
    translate (centerX, centerY);
    rotate(map((millis()-time)%DUR, 
      0, DUR, 
      angleFrom, angleTo));
    fill(200, 0, 0);//red
    rect(100, 0, 30, 40); //  
    px=int(screenX(100, 0));
    py=int(screenY(100, 0));
    break;
 
  case "turnLeft":
    // facing south
    //dx=0;
    //dy=1; 
    translate (centerX, centerY);
    rotate(map((millis()-time)%DUR, 
      0, DUR, 
      HALF_PI, 0));
    fill(200, 0, 0);//red
    rect(100, 0, 30, 40); // 
    px=int(screenX(100, 0));
    py=int(screenY(100, 0));
    break;
 
  case "lightsOn":
    lightsOn=true; 
    break; 
 
  case "lightsOff":
    lightsOn=false; 
    break;
 
  default:
    println("not found "
      +doCmd1);
    exit(); 
    break;
  }//switch
}//func 
 
//=========================================
 
class Event {
 
  int from; 
  String doCmd;
 
  //constr
  Event(int millis1_, String cmd_) {
    from  = millis1_; 
    doCmd = cmd_;
  }//constr
}//class
 
//=========================================
