import controlP5.*;
ControlP5 controlP5;
PImage bg;
int masinasProc;
int autobusiProc;
int masinasCil;
int autobusiCil;
void setup() {
  size(1017, 841);

  controlP5 = new ControlP5(this);
  // change the default font to Verdana
  PFont p = createFont("Verdana", 16); 
  ControlFont font = new ControlFont(p);

  // change the original colors
  controlP5.setColorForeground(0xffffffff);
  controlP5.setColorBackground(0xffaaaaaa);
  controlP5.setFont(font);
  controlP5.setColorActive(0xffffffff);

  controlP5.addSlider("slider1")
    .setCaptionLabel("Mašīnas %")
    .setDecimalPrecision(0)
    .setRange(0, 100)
    .setValue(50)
    .setPosition(600, 80)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider2")
    .setCaptionLabel("Autobusi %")
    .setDecimalPrecision(0)
    .setRange(0, 100)
    .setValue(50)
    .setPosition(600, 110)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);
    
   controlP5.addSlider("slider3")
    .setCaptionLabel("Cilvēki mašīnā")
    .setDecimalPrecision(1)
    .setRange(1, 5)
    .setValue(2)
    .setPosition(600, 140)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);
    
   controlP5.addSlider("slider4")
    .setCaptionLabel("Cilvēki autobusā")
    .setDecimalPrecision(1)
    .setRange(1, 45)
    .setValue(20)
    .setPosition(600, 170)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addButton("b1")
   .setValue(0)
   .setCaptionLabel("start")
   .setPosition(600,200)
   .setSize(60,30); 
   
  controlP5.addButton("b2")
   .setValue(0)
   .setCaptionLabel("stop")
   .setPosition(680,200)
   .setSize(60,30); 
   
  bg = loadImage("road.jpeg"); 



  noStroke();
  fill(200, 0, 0);
  rectMode(CENTER);
  delay(10);
}

void draw() {
  background(bg);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName()=="slider2") {
    int value = ceil(theEvent.getController().getValue());
    
    if (controlP5.getController("slider1") != null) {
      controlP5.getController("slider1").setBroadcast(false);
      controlP5.getController("slider2").setBroadcast(false);
      controlP5.getController("slider1").setValue(100.1-value);
      controlP5.getController("slider2").setValue(value+0.1);
      controlP5.getController("slider1").setBroadcast(true);
      controlP5.getController("slider2").setBroadcast(true);
      masinasProc= round(100.1-value);
      autobusiProc = round(value);
      
    }
  }
  if (theEvent.getController().getName()=="slider1") {
    int value = ceil(theEvent.getController().getValue());
    
    if (controlP5.getController("slider2") != null) {
      controlP5.getController("slider1").setBroadcast(false);
      controlP5.getController("slider2").setBroadcast(false);
      controlP5.getController("slider2").setValue(100.1-value);
      controlP5.getController("slider1").setValue(value+0.1);
      controlP5.getController("slider1").setBroadcast(true);
      controlP5.getController("slider2").setBroadcast(true);
      masinasProc= round(value);
      autobusiProc = round(100.1-value);
      
    }
  }
  if (theEvent.getController().getName()=="slider3") {
    int value = ceil(theEvent.getController().getValue()*10);
    masinasCil=value;
    controlP5.getController("slider3").setBroadcast(false);
    controlP5.getController("slider3").setValue(value/10.0+0.01);
    controlP5.getController("slider3").setBroadcast(true);
  }
  if (theEvent.getController().getName()=="slider4") {
    int value = ceil(theEvent.getController().getValue()*10);
    autobusiCil=value;
    controlP5.getController("slider4").setBroadcast(false);
    controlP5.getController("slider4").setValue(value/10.0+0.01);
    controlP5.getController("slider4").setBroadcast(true);
  }
  print(masinasProc);
  print(" ");
  print(autobusiProc);
  print(" ");
  print(masinasCil);
  print(" ");
  println(autobusiCil);
  
}
