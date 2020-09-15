class Terrain {
  int cols, rows;
  int scale = 20;
  int c = 255;
  int cSpeed = 1;
  float flyingX = 0;
  float flyingY = 0;
  float terrain[][];
  
  Terrain(int w, int h) {
    cols = w / scale;
    rows = h / scale;
    terrain = new float[cols][rows];
  }
  
  void setFlying(float flyingX, float flyingY) {
      this.flyingX += flyingX;
      this.flyingY += flyingY;
  }
  
  void show() {    
    float yOff = flyingY;
    for (int y = 0; y < rows; y++) {
      float xOff = flyingX;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xOff, yOff), 0, 1, -100, 100);
        xOff += 0.2;
      }
      yOff += 0.2;
    }
    
    background(0);
    if (c >= 255) cSpeed = -1;
    if (c <= 0) cSpeed = 1;
    c += cSpeed;
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
