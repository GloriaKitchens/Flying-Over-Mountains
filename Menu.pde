class Menu {
  String title = "Flying Over Mountains";
  String author = "Gloria Kitchens";
  String startButtonText = "START";
  
  int w;
  int h;
  int textPadding = 45;
  float startButtonLeftCornerW;
  float startButtonLeftCornerH;
  float startButtonWidth;
  float startButtonHeight;
  
  boolean enabled = true;
  
  PFont font = createFont("VT323-Regular.ttf", 64);
  
  Menu(int w, int h) {
     this.w = w / 2;
     this.h = h / 2;
     startButtonLeftCornerW = (this.w / 2.0f) + textPadding;
     startButtonLeftCornerH = 2.25f * (this.h / 2.0f) + textPadding;
     startButtonWidth = this.w - 2.0f * textPadding;
     startButtonHeight = this.h / 6.0f;
  }
  
  void generateBoxes(color c) {
    fill(c);
    strokeWeight(4);
    // menu box
    rect(w / 2.0f, h / 2.0f, w, h, 3);
    
    color startBack = isMouseOverStart() ? 255 : c;
    fill(startBack);
    // start box
    rect(startButtonLeftCornerW, startButtonLeftCornerH, startButtonWidth, startButtonHeight);
  }
  
  void generateText(color c) {
    fill(c);
    textFont(font);
    textAlign(CENTER);
    float titleLeftCornerW = w / 2.0f;
    float titleLeftCornerH = (h / 2.0f) + textPadding;
    text(title, titleLeftCornerW, titleLeftCornerH + textPadding, w, h);
    
    textFont(font, 28);
    float authorLeftCornerW = titleLeftCornerW;
    float authorLeftCornerH = titleLeftCornerH + (h / 2.0f);
    text("Created by: " + author, authorLeftCornerW, authorLeftCornerH, w, h);
    
    color startTextColor = isMouseOverStart() ? 0 : c;
    fill(startTextColor);
    textFont(font, 32);
    text(startButtonText, startButtonLeftCornerW, startButtonLeftCornerH + (textPadding - 10) / 2.0f, startButtonWidth, startButtonHeight);
  }
  
  void showMenu() {
    generateBoxes(0);
    generateText(255);
    if (mousePressed && isMouseOverStart()) enabled = false;
  }
  
  boolean isEnabled() {
    return enabled; 
  }
  
  void setEnabled(boolean b) {
    enabled = b; 
  }
  
  boolean isMouseOverStart() {
    if ((mouseX > startButtonLeftCornerW && mouseX < startButtonLeftCornerW + startButtonWidth)
     && (mouseY > startButtonLeftCornerH && mouseY < startButtonLeftCornerH + startButtonHeight)) {
       return true;
     }
    return false;
  }
}
