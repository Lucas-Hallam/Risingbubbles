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
