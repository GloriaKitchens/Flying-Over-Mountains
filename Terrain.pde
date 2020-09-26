class Terrain {
  int cols, rows;
  int scale = 20;
  
  int c = 255;
  int cSpeed = 1;

  int zDepth = -100;
  int zHeight = 100;
  float flyingX = 0;
  float flyingY = 0;
  float terrain[][];
  color colorTerrain[][];
  
  Terrain(int w, int h) {
    cols = w / scale;
    rows = h / scale;
    terrain = new float[cols][rows];
    colorTerrain = new color[cols][rows];
    initColorTerrain();
  }
  
  void setFlying(float flyingX, float flyingY) {
      this.flyingX += flyingX;
      this.flyingY += flyingY;
  }
  
  // generates color for each vertex in the terrain
  void initColorTerrain() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        if (c >= 255) cSpeed = -1;
        if (c <= 0) cSpeed = 1;
        c += cSpeed;
        int g = c;
        colorTerrain[x][y] = color(255, (g + 50) % 256, (g + 180) % 256);
      }
    }
  }
  
  void show() {
    // uses perlin noise to create z components
    float yOff = flyingY;
    for (int y = 0; y < rows; y++) {
      float xOff = flyingX;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xOff, yOff), 0, 1, zDepth, zHeight);
        xOff += 0.2;
      }
      yOff += 0.2;
    }
    
    background(0);
    strokeWeight(1);
    
    // transforms terrain so that it faces up instead of
    // out of the screen
    translate(width/2 + 30, height/2 + 50);
    rotateX(PI/3);
    
    translate(-w/2, -h/2);
    
    // draws terrain
    for (int y = 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        fill(colorTerrain[x][y]);
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      }
      endShape();
    }
  }
}
