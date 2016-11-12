import peasy.*;

import oscP5.*;
import netP5.*;

PeasyCam cam;

int LENGTH = 50;
int DEG = 2;
int clock = 0;
int ith = 0;
int faceTurn = 0;
boolean switch1 = false;
String operation = new String();
String solution = new String();

Cube theCube;

OscP5 oscP5;
NetAddress SCAddr;

void setup(){
  size(500, 500, P3D);

  // CAM
  cam = new PeasyCam(this, width/2, height/2, 0, 350);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(600);
  theCube = new Cube();

  // OSC
  oscP5 = new OscP5(this,12000);
  SCAddr = new NetAddress("127.0.0.1",57120);
  oscP5.plug(this,"send","/test");
}

public void send(int msg){
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(msg); /* add an int to the osc message */
  /* send the message */
  oscP5.send(myMessage, SCAddr); 
}

void draw(){
  background(0);//For dynamically updating the background to eliminate the shadow.
  translate(width/2, height/2);
  rotateX(-0.5);
  rotateY(0.5);
    theCube.display();
    theCube.singleTwist();
}

void keyPressed(){
  if(clock==0){
    if(key=='1') {faceTurn=1;}
    if(key=='2') {faceTurn=2;}
    if(key=='3') {faceTurn=3;}
    if(key=='4') {faceTurn=4;}
    if(key=='5') {faceTurn=5;}
    if(key=='6') {faceTurn=6;}
  }
}


void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  theCube.tellVector();
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(mouseX); /* add an int to the osc message */
  /* send the message */
  oscP5.send(myMessage, SCAddr); 
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}




