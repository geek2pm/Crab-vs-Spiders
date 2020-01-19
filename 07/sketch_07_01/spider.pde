class Spider {
  float x, y, w, h;
  Spider() {
    w=50;
    h=50;
    x=random(0, 400-w);
    y=0-h;
  }
  void run() {
    y+=1;
  }
  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, w, h);
  }
}
