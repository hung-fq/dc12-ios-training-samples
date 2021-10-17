//
//  ViewController.m
//  VPhotoview
//
//  Created by LyThienVuong on 12/10/2021.
//

#import "ViewController.h"

@interface ViewController () {
    NSInteger numImages;
    CGFloat scrollHeight;
    CGFloat scrollWidth;
    UIImageView *imageView;
    NSArray *nameImage;
}
@property (weak, nonatomic) IBOutlet UIScrollView *photoScrollView;
@end

@implementation ViewController
@synthesize photoScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    photoScrollView.scrollEnabled = YES;
    photoScrollView.pagingEnabled = YES;
    numImages = [nameImage count];
    nameImage = @[@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg", @"image5.jpg", @"image6.jpg", @"image7.jpg", @"image8.jpg", @"image9.jpg", @"image10.jpg"];
    scrollHeight = self.view.frame.size.height;
    scrollWidth = self.view.frame.size.width;
    [self loadImageViewToScrollView];
    [self setPositionImageViewOnScrollView];
}

- (void)loadImageViewToScrollView {
    for(int i = 0; i <= nameImage.count - 1; i++){
        NSString *imageName = [nameImage objectAtIndex:i];
        UIImage *image = [UIImage imageNamed:imageName];
        
        // Create imageView and add image
        imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        CGRect sizeImageView = imageView.frame;
        sizeImageView.size.height = scrollHeight;
        sizeImageView.size.width = scrollWidth;
        imageView.frame = sizeImageView;
        imageView.tag = i;
        
        // Create zoom scroll to add imageview
        UIScrollView *zoomScroll = [[UIScrollView alloc] init];
        zoomScroll.frame = imageView.frame;
        [zoomScroll setContentSize:CGSizeMake(scrollWidth, scrollHeight)];
        zoomScroll.minimumZoomScale = 1.0;
        zoomScroll.maximumZoomScale = 2.0;
        zoomScroll.tag = i;
        zoomScroll.delegate = self;
        [zoomScroll addSubview:imageView];
        [photoScrollView addSubview:zoomScroll];
        numImages++;
    }
}

-(void)setPositionImageViewOnScrollView {
    NSArray *subPhotoView = [photoScrollView subviews];
    CGFloat curLocation = 0;
    
    for (UIImageView *imageView in subPhotoView) {
        if([imageView isKindOfClass:[UIScrollView class]]) {
            CGRect newFrame = imageView.frame;
            newFrame.origin = CGPointMake(curLocation, 0);
            imageView.frame = newFrame;
            curLocation +=scrollWidth;
        }
    }
    [photoScrollView setContentSize:CGSizeMake((numImages * scrollWidth), photoScrollView.bounds.size.height)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
}

- (IBAction)keyNext:(id)sender {
    if([photoScrollView contentOffset].x == scrollWidth*(numImages - 1)){
        return;
    }
    photoScrollView.contentOffset = CGPointMake([photoScrollView contentOffset].x + scrollWidth, [photoScrollView contentOffset].y);
}

- (IBAction)keyPrevious:(id)sender {
    if([photoScrollView contentOffset].x == 0){
        return;
    }
    photoScrollView.contentOffset = CGPointMake([photoScrollView contentOffset].x - scrollWidth, [photoScrollView contentOffset].y);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {

}

@end
