ArrayList <Bubble> FullBubbleList = new ArrayList <Bubble>();
ArrayList <Bubble> BubbleList = new ArrayList <Bubble>();
int bNum = 0;
int index = 30;
void setup() {
  size(750, 750);
  background(255);
  noStroke();
}
void draw() {
  if (index == 30) {
    Bubble BubbleNew = new Bubble();
    FullBubbleList.add(BubbleNew);
    index = 0;
  }
  boolean removed;
  index++;
  background(255);
  for (int j = 0; j < FullBubbleList.size(); j++) {
    BubbleList.add(FullBubbleList.get(j));
  }  
  for (int i = 0; i < FullBubbleList.size(); i++) {
    removed = false;
    FullBubbleList.get(i).move();
    if (FullBubbleList.get(i).bubbleSize + FullBubbleList.get(i).myY <= 0) {
      FullBubbleList.remove(i);
      removed = true;
      i--;
    }
    BubbleList.remove(0);
    if (removed == false) {
      for (int j = 0; j < BubbleList.size(); j++) {
        if (FullBubbleList.get(i).checkCollision(BubbleList.get(j)) == true) {
          FullBubbleList.get(i).pop();
          FullBubbleList.get(i+j+1).pop();
        }
      }
      FullBubbleList.get(i).show();
      if (FullBubbleList.get(i).popped == true) {
        FullBubbleList.remove(i);
        i--;
      }
    }
    bNum = FullBubbleList.size();
    stroke(8);
    fill(0);
    text("Number of Bubbles: " + bNum, 50, 50);
    noStroke();
  }
}
class Bubble {
  
  float  myX, myY, bubbleSize,bubbleSpeed;
  color bubbleColor;
  boolean popped;
  Bubble() {
    myX = (float)(500*Math.random());
    myY = 750;
    bubbleSize = 25+(float)(80*Math.random());
    bubbleSpeed = (bubbleSize)/40;
    bubbleColor = color((float)(255*Math.random()), (float)(255*Math.random()), (float)(255*Math.random()), (float)(250-2*bubbleSize));
  }
  void move() {
    myY = myY - bubbleSpeed;
    myX = myX + (float)(9*Math.random()-4);
  }
  void pop() {
    popped = true;
    bubbleSize = 0;
  }
  void show() {
    fill(bubbleColor);
    ellipse(myX, myY, bubbleSize, bubbleSize);
  }
  boolean checkCollision(Bubble Bubble1) { 
    if (dist(myX, myY, Bubble1.myX, Bubble1.myY) <= (bubbleSize+Bubble1.bubbleSize)/2) {
      return true;
    }
    return false;
  }
}
