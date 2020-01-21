class Bullet {
  float x, y;
  float w, h;
  Bullet(float x, float y) { 
    this.x=x;
    this.y=y;
    this.w=10;
    this.h=10;
  }
  void run() {
    this.y-=1;
  }
  void draw() {
    fill(255, 255, 0);
    ellipse(x-w/2, y, w, h);
  }
}
