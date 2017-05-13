PImage img, tempImg;

int sections = 7;

PImage[] smallImages = new PImage[sections*sections];
MiniImage[] imgs = new MiniImage[sections*sections];

void setup() {
  size(1000, 1000);

  imageMode(CENTER);
  img = loadImage("data/Mithru-sq.jpg");
  img.loadPixels();


  for (int x = 0; x < sections; x++) {
    for (int y = 0; y < sections; y++) {
      smallImages[y*sections + x] = createImage(img.width/sections+1, img.height/sections+1, RGB);
      //smallImages[0].loadPixels();
      smallImages[y*sections + x].copy(img, x*img.width/sections, y*img.height/sections, img.width/sections+1, img.height/sections+1, 0, 0, img.width/sections+1, img.height/sections+1);
      imgs[y*sections + x] = new MiniImage( smallImages[y*sections + x], x*img.width/sections + smallImages[y*sections + x].width/2, y*img.height/sections + smallImages[y*sections + x].height/2, 0);
    }
  }


  for (int x = 0; x < sections; x++) {
    for (int y = 0; y < sections; y++) {
      imgs[y*sections + x].display();
    }
  }
}

void draw() {
}

void mouseClicked() {
  
  int randomIndex = int(random(sections*sections));
  imgs[randomIndex].flip();
  imgs[randomIndex].display();
  
  println(randomIndex);

  saveFrame("ss-" + count++ + ".png");
}

int count = 0;