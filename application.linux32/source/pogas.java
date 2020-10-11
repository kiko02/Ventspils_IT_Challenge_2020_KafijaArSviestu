import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pogas extends PApplet {


ControlP5 controlP5;
PImage bg;
int cars = 0;
int cars1 = 0;
int cars2 = 0;
int krust=1;
float minV=0.05f;
int masinasProc;
int autobusiProc;
int masinasCil;
int autobusiCil;
int atst;
long f=0;
int start0=0;
float[][] carmas = new float[1000][10];
float[][] carmas1 = new float[1000][10];
float[][] carmas2 = new float[1000][10];
public void setup() {
  
  frameRate(120);
  noStroke();
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
    .setCaptionLabel("Car %")
    .setDecimalPrecision(0)
    .setRange(0, 100)
    .setValue(50)
    .setPosition(600, 80)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider2")
    .setCaptionLabel("Bus %")
    .setDecimalPrecision(0)
    .setRange(0, 100)
    .setValue(50)
    .setPosition(600, 110)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider3")
    .setCaptionLabel("People per car")
    .setDecimalPrecision(1)
    .setRange(1, 5)
    .setValue(2)
    .setPosition(600, 140)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider4")
    .setCaptionLabel("People per bus")
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
    .setPosition(600, 200)
    .setSize(60, 30); 

  controlP5.addButton("b2")
    .setValue(0)
    .setCaptionLabel("stop")
    .setPosition(680, 200)
    .setSize(60, 30); 

  /*controlP5.addButton("b3")
    .setValue(0)
    .setCaptionLabel("reset")
    .setPosition(760, 200)
    .setSize(60, 30); 
  */
  
  bg = loadImage("road.jpeg"); 
  fill(200, 0, 0);
  rectMode(CENTER);
  //delay(10);
}
public void makecar(int v) {
  switch(v) {

  case 0:
    //carmas[cars] = new int[5];
    carmas[cars][0]=0;
    carmas[cars][1]=-50;
    carmas[cars][2]=540;
    carmas[cars][3]=1;
    carmas[cars][4]=0;
    carmas[cars][5]=0;
    if (random(100)>=masinasProc) {
      carmas[cars][5]=1;
    }
    cars++;
    break;

  case 1:
    //carmas[cars] = new int[5];
    carmas1[cars1][0]=1;
    carmas1[cars1][1]=1070;
    carmas1[cars1][2]=495;
    carmas1[cars1][3]=-1;
    carmas1[cars1][4]=0;
    carmas1[cars1][5]=0;
    if (random(100)>=masinasProc) {
      carmas1[cars1][5]=1;
    }
    cars1++;
    break;

  case 2:
    //carmas[cars] = new int[5];
    carmas2[cars2][0]=2;
    carmas2[cars2][1]=450;
    carmas2[cars2][2]=-50;
    carmas2[cars2][3]=0;
    carmas2[cars2][4]=1;
    carmas2[cars2][5]=0;
    if (random(100)>=masinasProc) {
      carmas2[cars2][5]=1;
    }
    cars2++;
    break;
  }
}

public void draw() {
  background(bg);
  
  f++;
  if (start0==1) {
    if (cars==0) {
      makecar(0);
      makecar(1);
      makecar(2); 
    }
    if (carmas[cars-1][1]>50) {
      makecar(0);
    }
    if (carmas1[cars1-1][1]<1017-50) {
      makecar(1);
    }
    if (carmas2[cars2-1][2]>50) {
      makecar(2);
    }
    for (int i=0; i<cars; i++) {
      if (krust!=0) {
        if (390-carmas[i][1]<100) {
          carmas[i][3]=(390-carmas[i][1])/100;
        }
      }

      if (i!=0) {
        //if (carmas[i-1][1]-carmas[i][1]<100) {
        if (carmas[i][5]==0&&carmas[i-1][5]==0) {
          atst=60;
        }
        if (carmas[i][5]==0&&carmas[i-1][5]==1) {
          atst=70;
        }
        if (carmas[i][5]==1&&carmas[i-1][5]==1) {
          atst=80;
        }
        if (carmas[i][5]==1&&carmas[i-1][5]==0) {
          atst=70;
        }
        if ((carmas[i-1][1]-carmas[i][1]-atst)/75>1) {
          carmas[i][3]=1;
        } else if ((carmas[i-1][1]-carmas[i][1]-atst)/75<minV) {
          carmas[i][3]=0;
        } else {
          carmas[i][3]=(carmas[i-1][1]-carmas[i][1]-atst)/75;
        }

        //}
      }  
      if (carmas[i][1]>1050) {
        carmas[i][1]=10000;
      }
      if (carmas[i][1]<1100) {
        carmas[i][1]+=carmas[i][3];
      }

      if (carmas[i][5]==0) {
        fill(255, 10, 10);
        rect(carmas[i][1], carmas[i][2], 40, 25, 5);
      }
      if (carmas[i][5]==1) {
        fill(255, 140, 0);
        rect(carmas[i][1], carmas[i][2], 70, 30, 5);
      }
    }
    for (int i=0; i<cars1; i++) {
      if (krust!=0) {
        if (carmas1[i][1]-565<100) {
          carmas1[i][3]=-1*(carmas1[i][1]-565)/100;
        }
      }
      if (i!=0) {
        //if (carmas1[i][1]-carmas1[i-1][1]<100) {
          if (carmas1[i][5]==0&&carmas1[i-1][5]==0) {
            atst=60;
          }
          if (carmas1[i][5]==0&&carmas1[i-1][5]==1) {
            atst=70;
          }
          if (carmas1[i][5]==1&&carmas1[i-1][5]==1) {
            atst=80;
          }
          if (carmas1[i][5]==1&&carmas1[i-1][5]==0) {
            atst=70;
          }

          if ((carmas1[i][1]-carmas1[i-1][1]-atst)/75>1) {
            carmas1[i][3]=-1;
          } else if ((carmas1[i][1]-carmas1[i-1][1]-atst)/75<minV) {
            carmas1[i][3]=0;
          } else {
            carmas1[i][3]=-1*(carmas1[i][1]-carmas1[i-1][1]-atst)/75;
          }
        //}
      }



      if (carmas1[i][1]<-80) {
        carmas1[i][1]=-1000;
      }
      if (carmas1[i][1]>-100) {
        carmas1[i][1]+=carmas1[i][3];
      }

      if (carmas1[i][5]==0) {
        fill(255, 10, 10);
        rect(carmas1[i][1], carmas1[i][2], 40, 25, 5);
      }
      if (carmas1[i][5]==1) {
        fill(255, 140, 0);
        rect(carmas1[i][1], carmas1[i][2], 70, 30, 5);
      }
    }

    for (int i=0; i<cars2; i++) {
      if (krust!=0) {
        if (450-carmas2[i][2]<100) {
          carmas2[i][4]=(440-carmas2[i][2])/100;
        }
      }
      if (i!=0) {
        //if (carmas2[i-1][2]-carmas2[i][2]<100) {
          if (carmas2[i][5]==0&&carmas2[i-1][5]==0) {
            atst=60;
          }
          if (carmas2[i][5]==0&&carmas2[i-1][5]==1) {
            atst=70;
          }
          if (carmas2[i][5]==1&&carmas2[i-1][5]==1) {
            atst=80;
          }
          if (carmas2[i][5]==1&&carmas2[i-1][5]==0) {
            atst=70;
          }
          if ((carmas2[i-1][2]-carmas2[i][2]-atst)/75>1) {
            carmas2[i][4]=1;
          } else if ((carmas2[i-1][2]-carmas2[i][2]-atst)/75<minV) {
            carmas2[i][4]=0;
          } else {
            carmas2[i][4]=(carmas2[i-1][2]-carmas2[i][2]-atst)/75;
          }
        //}
      }




      if (carmas2[i][2]<800) {
        carmas2[i][2]+=carmas2[i][4];
      }

      if (carmas2[i][5]==0) {
        fill(255, 10, 10);
        rect(carmas2[i][1], carmas2[i][2], 25, 40, 5);
      }
      if (carmas2[i][5]==1) {
        fill(255, 140, 0);
        rect(carmas2[i][1], carmas2[i][2], 30, 70, 5);
      }
    }
  }
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName()=="slider2") {
    int value = ceil(theEvent.getController().getValue());

    if (controlP5.getController("slider1") != null) {
      controlP5.getController("slider1").setBroadcast(false);
      controlP5.getController("slider2").setBroadcast(false);
      controlP5.getController("slider1").setValue(100.1f-value);
      controlP5.getController("slider2").setValue(value+0.1f);
      controlP5.getController("slider1").setBroadcast(true);
      controlP5.getController("slider2").setBroadcast(true);
      masinasProc= round(100.1f-value);
      autobusiProc = round(value);
    }
  }
  if (theEvent.getController().getName()=="slider1") {
    int value = ceil(theEvent.getController().getValue());

    if (controlP5.getController("slider2") != null) {
      controlP5.getController("slider1").setBroadcast(false);
      controlP5.getController("slider2").setBroadcast(false);
      controlP5.getController("slider2").setValue(100.1f-value);
      controlP5.getController("slider1").setValue(value+0.1f);
      controlP5.getController("slider1").setBroadcast(true);
      controlP5.getController("slider2").setBroadcast(true);
      masinasProc= round(value);
      autobusiProc = round(100.1f-value);
    }
  }
  if (theEvent.getController().getName()=="slider3") {
    int value = ceil(theEvent.getController().getValue()*10);
    masinasCil=value;
    controlP5.getController("slider3").setBroadcast(false);
    controlP5.getController("slider3").setValue(value/10.0f+0.01f);
    controlP5.getController("slider3").setBroadcast(true);
  }
  if (theEvent.getController().getName()=="slider4") {
    int value = ceil(theEvent.getController().getValue()*10);
    autobusiCil=value;
    controlP5.getController("slider4").setBroadcast(false);
    controlP5.getController("slider4").setValue(value/10.0f+0.01f);
    controlP5.getController("slider4").setBroadcast(true);
  }
  if (theEvent.getController().getName()=="b1"&&f>30) {
    f=0;
    start0=1;
  }
  if (theEvent.getController().getName()=="b2"&&f>30) {
    carmas[0][3]=0;
    carmas1[0][3]=0;
    
     cars=0;
     cars1=0;
     cars2=0;
     start0=0;
     
  }
  
  /*if (theEvent.getController().getName()=="b3"&&f>30) {
    carmas[0][3]=1;
    carmas1[0][3]=-1;
  }*/
  
  
  /*print(masinasProc);
   print(" ");
   print(autobusiProc);
   print(" ");
   print(masinasCil);
   print(" ");
   println(autobusiCil);
   */
  //println(start0);
}

  public void settings() {  size(1017, 841); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pogas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
