float radius = 30; //length
 
float x, y;
float prevX, prevY;
 
Boolean fade = true;
 
void setup()
{
    size( 640, 400 );
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
     
    stroke( 136, 185, 19 ); //line's color
    strokeWeight( 1 );
    line( x, y, prevX, prevY );
     
    strokeWeight( 3 );
    point( x, y );
     
    prevX = x;
    prevY = y;
         
}
 
void keyPressed()
{
    if (key == 'f') {
        fade = !fade;
    }
}
