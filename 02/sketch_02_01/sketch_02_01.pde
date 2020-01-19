float y;
void setup() {
  size(400, 600);
  ellipseMode(LEFT);
  y=0;
}
void draw() {
  fill(255, 0, 0);
  ellipse(200-50/2, y, 50, 50);
  fill(255, 255, 255);
  ellipse(200-50/2, 600-50, 50, 50);
  y+=1;
  delay(100);
}
