float t;
float x1 = width * noise(t + 15);
float x2 = width * noise(t + 25);
float x3 = width * noise(t + 35);
float x4 = width * noise(t + 45);
float y1 = changeYs(height * noise(t + 55));
float y2 = changeYs(height * noise(t + 60));
float y3 = changeYs(height * noise(t + 64));
float y4 = changeYs(height * noise(t + 80));
float r = height * noise(t + 300);
float g = height * noise(t + 400);
float b = height * noise(t + 500);

void setup() {
  background(255);
  size(1200, 400);
  stroke(0, 18);
  noFill();
  t = 200;
}
float changeYs(float num) {
  num -= height/2;
  num *= 2;
  num += height/2;
  return num;
}
void draw() {
  float divConst = 200;
  x1 += (width * (noise(t + 15)-.2))/divConst;
  x2 += (width * (noise(t + 25)-.2))/divConst;
  x3 += (width * (noise(t + 35)-.2))/divConst;
  x4 += (width * (noise(t + 45)-.2))/divConst;
  y1 += (changeYs(height * (noise(t + 55)-.2)))/divConst;
  y2 += (changeYs(height * (noise(t + 60)-.2)))/divConst;
  y3 += (changeYs(height * (noise(t + 64)-.2)))/divConst;
  y4 += (changeYs(height * (noise(t + 80)-.2)))/divConst;
  r += (height * (noise(t + 300)-.2))/divConst;
  g += (height * (noise(t + 400)-.2))/divConst;
  b += (height * (noise(t + 500)-.2))/divConst;
  stroke(r/1.2, g/1.6, b/1.2);
  float offsetX = width/2;
  bezier(x1-offsetX, y1, x2-offsetX, y2, x3+offsetX, y3, x4+offsetX, y4);

  t += 0.001;

  // clear the background every 500 frames using mod (%) operator
  if (frameCount % 300 == 0) {
    save(random(10000)+".png");
    background(255);
  }
}