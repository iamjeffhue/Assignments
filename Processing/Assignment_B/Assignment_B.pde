//import codeanticode.syphon.*;

//SyphonServer server;

import ddf.minim.*;

Minim minim;
AudioInput in;

float time = 0;

//void settings() {
  //size(640,640, P3D);
  //PJOGL.profile=1;
//}

void setup() {
  size(960, 540, P3D);
  //server = new SyphonServer(this, "Processing Syphon");
  background(0);
  //fullScreen(P3D);
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, width);
}
    
void draw() {
  background(0);
  fill(255);
  float x = 0;
  time += 0.002 + (in.left.get(1) *0.3);
  stroke(255,10+(in.left.get(1)*5000));

 for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(width * noise(x / 1000, time), height/2+noise(x / 10, time) + in.left.get(i)*150, i, height * noise(x / 100, time));
    x += 1;
  }
  //server.sendScreen();
}

//line code referenced from MASCARiLLA_F's ocean_v5 from OpenProcessing