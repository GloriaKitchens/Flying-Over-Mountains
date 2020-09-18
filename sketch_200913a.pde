int cols, rows;
int scale = 20;
int w = 1700;
int h = 1500;

float flying = 0;

float[][] terrain;
Terrain t;
Menu menu;

void settings() {
  size(800, 800, P3D);
  noSmooth(); 
}

void setup() {
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
  t = new Terrain(w, h);
  menu = new Menu(width, height);
}

void keyPressed() {
    float flyingX = 0;
    float flyingY = 0;
    if (keyCode == 0) return;
    switch(keyCode) {
       case UP: flyingY = -0.1f;
         break;
       case DOWN: flyingY = 0.1f;
         break;
       case LEFT: flyingX = -0.1f;
         break;
       case RIGHT: flyingX = 0.1f;
         break;
       case ' ': flyingX = 0;
                 flyingY = 0;
         break;
    }
    
    t.setFlying(flyingX, flyingY);
}

void draw() {
  keyPressed();
  background(0);
  if (menu.isEnabled()) {
    menu.show();
  } else {
    t.show();
  }
}
