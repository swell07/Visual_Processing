//boolean exit, draws;
color[] colors = {
  color(255, 255, 125), 
  color(255, 255, 0), 
  color(125, 255, 255), 
  color(0, 255, 255), 
  color(255, 125, 255), 
  color(255, 0, 255)
};

void setup() {
  fullScreen();
  background(0);
}

void draw() {
}

void mousePressed() {
  //background(0);
  rectMode(CENTER);
  int i = int(random(6));
  fill(colors[i]);
  rect(mouseX, mouseY, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      background(0);
    } else {
      exit();
    }
  }
}
