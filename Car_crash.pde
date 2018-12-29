int y;
int ys;
int yt;
int yf;
int lineSpeed;
int carX;
int carMoveE;
int carSpeed;
int menucarX =  -200;
int menucarX2 =  1400;
int N = 4;
int pass = 0;
int point = 0;
float coin = 0;
float totalCoin = 0;
int totalPass = 0;
int radius = 25;

int beamY;
int beamX;

float ballY;
float ballX;
boolean ball = false;
boolean getBall = false;
boolean Mpoint = false;
boolean beam = false;
boolean nameColor = false;

boolean rectangle = false;

float[] carPositionY = new float[N];
float[] carPositionX = new float[N];


PImage green;
PImage white;
PImage yellow;
PImage start;
PImage pause;
PImage green2;
PImage[] coin_image = new PImage[8];
PImage race_car;
PImage customize;

int namecolorR = 0;
int namecolorG = 0;
int namecolorB = 255;
String basecolor = "red";
char[] originalcolor = {' ', ' ', ' '};
String nameCString = "";
String namecolor;

String mode = "easy";
String state = "set name";
//String state = "mode select";
String carSpeedS = "not original";

char[] name = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '};
int nameindex = 0;
String nameString = "";

int stCount;

void setup() {
  size(1200, 754);
  lineSpeed = 10;
  y = 10;
  ys = 210;
  yt = 410;
  yf = 610;
  carSpeed = 15;
  carX = width/2 + 80;
  ballX = random(0, 724);
  ballY = random(-500, -150);
  frameRate(50);

  for (int i = 0; i < 4; i++) {
    carPositionY[i] = random(-2000, -150);
    carPositionX[i] = random(i*275, (i+1)*275);
  }


  green = loadImage("green.png");
  white = loadImage("white.png");
  yellow = loadImage("yellow.png");
  start = loadImage("start.png");
  pause = loadImage("pause.png");
  green2 = loadImage("green2.png");
  race_car = loadImage("Lamborghini.jpg");
  customize = loadImage("customize.jpg");

  coin_image[0] = loadImage( "coin0.gif" );
  coin_image[1] = loadImage( "coin1.gif" );
  coin_image[2] = loadImage( "coin2.gif" );
  coin_image[3] = loadImage( "coin3.gif" );
  coin_image[4] = loadImage( "coin4.gif" );
  coin_image[5] = loadImage( "coin5.gif" );
  coin_image[6] = loadImage( "coin6.gif" );
  coin_image[7] = loadImage( "coin7.gif" );
}

