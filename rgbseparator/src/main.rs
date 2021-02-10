use image::{DynamicImage, GenericImageView, io::Reader as ImageReader};
use rayon::iter::{IndexedParallelIterator, IntoParallelRefIterator, IntoParallelRefMutIterator, ParallelIterator};

fn main() {
    let img=ImageReader::open("b.jpg").unwrap()
    .decode()
    .unwrap();

    
    let mut red = DynamicImage::new_rgb8(img.width(), img.height());
    let red=red.as_mut_rgb8().unwrap();

    let mut green = DynamicImage::new_rgb8(img.width(), img.height());
    let green=green.as_mut_rgb8().unwrap();

    let mut blue = DynamicImage::new_rgb8(img.width(), img.height());
    let blue=blue.as_mut_rgb8().unwrap();
    
    let buf=match &img {
        image::DynamicImage::ImageRgb8(rgba) => rgba.as_raw(),
        img=>{
            panic!()
        },
    };

    let redIter=red.as_mut().par_iter_mut().chunks(3);
    let greenIter=green.as_mut().par_iter_mut().chunks(3);
    let blueIter=blue.as_mut().par_iter_mut().chunks(3);
    
    
    println!("Started copying");

    buf.par_iter().chunks(3).zip(redIter).zip(greenIter).zip(blueIter).for_each(
        |(((orig,mut red),mut green),mut blue)|{
            *red[0]=*orig[0];
            *blue[1]=*orig[1];
            *green[2]=*orig[2];
        }
    );

    red.save("red.png").unwrap();
    green.save("green.png").unwrap();
    blue.save("blue.png").unwrap();
}
