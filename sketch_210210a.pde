PImage img;
PImage redchannel;
PImage bluechannel;
PImage greenchannel;
int i=1;

void setup()
{
 //size(1920, 1080);
 img = loadImage("test2.png");
 redchannel = loadImage("test2.png");
 bluechannel = loadImage("test2.png");
 greenchannel = loadImage("test2.png");
 //image(img, 0, 0);
}

int index(int x, int y)
{
  return x+y*img.width;
}

void draw()
{
img.loadPixels();
for(int j=0; j<img.height-1; j++){
  for(int i=1; i<img.width-1; i++){
    
    color pix = img.pixels[index(i, j)];
    float r=red(pix);
    float g=green(pix);
    float b=blue(pix);
    redchannel.pixels[index(i,j)]=color(r,0.0f,0.0f);
    greenchannel.pixels[index(i,j)]=color(0.0f,g,0.0f);
    bluechannel.pixels[index(i,j)]=color(0.0f,0.0f,b);

}
}
redchannel.updatePixels();
greenchannel.updatePixels();
bluechannel.updatePixels();
if(i<2){
redchannel.save("redcahnnel.png");
greenchannel.save("greencahnnel.png");
bluechannel.save("bluecahnnel.png");
}
++i;
}