void draw() {


  // Road
  background(90, 93, 88);
  strokeWeight(0);
  fill(255, 255, 255);
  rect(width/2 - 20, y, 40, 150);
  rect(width/2 - 20, ys, 40, 150);
  rect(width/2 - 20, yt, 40, 150);
  rect(width/2 - 20, yf, 40, 150);

  rect(width/3 - 20, y, 40, 150);
  rect(width/3 - 20, ys, 40, 150);
  rect(width/3 - 20, yt, 40, 150);
  rect(width/3 - 20, yf, 40, 150);

  rect(width/7 + 15, y, 40, 150);
  rect(width/7 + 15, ys, 40, 150);
  rect(width/7 + 15, yt, 40, 150);
  rect(width/7 + 15, yf, 40, 150);

  rect(width/2 + 180, y, 40, 150);
  rect(width/2 + 180, ys, 40, 150);
  rect(width/2 + 180, yt, 40, 150);
  rect(width/2 + 180, yf, 40, 150);

  rect(width/2 + 360, y, 40, 150);
  rect(width/2 + 360, ys, 40, 150);
  rect(width/2 + 360, yt, 40, 150);
  rect(width/2 + 360, yf, 40, 150);

/*
  if (state == "start" || state == "set name") {
    y += lineSpeed;
    ys += lineSpeed;
    yt += lineSpeed;
    yf += lineSpeed;

    if (y > height) {
      y = -150;
    }
    if (ys > height) {
      ys = -150;
    }
    if (yt > height) {
      yt = -150;
    }
    if (yf > height) {
      yf = -150;
    }
  }
*/

  // ball
  if (ball == false) {
    //image(coin_image[frameCount%32/4], ballX, ballY, 70, 70);
  }

  if (mode == "easy" || mode == "normal" || mode == "hard" || mode == "challenge" || mode == "crazy") {
    // Move ball
    ballY += 10;
  }

  // Ball return
  if (ballY > height) {
    ballX = random(0, 724);
    ballY = random(-500, -150);
    getBall = false;
    Mpoint = false;
    ball = false;
  }

  // Car
  image(green, carX, 580, 100, 170);

  // CarE

  for (int i = 0; i < N; i++) {
    image(yellow, carPositionX[i], carPositionY[i], 100, 170);
  }

  if (carSpeedS == "not original") {
    if (mode == "easy" || mode == "normal") {
      carSpeed = 15;
    }
    if (mode == "hard" || mode == "challenge" || mode == "ranked") {
      carSpeed = 20;
    }
    if (mode == "crazy") {
      carSpeed = 25;
    }
  }

  // Car move
  if (keyPressed) {
    if (state == "start") {
      println(point);
      if (keyCode == RIGHT) {
        carX += carSpeed;
        if (mode == "ranked") {
          fill(0, 0, 0, 230);
          rect(0, 0, width, height);
        }
      } else if (keyCode == LEFT) {
        carX -= carSpeed;
        if (mode == "ranked") {
          fill(0, 0, 0, 230);
          rect(0, 0, width, height);
        }
      } else if (point >= 1 && key == 'z' && Mpoint == false) {
        Mpoint = true;
        point -= 1;
      } else if (point >= 3 && keyCode == UP && Mpoint == false && beam == false && (mode == "easy" || mode == "normal" || mode == "hard" || mode == "challenge" || mode == "crazy")) {
        beamX = carX;
        Mpoint = true;
        beam = true;
        point -= 3;
        beamY = 580;
        beamY = 550;
      } else if (key == ' ' && (mode == "easy" || mode == "normal" || mode == "hard" || mode == "challenge" || mode == "crazy")) {
        state = "stop";
      }
    }
  }

  // beam
  if (beam == true) {
    beamY -= 10;
    // draw beam!
    stroke(255, 0, 0);
    strokeWeight(10);
    line(beamX + 50, beamY, beamX + 50, beamY - 10);

    // hit car?
    for (int i = 0; i < N; i++) {
      if (beamY - 10 < carPositionY[i] + 170 && beamX > carPositionX[i] - 50 && beamX < carPositionX[i] + 50) {
        pass++;
        totalPass += 1;
        coin += 0.5;
        totalCoin += 0.5;
        carPositionY[i] = height;
        beam = false;
        break;
      }
    }

    // out of window?  
    if (beamY < 0) {
      beam = false;
    }

    noStroke();
  }


  // CarE return
  if (state == "start") {
    for (int i = 0; i < N; i++) {
      // Car moveE
      if (mode == "normal") {
        carPositionY[i] += 20;
      } else if (mode == "easy") {
        carPositionY[i] += 15;
      } else if (mode == "hard") {
        carPositionY[i] += 25;
      } else if (mode == "challenge") {
        carPositionY[i] += 30;
      } else if (mode == "crazy") {
        carPositionY[i] += 40;
      } else if (mode == "ranked") {
        carPositionY[i] += 25;
      }
      if (carPositionY[i] > height) {
        carPositionY[i] = random(-1000, -100);
        carPositionX[i] = random(i*275, (i+1)*275);
        pass++;
        totalPass += 1;
        coin += 0.3;
        totalCoin += 0.3;
      }
    }
  }

  // Do not move car over the edge
  if (carX < 0) {
    carX = 0;
  }
  if (carX + 100 > 1200) {
    carX = 1100;
  }

  fill(0, 0, 0, 200);
  rect(0, 0, width, 60);

  // Stop mark
  image(pause, width - 210, 7, 50, 50);
  fill(255, 255, 255, 0);
  ellipseMode(RADIUS);
  ellipse(width - 185, 32, radius, radius);

  float d = dist(mouseX, mouseY, width - 185, 32);

  // Click the stop mark
  if (d < radius && mousePressed && (mode == "easy" || mode == "normal" || mode == "hard" || mode == "challenge" || mode == "crazy")) {
    state = "stop";
  }

  // pass
  textSize(50);
  fill(255);
  text(pass, width - 150, 50);

  // Draw point
  text(point, 20, 50);

  // Draw coin
  textSize(30);
  //text(String.format("%d", int(coin)), 10, height - 10);

  // Draw name

  if (state == "start" || state == "namecolor") {
    if (basecolor == "red") {
      namecolorR += 2;
      namecolorB -= 2;
      if (namecolorR >= 255) {
        basecolor = "green";
      }
    }

    if (basecolor == "green") {
      namecolorG += 2;
      namecolorR -= 2;
      if (namecolorG >= 255) {
        basecolor = "blue";
      }
    }

    if (basecolor == "blue") {
      namecolorB += 2;
      namecolorG -= 2;
      if (namecolorB >= 255) {
        basecolor = "red";
      }
    }

    if (namecolor == "rainbow") {
      fill(namecolorR, namecolorG, namecolorB);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "red") {
      fill(255, 0, 0);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "green") {
      fill(0, 255, 0);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "blue") {
      fill(0, 0, 255);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "aqua") {
      fill(0, 255, 255);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "white") {
      fill(255);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    if (namecolor == "pink") {
      fill(250, 20, 230);
      textAlign(CENTER);
      textSize(50);
      text(nameString, width/2, 50);
    }
    textAlign(LEFT);
  }

  if (state == "gameover") {
    //fill(0);
    //rect(0, 0, width, height);
    background(0);
    fill(255);
    textSize(100);
    text("You pass", width/30, 150);
    text("cars", width/2 + 180, 150);
    text("You get", width/30, 300);
    text("point", width/2 + 180, 300);
    fill(217, 222, 7);
    text(pass, width/2 - 80, 150);
    text(point, width/2 - 80, 300);
    textSize(60);
    fill(255);
    text("and", width/2 + 400, 150);

    // Back to menu
    fill(255, 0, 0);
    text("Back", 55, height - 150);
    text("to", 90, height - 90);
    text("menu", 45, height - 30);
    if (mouseX > 35 && mouseX < 215 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      fill(0);
      rect(35, height - 210, 180, 200);
      fill(255, 255, 255);
      text("Back", 55, height - 150);
      text("to", 90, height - 90);
      text("menu", 45, height - 30);
    }

    // Play again
    fill(0, 0, 255);
    text("Play", width/2 - 70, height - 130);
    text("again", width/2 - 95, height - 45);
    if (mouseX > width/2 - 115 && mouseX < 685 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      fill(0);
      rect(width/2 - 115, height - 210, 200, 200);      
      fill(255, 255, 255);
      text("Play", width/2 - 70, height - 130);
      text("again", width/2 - 95, height - 45);
    }




    // Mode select
    fill(0, 255, 0);
    text("Mode", width - 245, height - 130);
    text("select", width - 250, height - 45);
    if (mouseX > width - 265 && mouseX < width - 265 + 200 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      fill(0);
      rect(width - 265, height - 210, 200, 200);      
      fill(255, 255, 255);
      text("Mode", width - 245, height - 130);
      text("select", width - 250, height - 45);
    }
  }
  // Crash
  if (state == "start") {
    for (int i = 0; i < N; i++) {
      if (carPositionY[i] + 150 > 580 && carPositionX[i] + 70 > carX && carPositionX[i] < carX + 70) {
        state = "gameover";
      }
    }
  }

  // Ball point
  if (state == "start") {
    for (int i = 0; i < N; i++) {
      if (ballY + 15 > 580 && ballX + 15 > carX && ballX < carX + 70 && getBall == false) {
        getBall = true;
        ball = true;
        point++;
      }
    }
  }




  if (state == "menu") {
    fill(0);
    rect(0, 0, width, height);
    fill(255, 0, 0);
    textSize(100);
    //text("CAR CRASH!!", width/4, 130);
    image(green2, menucarX, 20, 190, 120);
    menucarX += 10;

    if (menucarX > width/4 + 80) {
      fill(255, 0, 0);
      text("C", width/4, 120);
    }
    if (menucarX > width/4 + 160) {
      fill(255, 0, 0);
      text("A", width/4 + 80, 120);
    }
    if (menucarX > width/4 + 240) {
      fill(255, 0, 0);
      text("R", width/4 + 160, 120);
    }
    if (menucarX > width/4 + 400) {
      fill(255, 0, 0);
      text("C", width/4 + 320, 120);
    }
    if (menucarX > width/4 + 480) {
      fill(255, 0, 0);
      text("R", width/4 + 400, 120);
    }
    if (menucarX > width/4 + 560) {
      fill(255, 0, 0);
      text("A", width/4 + 480, 120);
    }
    if (menucarX > width/4 + 640) {
      fill(255, 0, 0);
      text("S", width/4 + 560, 120);
    }
    if (menucarX > width/4 + 720) {
      fill(255, 0, 0);
      text("H", width/4 + 620, 120);
    }
    textSize(70);

    fill(110, 0, 240);
    text("Shop", width/2 + 350, height - 100);
    //rect(width/2 + 340, height - 165, 185, 80);
    if (mouseX > width/2 + 340 && mouseX < width/2 + 340 + 185 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      fill(0);
      rect(width/2 + 340, height - 165, 185, 80);
      fill(255);
      text("Shop", width/2 + 350, height - 100);
    }


    fill(0, 0, 255);
    text("Ranking", width/2 + 30, height - 100);
    //rect(width/2 + 20, height - 165, 290, 80);
    if (mouseX > width/2 + 20 && mouseX < width/2 + 20 + 290 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      fill(0);
      rect(width/2 + 20, height - 165, 290, 80);
      fill(255);
      text("Ranking", width/2 + 30, height - 100);
    }


    fill(0, 255, 0);
    text("Records", width/2 - 300, height - 100);
    //rect(width/2 - 310, height - 165, 290, 80);
    if (mouseX > width/2 - 310 && mouseX <width/2 - 310 + 290 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      fill(0);
      rect(width/2 - 310, height - 165, 290, 80);
      fill(255);
      text("Records", width/2 - 300, height - 100);
    }


    fill(255, 0, 0);
    text("How", width/2 - 500, height - 160);
    text("to", width/2 - 460, height - 100);
    text("play", width/2 - 500, height - 40);
    //rect(width/2 - 510, height - 230, 170, 220);
    if (mouseX > width/2 - 510 && mouseX < width/2 - 510 + 170 && mouseY > height - 230 && mouseY < height - 230 + 220) {
      fill(0);
      rect(width/2 - 510, height - 230, 170, 220);
      fill(255);
      text("How", width/2 - 500, height - 160);
      text("to", width/2 - 460, height - 100);
      text("play", width/2 - 500, height - 40);
    }


    fill(0, 255, 255);
    text("Play", width/2 - 70, height - 220);
    //rect(width/2 - 80, height - 285, 160, 80);
    if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 160 && mouseY > height - 285 && mouseY < height - 285 + 80) {
      fill(0);
      rect(width/2 - 80, height - 285, 160, 80);
      fill(255);
      text("Play", width/2 - 70, height - 220);
    }
  }

  if (state == "records") {
  }

  if (state == "how to play") {
  }

  if (state == "mode select") {
    fill(0);
    stroke(50, 50, 50);
    rect(0, 0, width, height);
    fill(111, 111, 111);
    rect(200, 100, 770, 50);
    strokeWeight(2);
    rect(200, 110, 10, 30);
    rect(350, 110, 10, 30);
    rect(500, 110, 10, 30);
    rect(650, 110, 10, 30);
    rect(800, 110, 10, 30);
    rect(959, 110, 10, 30);
    fill(180);
    if (mode == "easy") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(200, 100, 20, 50);
    }
    if (mode == "normal") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(350, 100, 20, 50);
    }
    if (mode == "hard") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(500, 100, 20, 50);
    }
    if (mode == "challenge") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(650, 100, 20, 50);
    }
    if (mode == "crazy") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(800, 100, 20, 50);
    }
    if (mode == "ranked") {
      stroke(50, 50, 50);
      strokeWeight(3);
      rect(959, 100, 20, 50);
    }
    textSize(40);
    fill(255);  
    text("mode:", 450, 140);
    text(mode, 580, 140);

    fill(147, 147, 147);
    rect(width/2 - 60, height - 100, 120, 60);
    fill(255);
    text("play", width/2 - 40, height - 55);

    fill(111);
    stroke(0);
    rect(200, 200, 770, 50);

    stroke(50, 50, 50);
    strokeWeight(2);
    rect(202, 210, 10, 30);
    rect(275, 210, 10, 30);
    rect(350, 210, 10, 30);
    rect(425, 210, 10, 30);
    rect(500, 210, 10, 30);
    rect(575, 210, 10, 30);
    rect(650, 210, 10, 30);
    rect(725, 210, 10, 30);
    rect(800, 210, 10, 30);
    rect(880, 210, 10, 30);
    rect(958, 210, 10, 30);

    stroke(50, 50, 50);
    strokeWeight(3);
    fill(180);

    if (carSpeed == 15) {
      rect(350, 200, 20, 50);
    } else if (carSpeed == 20) {
      rect(425, 200, 20, 50);
    } else if (carSpeed == 25) {
      rect(500, 200, 20, 50);
    } else if (carSpeed == 30) {
      rect(575, 200, 20, 50);
    } else if (carSpeed == 35) {
      rect(650, 200, 20, 50);
    } else if (carSpeed == 40) {
      rect(725, 200, 20, 50);
    } else if (carSpeed == 45) {
      rect(800, 200, 20, 50);
    } else if (carSpeed == 50) {
      rect(880, 200, 20, 50);
    } else if (carSpeed == 55) {
      rect(958, 200, 20, 50);
    } else if (carSpeed == 5) {
      rect(202, 200, 20, 50);
    } else if (carSpeed == 10) {
      rect(275, 200, 20, 50);
    }

    stroke(0);
    fill(111, 111, 111);
    rect(200, 350, 770, 50);
    fill(255);
    text("Another mode...", 430, 390);
    stroke(50, 50, 50);
    strokeWeight(3);
    fill(180);
    rect(202, 350, 20, 50);
    rect(950, 350, 20, 50);

    fill(255);
    text("carX speed:", 370, 240);
    text(carSpeed, 600, 240);

    fill(255);
    textSize(20);
    text("set carX speed", 505, 286);

    if (carSpeedS == "not original") {
      fill(255, 255, 255, 150);
      rect(200, 200, 770, 50);
    }


    if (carSpeedS == "original") {
      fill(0, 121, 216);
      rect(480, 270, 20, 20);
    }

    stroke(0);
    rect(480, 270, 20, 20);
    noStroke();
    fill(255);
    rect(486.5, 276.5, 8, 8);

    fill(111);
    stroke(0);
    rect(200, 560, 770, 50);
    fill(255);
    textSize(40);
    text("choose name color", 400, 600);

    stroke(50, 50, 50);
    strokeWeight(3);
    fill(180);
    rect(202, 560, 20, 50);

    rect(950, 560, 20, 50);

    fill(111);
    stroke(0);
    rect(20, 20, 80, 40);
    fill(255);
    textSize(30);
    text("EXIT", 30, 50);

    if (rectangle == true) {
      noStroke();
      filter(BLUR, 10);
      fill(40);
      rect(60, 100, 750, 600);
      fill(150, 150, 150, 150);
      rect(850, 100, 320, 600);
      fill(1, 120, 170);
      rect(855, 635, 310, 60);
      fill(255);
      textSize(50);
      text("Accept", 925, 680);
      fill(1, 120, 170);
      rect(65, 105, 360, 590);
      fill(255);
      rect(445, 105, 360, 590);
      image(race_car, 65, 105, 360, 590);
      image(customize, 465, 150);
      fill(20, 20, 20, 200);
      rect(65, 595, 360, 100);
      rect(445, 595, 360, 100);
      fill(255);
      text("Race", 180, 660);
      text("Customize", 490, 660);
      fill(255);
      fill(255);
      textSize(50);
      text("Choose game mode", 370, 60);
      if (mode == "race") {
        strokeWeight(5);
        stroke(234, 146, 12);
        fill(0, 0, 0, 0);
        rect(65, 105, 360, 590);
        fill(255);
        textSize(60);
        text("Race", 935, 160);
      } else if (mode == "customize") {
        strokeWeight(5);
        stroke(234, 146, 12);
        fill(0, 0, 0, 0);
        rect(445, 105, 360, 590);
        fill(255);
        textSize(60);
        text("Customize", 855, 160);
      }
    }

    noStroke();
  }

  if (state == "shop") {
  }

  if (state == "originalcolor") {
  }

  if (state == "count") {
    fill(0, 0, 0, 170);
    rect(0, 0, width, height);
    textSize(400);
    fill(255);
    if (millis() - stCount >= 3100) {
      state = "start";
    } else if (millis() - stCount >= 2100) {
      text("1", width/2 - 120, height/2 + 120);
    } else if (millis() - stCount >= 1100) {
      text("2", width/2 - 120, height/2 + 120);
    } else if (millis() - stCount >= 100) {
      text("3", width/2 - 120, height/2 + 120);
    }
  }

  if (state == "set name") {
    fill(0, 0, 0, 240);
    rect(0, 0, width, height);
    fill(255);
    textSize(50);
    text("Please give me your name", width/4 - 25, 150);

    textSize(100);
    if (nameindex < name.length) {
      //println(millis());
      //println(frameCount % frameRate);
      if (millis() % 1000 > 500) {
        name[nameindex] = '_';
      } else {
        name[nameindex] = ' ';
      }
    }
    nameString = new String(name);
    text(nameString, width/5 - 200, height/2);

    textSize(50);
    text("up to thirteen characters", width/3 - 80, height/2 + 130);
    fill(0, 0, 255);
    text("Done!!", width/2 - 67, height/2 + 260);
    fill(0, 0, 0, 0);
    noStroke();
    rect(width/2 - 70, height/2 + 190, 160, 115);

    if (mouseX > width/2 - 70 && mouseX < width/2 - 70 + 160 && mouseY > height/2 + 190 && mouseY < height/2 + 190 + 115) {
      fill(0, 0, 0, 10);
      rect(width/2 - 70, height/2 + 190, 160, 115);
      fill(255);
      text("Done!!", width/2 - 67, height/2 + 260);
      /*
      if (state == "set name") {
       if (keyPressed) {
       if (keyCode == ENTER) {
       state = "namecolor";
       }
       }
       }
       */
    }



    fill(255, 255, 255, 0);
    strokeWeight(10);
    stroke(255, 255, 255, 200);
    strokeJoin(ROUND);
    rect(width/5 - 210, height/2 - 85, 1150, 110);
  }

  if (state == "namecolor") {
    fill(0, 0, 0);
    rect(0, 0, width, height);

    textSize(80);
    noStroke();
    fill(255, 0, 0); 
    text("Red", width/2 - 50, 100);
    if (mouseX > width/2 - 60 && mouseX < width/2 - 60 + 165 && mouseY > 20 && mouseY < 20 + 100) {
      fill(0, 0, 0, 70);
      rect(width/2 - 60, 20, 165, 100);
      fill(255);
      text("Red", width/2 - 50, 100);
    }



    fill(0, 255, 0);
    text("Green", width/2 - 90, 200);
    if (mouseX > width/2 - 90 && mouseX < width/2 - 90 + 225 && mouseY > 140 && mouseY < 140 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 - 90, 140, 225, 80);
      fill(255);
      text("Green", width/2 - 90, 200);
    }


    fill(0, 0, 255);
    text("Blue", width/2 - 60, 300);
    if (mouseX > width/2 - 70 && mouseX < width/2 - 70 + 180 && mouseY > 230 && mouseY < 230 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 - 70, 230, 180, 80);
      fill(255);
      text("Blue", width/2 - 60, 300);
    }


    fill(0, 255, 255);
    text("Aqua", width/2 - 80, 400);
    //rect(width/2 - 80, 340, 200, 80);
    if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 200 && mouseY > 340 && mouseY < 340 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 - 80, 340, 200, 80);
      fill(255);
      text("Aqua", width/2 - 80, 400);
    }


    fill(255);
    text("White", width/2 - 90, 500);
    //rect(width/2 - 100, 435, 230, 80);
    if (mouseX > width/2 - 100 && mouseX < width/2 - 100 + 230 && mouseY > 435 && mouseY < 435 + 80) {
      fill(255, 255, 255, 70);
      rect(width/2 - 100, 435, 230, 80);
    }


    fill(250, 20, 230);
    text("Pink", width/2 - 70, 600);
    //rect(width/2 - 80, 530, 180, 80);
    if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 180 && mouseY > 530 && mouseY < 530 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 - 80, 530, 180, 80);
      fill(255);
      text("Pink", width/2 - 70, 600);
    }


    fill(namecolorR, namecolorG, namecolorB);
    text("Rainbow", width/2 - 300, 700);
    //rect(width/2 - 310, 630, 340, 80);
    if (mouseX > width/2 - 310 && mouseX < width/2 - 310 + 340 && mouseY > 630 && mouseY < 630 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 - 310, 630, 340, 80);
      fill(255);
      text("Rainbow", width/2 - 300, 700);
    }


    fill(250, 120, 40);
    text("Original", width/2 + 50, 700);
    //rect(width/2 + 40, 637, 340, 80);
    if (mouseX > width/2 + 40 && mouseX < width/2 + 80 + 340 && mouseY > 637 && mouseY < 637 + 80) {
      fill(0, 0, 0, 70);
      rect(width/2 + 40, 637, 340, 80);
      fill(255);
      text("Original", width/2 + 50, 700);
    }
  }

  // Stop
  if (state == "stop") {
    fill(0, 0, 0, 230);
    rect(0, 0, width, height);
    fill(255);
    textSize(60);
    if (millis() % 1000 > 500) {
      text("Shift to restart", width/3 - 30, 500);
    } else {
      text("", width/3 - 70, 500);
    }
    image(start, 10, 7, 50, 50);
    textSize(100);
    text("You pass", width/30, 150);
    text("cars", width/2 + 180, 150);
    text("You get", width/30, 300);
    text("point", width/2 + 180, 300);
    fill(217, 222, 7);
    text(pass, width/2 - 80, 150);
    text(point, width/2 - 80, 300);
    textSize(60);
    fill(255);
    text("and", width/2 + 400, 150);
  }
  if (keyPressed) {
    if (state == "stop") {
      if (keyCode == SHIFT) {
        state = "count";
        stCount = millis();
      }
    }
  }
}

