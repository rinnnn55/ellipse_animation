int BALLCOUNT = 100;
float BALLDIA = 6;
int RANGEEFFECT = 50;
Ball ball;


void setup() {
  size(800, 800);
  ball = new Ball();
}

void draw() {
  background(255);
  noStroke();
  ball.display();
  ball.update();
}

class Ball {
  int[] ballX = new int[BALLCOUNT];
  int[] ballY = new int[BALLCOUNT];
  float[] ballD = new float[BALLCOUNT];
  color[] ballCol = new color[BALLCOUNT];
  float change = 2.0;
  int r, g, b;

  Ball() {
    for (int i=0; i<BALLCOUNT; i++) {
      ballX[i] = int(random(width));
      ballY[i] = int(random(height));
      ballD[i] = BALLDIA;
      r = int(random(130,255));
      g = int(random(130,255));
      b = int(random(130,255));
      ballCol[i] = color(r, g, b);
    }
  }

  void display() {
    for (int i = 0; i<BALLCOUNT; i++) {
      fill(ballCol[i]);
      ellipse(ballX[i], ballY[i], ballD[i], ballD[i]);
    }
  }

  void update() {
    for (int i=0; i<BALLCOUNT; i++) {
      if (dist(mouseX, mouseY, ballX[i], ballY[i])<RANGEEFFECT) {
        ballD[i] += BALLDIA;
      }else if(ballD[i] > BALLDIA){
        ballD[i] -= BALLDIA * 0.2;
      }
    }
  }
}
