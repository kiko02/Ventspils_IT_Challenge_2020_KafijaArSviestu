import controlP5.*;
ControlP5 controlP5;
PImage bg;
///////////////CAR/////////////////////////
int cars = 0;
int cars1 = 0;
int cars2 = 0;
int cars3 = 0;
int cars4 = 0;
int cars5 = 0;
//first car
int carsfirst = 0;
int carspk=0;
int cars1first = 0;
int cars1pk=0;
int cars2first = 0;
int cars2pk=0;
//random for car generation
int rand1=20;
int rand2=20;
int rand3=20;
//needed for something or other
float busslower=0.2;
int krust=1;
int atst;
float pienk=10;
int griezas=0;
float oldspeed;
/////////////////CAR ARRAYS///////////////////////////
float[][] carmas  = new float[1000][12];
float[][] carmas1 = new float[1000][12];
float[][] carmas2 = new float[1000][12];
float[][] carmas3 = new float[1000][12];
float[][] carmas4 = new float[1000][12];
float[][] carmas5 = new float[1000][12];
float[][] carmasP = new float[10][12];
/////////////////slider///////////////////////////////
int masinasProc;
int autobusiProc;
int masinasCil;
int autobusiCil;
/////////////////program//////////////////////////////
long f=0;
int start0=0;

void setup() {
  size(1017, 841);
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
    .setValue(51)
    .setPosition(600, 80)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider2")
    .setCaptionLabel("Bus %")
    .setDecimalPrecision(0)
    .setRange(0, 100)
    .setValue(49)
    .setPosition(600, 110)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider3")
    .setCaptionLabel("People per car")
    .setDecimalPrecision(1)
    .setRange(1, 5)
    .setValue(1.9)
    .setPosition(600, 140)
    .setSize(200, 20)
    .setColorValue(0xff000000)
    .setColorLabel(0xff000000);

  controlP5.addSlider("slider4")
    .setCaptionLabel("People per bus")
    .setDecimalPrecision(1)
    .setRange(1, 45)
    .setValue(19.9)
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

  controlP5.addButton("b3")
    .setValue(0)
    .setCaptionLabel("reset")
    .setPosition(760, 200)
    .setSize(60, 30); 


  bg = loadImage("road.jpeg"); 
  fill(200, 0, 0);
  rectMode(CENTER);
  //delay(10);
}
void makecar(int v) {
  switch(v) {

  case 0:
    //carmas[cars] = new int[5];
    carmas[cars][0]=0;     //unused indicator
    carmas[cars][1]=-50;   //x
    carmas[cars][2]=540;   //y
    carmas[cars][8]=0.9+random(20)/100.0;     //maxv
    carmas[cars][3]=carmas[cars][8];     //dx
    carmas[cars][4]=0;     //dy
    carmas[cars][5]=0;     //t/l type
    carmas[cars][6]=1;     //show?
    carmas[cars][7]=0.02+random(50)/1000.0;  //minv
    if(cars==0){
      carmas[cars][9]=round(random(1));  //pagrieziens
    }else{
      carmas[cars][9]=carmas[cars-1][9]+round(random(1));
      if(carmas[cars][9]==2){
        carmas[cars][9]=0;
      }
    }
    if (random(100)>=masinasProc) {
      carmas[cars][5]=1;
      carmas[cars][8]-=busslower;
    }
    cars++;
    break;

  case 1:
    //carmas[cars] = new int[5];
    carmas1[cars1][0]=1;    //unused indicator
    carmas1[cars1][1]=1070; //x
    carmas1[cars1][2]=495;  //y
    carmas1[cars1][8]=0.9+random(20)/100.0;    //maxv
    carmas1[cars1][3]=-1*carmas1[cars1][8];   //dx
    carmas1[cars1][4]=0;    //dy
    carmas1[cars1][5]=0;    //t/l type
    carmas1[cars1][6]=1;    //show?
    carmas1[cars1][7]=0.02+random(50)/1000.0; //minv
    carmas1[cars1][9]=round(random(1));  //pagrieziens
    if (random(100)>=masinasProc) {
      carmas1[cars1][5]=1;
      carmas1[cars1][8]-=busslower;
    }
    cars1++;
    break;

  case 2:
    //carmas[cars] = new int[5];
    carmas2[cars2][0]=2;    //unused indicator
    carmas2[cars2][1]=455;  //x
    carmas2[cars2][2]=-50;  //y
    carmas2[cars2][8]=0.9+random(20)/100.0;      //maxv
    carmas2[cars2][3]=0;    //dx
    carmas2[cars2][4]=carmas2[cars2][8];    //dy
    carmas2[cars2][5]=0;    //t/l type
    carmas2[cars2][6]=1;    //show?
    carmas2[cars2][7]=0.02+random(50)/1000.0;   //minv
    carmas2[cars2][9]=round(random(1));  //pagrieziens
    if (random(100)>=masinasProc) {
      carmas2[cars2][5]=1;
      carmas2[cars2][8]-=busslower;
    }
    cars2++;
    break;
  }
}

