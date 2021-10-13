//
//  ViewController.m
//  VPhotoview
//
//  Created by LyThienVuong on 12/10/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize photoScrollView;
int numImages = 0;
CGFloat scrollHeight = 0;
CGFloat scrollWidth  = 0;
UIImageView *imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    photoScrollView.scrollEnabled = YES;
    photoScrollView.pagingEnabled = YES;
    
    [self loadImageViewToScrollView];
    [self setPositionImageViewOnScrollView];
}

- (void)loadImageViewToScrollView {
    scrollHeight = self.view.frame.size.height;
    scrollWidth = self.view.frame.size.width;
    
    for(int i = 1; i <= 5; i++){
        NSString *imageName = [NSString stringWithFormat:@"image%i.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if(image==nil)
            break;
        
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
        [zoomScroll setContentOffset:CGPointMake(0, -50)];
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


@end
