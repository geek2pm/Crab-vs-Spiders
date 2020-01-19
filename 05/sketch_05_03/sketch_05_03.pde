float crab_x, crab_y;
float crab_w, crab_h;

ArrayList<Spider> spiders;
boolean loop;

void setup() {
  spiders = new ArrayList<Spider>();
  loop=true;
  size(400, 600);
  ellipseMode(LEFT);
  crab_w=50;
  crab_h=50;
  crab_x=200-crab_w/2;
  crab_y=600-crab_h;
}

void draw() {
  if (loop) {
    background(255);
    if ((int)random(0, 100)==1) {
      spiders.add(new Spider());
    }
    for (int i=0; i<spiders.size(); i++) {
      Spider spider = spiders.get(i);
      spider.run();
      spider.draw();
      if (spider.x>=crab_x && spider.x<=crab_x+crab_w) {
        if (spider.y+spider.h>=crab_y && spider.y+spider.h<=crab_y+crab_h) {
          background(0);
          textAlign(CENTER);
          textFont(createFont(PFont.list()[0], 30));
          text("GAME OVER", 200, 300);
          loop=false;
        }
      }
      if(spider.y>600){
        spiders.remove(i);
      }
      fill(255, 255, 255);
      ellipse(crab_x, crab_y, crab_w, crab_h);
    }
  }
}

void keyPressed() {
  if (key == '1') {
    crab_x-=2;
    if (crab_x<=0) {
      crab_x=0;
    }
  }
  if (key == '0') {
    crab_x+=2;
    if (crab_x>=400-crab_w) {
      crab_x=400-crab_w;
    }
  }
}
