ArrayList<Point> p;
PShape item;

boolean drawRevo, isCreated;
float SIGMA = PI/8, x1, x2, z1, z2, x1prime, x2prime, z1prime, z2prime, rotx, roty;


void setup() {
  size(1080, 640, P3D);
  p = new ArrayList<Point>();

  drawRevo = false;
  isCreated = false;

  shapeMode(CENTER);
}

void draw() {
  if (!drawRevo) {
    displayUtils(true);
    drawTempShape();
  } else {
    displayUtils(false);
    if (!isCreated) {
      createRevolution();
    }
    translate(width/2, height/2, -250);

    rotx = map(mouseX, 0, width, -PI, PI);
    roty = map(mouseY, 0, height, -PI, PI);

    rotateY(rotx);
    rotateX(-roty);

    shape(item);
  }
}

void displayUtils(boolean extra) {
  background(0);
  stroke(255);
  if (extra) {
    line(width/2, 0, width/2, height);
    textSize(20);
    text("Click on the right side of the screen to create points\nfor the 2d shape.\nPress ENTER to create the 3d shape.\nPress RETURN to reset the drawing.", 10, 40);
  } else {
    textSize(15);
    text("Press RETURN to reset the drawing.", 10, 630);
  }
}

void drawTempShape() {
  if (!p.isEmpty()) {
    noFill();
    beginShape();
    for (Point point : p) {
      vertex(point.getX(), point.getY());
    }

    endShape();
  }
}

void createRevolution() {
  item = createShape();
  item.beginShape(TRIANGLE_STRIP);
  item.stroke(255, 0, 0, 255);
  item.strokeWeight(3);
  item.fill(255, 255, 255, 255);
  for (int i = 0; i < p.size()-1; i++) {
    x1 = p.get(i).getX() - width/2;
    x2 = p.get(i+1).getX() - width/2;
    z1 = 0;
    z2 = 0;
    for (int iter = 0; iter <= (360/degrees(SIGMA)); iter++) {
      x1prime = x1 * cos(SIGMA) - z1 * sin(SIGMA);
      x2prime = x2 * cos(SIGMA) - z2 * sin(SIGMA);
      z1prime = x1 * sin(SIGMA) + z1 * cos(SIGMA);
      z2prime = x2 * sin(SIGMA) + z2 * cos(SIGMA);

      item.vertex(x1prime, p.get(i).getY(), z1prime);
      item.vertex(x2prime, p.get(i+1).getY(), z2prime);

      x1 = x1prime;
      x2 = x2prime;
      z1 = z1prime;
      z2 = z2prime;
    }
  }
  item.endShape();
}

void mouseReleased() {
  if (mouseX >= width/2 && !drawRevo) {
    p.add(new Point(mouseX, mouseY));
  }
}

void keyPressed() {
  if (keyCode == ENTER && !drawRevo) {
    drawRevo = true;
  }

  if (keyCode == BACKSPACE) {
    p = new ArrayList<Point>();
    drawRevo = false;
    isCreated = false;
  }
}

class Point {
  private int x, y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}
