class MiniImage{
  float rotation;
  int x,y;
  
  PImage img;
  
  MiniImage(PImage i, int x, int y, float r){
    this.img = i;
    this.x = x;
    this.y = y;
    this.rotation = r;
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    rotate(this.rotation);
    image(img, 0,0);
    popMatrix();
  }
  
  void flip(){
    this.rotation += (PI*int(random(-10,10)));
  }

}