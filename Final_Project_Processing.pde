import processing.serial.*;

Serial port;
PFont t,x;
boolean c = false;
int y;
String typing = "";
String saved = "";
String saved1 = "";
String saved2 = "";
String saved3 = "";

void setup(){
  size(600,600);
  frameRate(10);
  port = new Serial(this, Serial.list()[0],9600);
  t = createFont("Calibri",20,true);
  x = createFont("Calibri Bold",20,true);
}

void draw(){
  if (c == false) {
    background(10,91,196);
  }
  else {
    background(255,0,0);
  }
  
  textFont(t,30);
  fill(255);
  text("Sistem Peringatan Dini",10,35);
  
  textFont(t,20);
  text("Keadaan Sistem :",30,222);
  
  if (c == false) {  
    text("AMAN",175,222);
  }
  else {
    text("BAHAYA",175,222);
  }
  
  if (c == true) {
    textFont(t,15);
    text("Keterangan:",30,400);
    text(typing,30,415);
    text(saved,30,435);
    text(saved1,30,455);
    text(saved2,30,475);
    text(saved3,30,495);
  }
  
  noStroke();
  fill(225);
  ellipse(500,222,100,100);
  
  textFont(x,15);
  if (c == false) {
    fill(255,0,0);
    text("BAHAYA",475,225);
  }
  else {
    fill(10,91,196);
    text("KEMBALI",472,220);
    text("AMAN",480,240);
  }
  
  if ((mousePressed == true) && (sqrt(sq(mouseX-500)+sq(mouseY-222))<50)) {
    y = 1;
  }
  if ((mousePressed == false) && (sqrt(sq(mouseX-500)+sq(mouseY-222))<50) && (y == 1)) {
    c = !c;
    y = 0;
    if (c == false) {
      typing = "";
      saved = "";
      saved1 = "";
      saved2 = "";
      saved3 = "";
    }
  } 
  else if (mousePressed == false) {
    y = 0;
  }
  
  if (c == false) {
    port.write('L');
  }
  else if (c == true) {
    port.write('H');
  }
}

void keyPressed() {
  if (key == '\n') {
    saved3 = saved2;
    saved2 = saved1;
    saved1 = saved;
    saved = typing;
    typing = "";
  }
  else {
    typing = typing + key;
  }
}