void makecar2(int v, int m) {


  switch(v) {

  case 0:
    carmas3[cars3][0]=0;    //unused indicator
    carmas3[cars3][1]=0; //x
    carmas3[cars3][2]=0;  //y
    carmas3[cars3][8]=carmas[m][8];    //maxv
    carmas3[cars3][3]=0;    //dx
    carmas3[cars3][4]=0;    //dy
    carmas3[cars3][5]=0;    //t/l type
    carmas3[cars3][6]=1;    //show?
    carmas3[cars3][7]=carmas[m][7]; //minv
    carmas3[cars3][5]=carmas[m][5];

    cars3++;
    break;

  case 1:
    //carmas[cars] = new int[5];
    carmas1[cars1][0]=1;
    carmas1[cars1][1]=1070;
    carmas1[cars1][2]=495;
    carmas1[cars1][3]=-1;
    carmas1[cars1][4]=0;
    carmas1[cars1][5]=0;
    carmas1[cars1][6]=1;
    if (random(100)>=masinasProc) {
      carmas1[cars1][5]=1;
    }
    cars1++;
    break;

  case 2:
    //carmas[cars] = new int[5];
    carmas2[cars2][0]=2;
    carmas2[cars2][1]=455;
    carmas2[cars2][2]=-50;
    carmas2[cars2][3]=0;
    carmas2[cars2][4]=1;
    carmas2[cars2][5]=0;
    carmas2[cars2][6]=1;
    if (random(100)>=masinasProc) {
      carmas2[cars2][5]=1;
    }
    cars2++;
    break;
  }
}

void krustF() {
  int c=0;
  c=round(carmas[carsfirst][9]+(carmas1[cars1first][9]*2)+(carmas2[cars2first][9]*4));
  println(c);
  carspk=0;
  cars1pk=0;
  cars2pk=0;
  //print(carmas[carsfirst][9]);
  //print(" ");
  //print(carmas1[cars1first][9]);
  //print(" ");
  //print(carmas2[cars2first][9]);
  //println(" ");

  switch(c) {
  case 0:
    griezas=2;
    carmas[carsfirst][1]=1000;
    carmas[carsfirst][6]=0;

    carmas1[cars1first][1]=-100;
    carmas1[cars1first][6]=0;
    break;
  case 1:
    griezas=1;
    carmas2[cars2first][2]=1000;
    carmas2[cars2first][6]=0;
    break;
  case 2:
    griezas=3;
    carmas[carsfirst][1]=1000;
    carmas[carsfirst][6]=0;
    carmas1[cars1first][1]=-100;
    carmas1[cars1first][6]=0;
    carmas2[cars2first][2]=1000;
    carmas2[cars2first][6]=0;
    break;
  case 3:
    griezas=2;
    carmas1[cars1first][1]=-100;
    carmas1[cars1first][6]=0;
    carmas2[cars2first][2]=1000;
    carmas2[cars2first][6]=0;
    break;
  case 4:
    griezas=2;
    carmas[carsfirst][1]=1000;
    carmas[carsfirst][6]=0;
    carmas2[cars2first][2]=1000;
    carmas2[cars2first][6]=0;
    break;
  case 5:
    griezas=1;
    carmas[carsfirst][1]=1000;
    carmas[carsfirst][6]=0;
    break;
  case 6:
    griezas=2;
    carmas[carsfirst][1]=1000;
    carmas[carsfirst][6]=0;
    carmas2[cars2first][2]=1000;
    carmas2[cars2first][6]=0;
    break;
  case 7:
    griezas=1;
    carmas1[cars1first][1]=-100;
    carmas1[cars1first][6]=0;
    break;
  }
  griezas=0;//FOR TESTING NEED TO REMOVE
}
void pagF(int i){
  fill(255, 10, 10);
  rect(100, 100, 40, 25, 5);
}


