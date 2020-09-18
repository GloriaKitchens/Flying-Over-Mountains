class Menu {
  String title = "Flying Over Mountains";
  String author = "Gloria Kitchens";
  String startButtonText = "START";
  
  int w;
  int h;
  int textPadding = 50;
  
  boolean enabled = true;
  
  PFont font = createFont("VT323-Regular.ttf", 64);
  
  Menu(int w, int h) {
     this.w = w / 2;
     this.h = h / 2;
  }
  
  void generateBox(color c) {
    fill(c);
    rect(w / 2.0f, h / 2.0f, w, h, 3);
  }
  
  void generateText(color c) {
    fill(c);
    textFont(font);
    textAlign(CENTER);
    text(title, (w / 2.0f) , (h / 2.0f) + textPadding, w, h);
  }
  
  void show() {
    generateBox(255);
    generateText(0);
  }
  
  boolean isEnabled() {
    return enabled; 
  }

}
