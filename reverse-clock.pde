import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;


PFont font;
PImage bg;

void setup(){
  bg = loadImage("bg.jpg");
  background(0);
  fullScreen();
  
  font = loadFont("MS-PGothic-96.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw(){
  image(bg, 0, 0, width, height);
  fill(0,0,0);
  textSize(width/5);
  text(setTime(), width/2, height/2); 
}

String setTime(){
  Calendar dayEnd = Calendar.getInstance();
  Calendar tmp = Calendar.getInstance();
  tmp.add(Calendar.DAY_OF_MONTH, 1);
  dayEnd.set(tmp.get(Calendar.YEAR), tmp.get(Calendar.MONTH), tmp.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
  long dayEndTime = dayEnd.getTimeInMillis() / 1000L;
  long nowTime = System.currentTimeMillis() / 1000L;
  long diffTime = dayEndTime - nowTime;
  
  int hour = (int)(diffTime / 3600);
  int min = (int)(diffTime / 60 % 60);
  int sec = (int)(diffTime % 60 % 60);
  
  return "" + String.format("%02d",hour) + ":" + String.format("%02d",min) + ":" + String.format("%02d",sec);
}