void draw() {
  background(bg);
  if (carspk==1&&cars1pk==1&&cars2pk==1) {
    //krust();
  }
  println(carmas[1][1]);
  f++;
  if (start0==1) {
    if (cars==0) {
      makecar(0);
      makecar(1);
      makecar(2);
    }
    if (carmas[cars-1][1]>(40+rand1)) {
      makecar(0);

      rand1=round(random(100));
    }
    if (carmas1[cars1-1][1]<1017-(40+rand2)) {
      makecar(1);
      rand2=round(random(100));
    }
    if (carmas2[cars2-1][2]>(40+rand3)) {
      makecar(2);
      rand3=round(random(100));
    }
    for (int i=0; i<griezas; i++){
      pagF(i);
    }
    for (int i=0; i<cars; i++) {

      if (carmas[i][6]==1) {
        oldspeed=carmas[i][3];
        if (i==0) {
          carmas[i][3]+=(carmas[i][8]-carmas[i][3])/120;
          if (carmas[i][3]>carmas[i][8]) {
            carmas[i][3]=carmas[i][8];
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
            carmas[i][3]=carmas[i][8];
          } else if ((carmas[i-1][1]-carmas[i][1]-atst)/75<carmas[i][7]) {
            carmas[i][3]=0;
          } else {
            carmas[i][3]=((carmas[i-1][1]-carmas[i][1]-atst)/75)*carmas[i][8];
          }
        }  
        if (krust!=0) {
          pienk=10;
          if (carmas[i][5]==0) {
            atst=390;
          }
          if (carmas[i][5]==1) {
            atst=375;
          } 
          if (atst-carmas[i][1]<100) {
            pienk=abs(atst-carmas[i][1])/100;
            
          }
          carmas[i][3]=min(pienk, carmas[i][3]);
        }
         
        if(carmas[i][3]<carmas[i][7]){
          carmas[i][3]=0.0001;
        }
        if(carmas[i][3]>carmas[i][8]){
          carmas[i][3]=carmas[i][8];
        }
         if(oldspeed<carmas[i][3]){
           if(carmas[i][3]-oldspeed>0.02){
             carmas[i][3]=oldspeed+0.02;
             if(carmas[i][3]>carmas[i][8]/1.5){
               carmas[i][3]=carmas[i][8]/1.5;
             }
           }
         }

        if (carmas[i][1]>1050) {
          carmas[i][1]=10000;
          carmas[i][6]=0;
        }
        if (carmas[i][1]<1100&&carmas[i][3]>0.002) {
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
      if (carmas[i][1]>360) {
        carsfirst=i;
        carspk=1;
      }
    }

    for (int i=0; i<cars1; i++) {
      if (carmas1[i][6]==1) {
        oldspeed=carmas1[i][3];
        if (i==0) {
          carmas1[i][3]-=abs(abs(carmas1[i][3])-abs(carmas1[i][8]))/120;
          if (carmas1[i][3]<(-1*carmas1[i][8])) {
            carmas1[i][3]=(-1*carmas1[i][8]);
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
            carmas1[i][3]=-1*carmas1[i][8];
          } else if ((carmas1[i][1]-carmas1[i-1][1]-atst)/75<carmas1[i][7]) {
            carmas1[i][3]=0;
          } else {
            carmas1[i][3]=(-1*(carmas1[i][1]-carmas1[i-1][1]-atst)/75)*carmas1[i][8];
          }
          //}
        }

        if (krust!=0) {
          pienk=-10;
          if (carmas1[i][5]==0) {
            atst=570;
          }
          if (carmas1[i][5]==1) {
            atst=585;
          }
          if (carmas1[i][1]-atst<100) {
            pienk=-1*(abs(carmas1[i][1]-atst)/100);
          }
          carmas1[i][3]=-1*min(abs(pienk), abs(carmas1[i][3]));
        }

        if(abs(carmas1[i][3])<carmas1[i][7]){
          carmas1[i][3]=-0.001;
        }
        if(abs(carmas1[i][3])>carmas1[i][8]){
          carmas1[i][3]=-1*carmas1[i][8];
        }
         if(oldspeed>carmas1[i][3]){
           if(abs(carmas1[i][3]-oldspeed)>0.02){
             carmas1[i][3]=oldspeed-0.02;
             if(abs(carmas1[i][3])>carmas1[i][8]/1.5){
               carmas1[i][3]=-1*(carmas1[i][8]/1.5);
             }
           }
         }

        if (carmas1[i][1]<-80) {
          carmas1[i][1]=-1000;
          carmas1[i][6]=0;
        }
        if (carmas1[i][1]>-100&&carmas1[i][3]<(-0.002)) {
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
      if (carmas1[i][1]<595) {
        cars1first=i;
        cars1pk=1;
      }
    }

    for (int i=0; i<cars2; i++) {
      if (carmas2[i][6]==1) {
        oldspeed=carmas2[i][4];
        if (i==0) {
          carmas2[i][4]+=(carmas2[i][8]-carmas2[i][4])/120;
          if (carmas2[i][4]>carmas2[i][8]) {
            carmas2[i][4]=carmas2[i][8];
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
            carmas2[i][4]=carmas2[i][8];
          } else if ((carmas2[i-1][2]-carmas2[i][2]-atst)/75<carmas2[i][7]) {
            carmas2[i][4]=0;
          } else {
            carmas2[i][4]=((carmas2[i-1][2]-carmas2[i][2]-atst)/75)*carmas2[i][8];
          }
          //}
        }

        if (krust!=0) {
          pienk=10;
          if (carmas2[i][5]==0) {
            atst=440;
          }
          if (carmas2[i][5]==1) {
            atst=425;
          }
          if (atst-carmas2[i][2]<100) {
            pienk=abs(atst-carmas2[i][2])/100;
          }
          carmas2[i][4]=min(pienk, carmas2[i][4]);
        }

         if(carmas2[i][3]<carmas2[i][7]){
          carmas2[i][3]=0.0001;
        }
        if(carmas2[i][3]>carmas2[i][8]){
          carmas2[i][3]=carmas2[i][8];
        }
         if(oldspeed<carmas2[i][3]){
           if(carmas2[i][3]-oldspeed>0.02){
             carmas2[i][3]=oldspeed+0.02;
             if(carmas2[i][3]>carmas2[i][8]/1.5){
               carmas2[i][3]=carmas2[i][8]/1.5;
             }
           }
         }

        if (carmas2[i][2]>790) {
          carmas2[i][2]=1000;
          carmas2[i][6]=0;
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
      if (carmas2[i][2]>410) {
        cars2first=i;
        cars2pk=1;
      }
    }
    /*print(carsfirst);
    print(" ");
    print(carspk);
    print(" ");
    print(cars1first);
    print(" ");
    print(cars1pk);
    print(" ");
    print(cars2first);
    print(" ");
    println(cars2pk);*/
    if (griezas==0) {
      if (carmas[carsfirst][3]<0.2&&carspk==1) {
        if (carmas1[cars1first][3]>-0.2&&cars1pk==1) {
          if (carmas2[cars2first][4]<0.2&&cars1pk==1) {
            griezas=3;
            krustF();
          }
        }
      }
    }
  }
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
  if (theEvent.getController().getName()=="b1"&&f>30) {
    f=0;
    start0=1;
    griezas=0;
  }
  if (theEvent.getController().getName()=="b2"&&f>30) {
    carmas[0][3]=0;
    carmas1[0][3]=0;

    cars=0;
    cars1=0;
    cars2=0;
    start0=0;
  }

  if (theEvent.getController().getName()=="b3"&&f>30) {
    if (krust==1) {
      krust=0;
    } else {
      krust=1;
    }
    //carmas2[0][2]=1000;
  }


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