void keyReleased() {
  if (state == "set name") {
    print(key+" ");
    println(keyCode);
    if (keyCode == 8 && nameindex > 0) {
      if (nameindex < name.length) {
        name[nameindex] = ' ';
      }
      nameindex--;
      name[nameindex] = ' ';
    } else if (nameindex < name.length && ((keyCode >= 65 && keyCode <= 90) || keyCode == 45 || (keyCode >= 48 && keyCode <= 57))) {
      name[nameindex] = key;
      nameindex++;
    }
    if (keyCode == ENTER) {
      state = "namecolor";
    }
  }
}

void mouseReleased() {
  if (carSpeedS == "not original") {
    if (mouseX >= 480 && mouseX < 500 && mouseY >= 270 && mouseY < 290) {
      carSpeedS = "original";
    }
  } else if (carSpeedS == "original") {
    if (mouseX >= 480 && mouseX < 500 && mouseY >= 270 && mouseY < 290) {
      carSpeedS = "not original";
    }
  }

  if (state == "mode select") {
    if (mouseX >= 200 && mouseX < 970 && mouseY >= 100 && mouseY < 150) {
      if (mode == "easy") {
        mode = "normal";
      } else if (mode == "normal") {
        mode = "hard";
      } else if (mode == "hard") {
        mode = "challenge";
      } else if (mode == "challenge") {
        mode = "crazy";
      } else if (mode == "crazy") {
        mode = "ranked";
      } else if (mode == "ranked") {
        mode = "easy";
      } else if (mode == "customize" || mode == "race") {
        mode = "easy";
      }
    }
    if (mouseX >= 200 && mouseX < 970 && mouseY >= 200 && mouseY < 250) {
      if (carSpeed == 15) {
        carSpeed = 20;
      } else if (carSpeed == 20) {
        carSpeed = 25;
      } else if (carSpeed == 25) {
        carSpeed = 30;
      } else if (carSpeed == 30) {
        carSpeed = 35;
      } else if (carSpeed == 35) {
        carSpeed = 40;
      } else if (carSpeed == 40) {
        carSpeed = 45;
      } else if (carSpeed == 45) {
        carSpeed = 50;
      } else if (carSpeed == 50) {
        carSpeed = 55;
      } else if (carSpeed == 55) {
        carSpeed = 5;
      } else if (carSpeed == 5) {
        carSpeed = 10;
      } else if (carSpeed == 10) {
        carSpeed = 15;
      }
    }
  }

  if (state == "mode select") {
    if (mouseX >= 20 && mouseX < 100 && mouseY >= 20 && mouseY < 60) {
      state = "menu";
    }
  }

  if (state == "namecolor") {
    if (mouseX > width/2 - 60 && mouseX < width/2 - 60 + 165 && mouseY > 20 && mouseY < 20 + 100 && nameColor == false) {
      namecolor = "red";
      state  = "menu";
    } else if (mouseX > width/2 - 60 && mouseX < width/2 - 60 + 165 && mouseY > 20 && mouseY < 20 + 100 && nameColor == true) {
      namecolor = "red";
      state  = "mode select";
    } else if (mouseX > width/2 - 90 && mouseX < width/2 - 90 + 225 && mouseY > 140 && mouseY < 140 + 80 && nameColor == false) {
      namecolor = "green";
      state  = "menu";
    } else if (mouseX > width/2 - 90 && mouseX < width/2 - 90 + 225 && mouseY > 140 && mouseY < 140 + 80 && nameColor == true) {
      namecolor = "green";
      state  = "mode select";
    } else if (mouseX > width/2 - 70 && mouseX < width/2 - 70 + 180 && mouseY > 230 && mouseY < 230 + 80 && nameColor == false) {
      namecolor = "blue";
      state  = "menu";
    } else if (mouseX > width/2 - 70 && mouseX < width/2 - 70 + 180 && mouseY > 230 && mouseY < 230 + 80 && nameColor == true) {
      namecolor = "blue";
      state  = "mode select";
    } else if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 200 && mouseY > 340 && mouseY < 340 + 80 && nameColor == false) {
      namecolor = "aqua";
      state  = "menu";
    } else if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 200 && mouseY > 340 && mouseY < 340 + 80 && nameColor == true) {
      namecolor = "aqua";
      state  = "mode select";
    } else if (mouseX > width/2 - 100 && mouseX < width/2 - 100 + 230 && mouseY > 435 && mouseY < 435 + 80 && nameColor == false) {
      namecolor = "white";
      state  = "menu";
    } else if (mouseX > width/2 - 100 && mouseX < width/2 - 100 + 230 && mouseY > 435 && mouseY < 435 + 80 && nameColor == true) {
      namecolor = "white";
      state  = "mode select";
    } else if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 180 && mouseY > 530 && mouseY < 530 + 80 && nameColor == false) {
      namecolor = "pink";
      state = "menu";
    } else if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 180 && mouseY > 530 && mouseY < 530 + 80 && nameColor == true) {
      namecolor = "pink";
      state = "mode select";
    } else if (mouseX > width/2 - 310 && mouseX < width/2 - 310 + 340 && mouseY > 630 && mouseY < 630 + 80 && nameColor == false) {
      namecolor = "rainbow";
      state = "menu";
    } else if (mouseX > width/2 - 310 && mouseX < width/2 - 310 + 340 && mouseY > 630 && mouseY < 630 + 80 && nameColor == true) {
      namecolor = "rainbow";
      state = "mode select";
    } else if (mouseX > width/2 + 40 && mouseX < width/2 + 80 + 340 && mouseY > 637 && mouseY < 637 + 80) {
      state = "originalcolor";
    }
  }

  if (state == "mode select") {
    if (mouseX >= 200 && mouseX < 970 && mouseY >= 560 && mouseY < 610) {
      state = "namecolor";
    }
  } else if (state == "set name") {
    if (mouseX > width/2 - 70 && mouseX < width/2 - 70 + 160 && mouseY > height/2 + 190 && mouseY < height/2 + 190 + 115) {
      state = "namecolor";
    }
  }

  if (state == "gameover") {
    if (mouseX > width/2 - 115 && mouseX < 685 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      state = "count";
      stCount = millis();
      carX = width/2 + 80;
      ballX = random(0, 724);
      ballY = random(-500, -150);
      for (int i = 0; i < 4; i++) {
        carPositionY[i] = random(-2000, -150);
        carPositionX[i] = random(i*275, (i+1)*275);
        point = 0;
        pass = 0;
        coin = 0;
        beam = false;
      }
    }
    if (mouseX > 35 && mouseX < 215 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      state = "menu";
      return;
    }
    if (mouseX > width - 265 && mouseX < width - 265 + 200 && mouseY > height - 210 && mouseY < height - 210 + 200) {
      state = "mode select";
    }
  }

  if (state == "menu") {
    if (mouseX > width/2 + 340 && mouseX < width/2 + 340 + 185 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      state = "shop";
    }
    if (mouseX > width/2 + 20 && mouseX < width/2 + 20 + 290 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      state = "ranking";
    }
    if (mouseX > width/2 - 310 && mouseX <width/2 - 310 + 290 && mouseY > height - 165 && mouseY < height - 165 + 80) {
      state = "records";
    }
    if (mouseX > width/2 - 510 && mouseX < width/2 - 510 + 170 && mouseY > height - 230 && mouseY < height - 230 + 220) {
      state = "how to play";
    }
    if (mouseX > width/2 - 80 && mouseX < width/2 - 80 + 160 && mouseY > height - 285 && mouseY < height - 285 + 80) {
      state = "mode select";
      nameColor = true;
    }
  }

  if (state == "mode select") {
    if (mouseX >= width/2 - 60 && mouseX < width/2 - 60 + 120 && mouseY >= height - 100 && mouseX < height - 100 + 60) {
      stCount = millis();
      state = "count";
      carX = width/2 + 80;
      ballX = random(0, 724);
      ballY = random(-500, -150);
      for (int i = 0; i < 4; i++) {
        carPositionY[i] = random(-2000, -150);
        carPositionX[i] = random(i*275, (i+1)*275);
        point = 0;
        pass = 0;
        coin = 0;
        beam = false;
      }
    }
    //rect(200, 350, 770, 50);
    if (mouseX >= 200 && mouseX <= 970 && mouseY >= 350 && mouseY <= 400) {
      rectangle = true;
    }
    //rect(855, 635, 310, 60);
    if (mouseX >= 855 && mouseX <= 1165 && mouseY >= 635 && mouseY <= 695) {
      rectangle = false;
    }
    //rect(65, 105, 360, 590);
    if (mouseX >= 65 && mouseX <= 425 && mouseY >= 105 && mouseY <= 695 && rectangle == true) {
      mode = "race";
    } else if (mouseX >= 445 && mouseX <= 805 && mouseY >= 105 && mouseY <= 695 && rectangle == true) {
      mode = "customize";
    }
  }
}
