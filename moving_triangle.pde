import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

import codeanticode.syphon.*;
SyphonServer server;

float radius = 30;

float x, y;
float prevX, prevY;
color c = color(0, 255, 0);
float angle = random(0, 255);

Boolean fade = true;

void setup()
{
  size( 640, 400, P3D );

  oscP5 = new OscP5(this, 5001);
  server = new SyphonServer(this, "Processing Syphon");

  background( 0 );
  stroke( 255 );

  x = width/2;
  y = height/2;

  prevX = x;
  prevY = y;

  stroke(100);
  strokeWeight( 5 );
  point( x, y );
}

void draw()
{
  if (fade) {
    noStroke();
    fill( 0, 4 );
    rect( 0, 0, width, height );
  }

  float angle = (TWO_PI / 6) * floor( random( 6 ));
  x += cos( angle ) * radius;
  y += sin( angle ) * radius;

  if ( x < 0 || x > width ) {
    x = prevX;
    y = prevY;
  }

  if ( y < 0 || y > height) {
    x = prevX;
    y = prevY;
  }

  stroke( c ); //line's color
  strokeWeight( 1 );
  line( x, y, prevX, prevY );

  strokeWeight( 3 );
  point( x, y );

  prevX = x;
  prevY = y;

  server.sendScreen();
}

void oscillate() {
  angle += 0.15;
}

void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/data")==true) {   
    // get the first value as an integer
    radius = theOscMessage.get(0).intValue();
    //float thirdValue = theOscMessage.get(1).floatValue();
    return;
  }

  if (theOscMessage.checkAddrPattern("/bang")==true) {
    fade = !fade;
  }

  if (theOscMessage.checkAddrPattern("/color")==true) {
    angle = random(255);
    c = color(random(255), 127+127*(sin(angle)), 127+127*(cos(angle)));
  }
  // get the third value as a string


  // print out the message
  print("OSC Message Recieved: ");
  print(theOscMessage.addrPattern() + " ");
  println(radius + " " + fade + " " );//+ thirdValue);
}
