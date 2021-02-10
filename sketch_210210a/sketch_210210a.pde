PImage img;
PImage redchannel;
PImage bluechannel;
PImage greenchannel;
float p=0;


void setup()
{
 //size(1920, 1080);
 img = loadImage("a.jpg");
 redchannel = loadImage("a.jpg");
 bluechannel = loadImage("a.jpg");
 greenchannel = loadImage("a.jpg");
 //image(img, 0, 0);
 p=img.height*img.width;
 noLoop();
}

int index(int x, int y)
{
  return x+y*img.width;
}

void draw()
{
img.loadPixels();
float c=0;
for(int j=0; j<img.height; j++){
  for(int i=0; i<img.width; i++){
    
    color pix = img.pixels[index(i, j)];
    float r=red(pix);
    float g=green(pix);
    float b=blue(pix);
    redchannel.pixels[index(i,j)]=color(r,0.0f,0.0f);
    greenchannel.pixels[index(i,j)]=color(0.0f,g,0.0f);
    bluechannel.pixels[index(i,j)]=color(0.0f,0.0f,b);
    
    ++c;
    System.out.println(c/p*100+"%");
    if(c==p){
      System.out.println("Done!!");
    } 

}
}
redchannel.updatePixels();
greenchannel.updatePixels();
bluechannel.updatePixels();

redchannel.save("redcahnnel.png");
greenchannel.save("greencahnnel.png");
bluechannel.save("bluecahnnel.png");


}
