float crab_x, crab_y;
float spider_x, spider_y;

float crab_w, crab_h;
float spider_w, spider_h;

boolean loop;

void setup() {
  loop=true;
  size(400, 600);
  ellipseMode(LEFT);
  crab_w=50;
  crab_h=50;
  spider_w=50;
  spider_h=50;
  spider_x=200-spider_w/2;
  spider_y=0;
  crab_x=200-crab_w/2;
  crab_y=600-crab_h;
}
void draw() {
  if (loop) {
    background(255);
    fill(255, 0, 0);
    ellipse(spider_x, spider_y, spider_w, spider_h);
    fill(255, 255, 255);
    ellipse(crab_x, crab_y, crab_w, crab_h);
    spider_y+=1;
    if (spider_x>=crab_x && spider_x<=crab_x+crab_w) {
      if (spider_y+spider_h>=crab_y && spider_y+spider_h<=crab_y+crab_h) {
        background(0);
        textAlign(CENTER);
        textFont(createFont(PFont.list()[0], 30));
        text("GAME OVER", 200, 300);
        loop=false;
      }
    }
  }
}
void keyPressed() {
  if (key == '1') {
    crab_x-=2;
  }
  if (key == '0') {
    crab_x+=2;
  }
}
