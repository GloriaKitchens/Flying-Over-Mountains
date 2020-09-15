class Terrain {
  int cols, rows;
  int scale = 20;
  
  int c = 255;
  int r = 180;
  int g = 255;
  int b = 180;
  int cSpeed = 1;
  int rSpeed = 1;
  int gSpeed = 1;
  int bSpeed = 1;

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
    //initColorTerrain();
  }
  
  void setFlying(float flyingX, float flyingY) {
      this.flyingX += flyingX;
      this.flyingY += flyingY;
  }
  
  //void initColorTerrain(int zDepth, int zHeight) {
  //  for (int y = 0; y < rows; y++) {
  //    for (int x = 0; x < cols; x++) {
  //      if (c >= 255) cSpeed = -1;
  //      if (c <= 0) cSpeed = 1;
  //      c += cSpeed;
  //      int g = c;
  //      colorTerrain[x][y] = color(255, g, 255);
  //    }
  //  }
  //}
  
  void show() {    
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
    // makes entire thing fade in and out from black to white and back
    
    if (r >= 180) rSpeed = -1;
    if (r <= 0) rSpeed = 1;
    r += rSpeed;
    
    if (g >= 255) gSpeed = -1;
    if (g <= 0) gSpeed = 1;
    g += gSpeed;
    
    if (b >= 180) bSpeed = -1;
    if (b <= 0) bSpeed = 1;
    b += bSpeed;
    
    if (c >= 255) cSpeed = -1;
    if (c <= 0) cSpeed = 1;
    c += cSpeed;
    
    //noStroke();
    //stroke(c);
    fill(c);
    
    //pointLight(200, 200, 200, width/2, height/2, -200);

    translate(width/2 + 30, height/2 + 50);
    rotateX(PI/3);
    
    translate(-w/2, -h/2);
    
    //pointLight(200, 200, 200, width/2, height/2, -200);

    
    for (int y = 0; y < rows - 1; y++) {
     
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      }
      endShape();
    }
  }
}
