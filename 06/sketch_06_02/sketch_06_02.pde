float crab_x, crab_y;
float crab_w, crab_h;

ArrayList<Spider> spiders;
boolean loop;

void init() {
  spiders = new ArrayList<Spider>();
  crab_w=50;
  crab_h=50;
  crab_x=200-crab_w/2;
  crab_y=600-crab_h;
  loop=true;
}

void setup() {
  size(400, 600);
  ellipseMode(LEFT);
  init();
}

void draw() {
  if (loop) {
    background(255);
    if ((int)random(0, 100)==1) {
      spiders.add(new Spider());
    }
    fill(255, 255, 255);
    ellipse(crab_x, crab_y, crab_w, crab_h);
    for (int i=0; i<spiders.size(); i++) {
      if (loop) {
        Spider spider = spiders.get(i);
        spider.run();
        spider.draw();
        if (abs(spider.x-crab_x)<spider.w/1.3 && abs(spider.y-crab_y)<crab_h/1.3) {
          background(0);
          textAlign(CENTER);
          textFont(createFont(PFont.list()[0], 50));
          fill(255);
          text("GAME OVER", 200, 300-20);
          textFont(createFont(PFont.list()[0], 20));
          text("Press key r to restart", 200, 300+20);
          loop=false;
        }
        if (spider.y>600) {
          spiders.remove(i);
        }
      }
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
  if (key == 'r') {
    if (!loop) {
      init();
    }
  }
}
