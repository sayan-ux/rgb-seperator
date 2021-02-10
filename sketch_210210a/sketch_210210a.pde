PImage img;
PImage redchannel;
PImage bluechannel;
PImage greenchannel;
int p=0;

static String fileName="b.jpg";
static long lastTime=0;
void setup()
{
 //size(1920, 1080);
 img = loadImage(fileName);
 redchannel = loadImage(fileName);
 bluechannel = loadImage(fileName);
 greenchannel = loadImage(fileName);
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
int c=0;
    for(int i=0;i<img.width*img.height;i++){
    color pix = img.pixels[i];
    float r=red(pix);
    float g=green(pix);
    float b=blue(pix);
    redchannel.pixels[i]=color(r,0.0f,0.0f);
    greenchannel.pixels[i]=color(0.0f,g,0.0f);
    bluechannel.pixels[i]=color(0.0f,0.0f,b);
    
    ++c;
    
    long now=System.currentTimeMillis();
    
    if(now-lastTime>=1 * 1000) {
      System.out.println((float)c/p*100+"%");
      lastTime=now;
    }
    
    if(c==p){
      System.out.println("Done!!");
    }

}
redchannel.updatePixels();
greenchannel.updatePixels();
bluechannel.updatePixels();

System.out.println("Started writing");
redchannel.save("redcahnnel.png");
greenchannel.save("greencahnnel.png");
bluechannel.save("bluecahnnel.png");
System.out.println("Ended writing");

}
