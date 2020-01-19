float crab_x, crab_y;
float crab_w, crab_h;

ArrayList<Spider> spiders;
ArrayList<Bullet> bullets;
boolean loop;

void init() {
  spiders = new ArrayList<Spider>();
  bullets = new ArrayList<Bullet>();
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

    for (int bi=0; bi<bullets.size(); bi++) {
      Bullet bullet = bullets.get(bi);
      bullet.run();
      bullet.draw();
      if (bullet.y<0-bullet.h) {
        bullets.remove(bi);
      }
      for (int si=0; si<spiders.size(); si++) {
        Spider spider = spiders.get(si);
        if (abs(spider.x-bullet.x)<spider.w && abs(spider.y-bullet.y)<spider.h) {
          bullets.remove(bi);
          spiders.remove(si);
        }
      }
    }
  }
}

void fire() {
  bullets.add(new Bullet(crab_x+crab_w/2, crab_y));
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
  if (key == ' ') {
    if (loop) {
      fire();
    }
  }
}
