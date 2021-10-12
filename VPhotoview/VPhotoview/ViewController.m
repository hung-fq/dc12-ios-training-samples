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
CGFloat kScrollObjHeight = 480.0;
CGFloat kScrollObjWidth  = 320.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [photoScrollView setBackgroundColor:[UIColor blackColor]];
    [photoScrollView setCanCancelContentTouches:YES];
    photoScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    photoScrollView.clipsToBounds = YES;
    photoScrollView.scrollEnabled = YES;
    photoScrollView.pagingEnabled = YES;
    [self loadImageToScrollView];
    [self setPositionImageToScrollView];
}

- (void)loadImageToScrollView {
    kScrollObjHeight = self.view.frame.size.height;
    kScrollObjWidth = self.view.frame.size.width;
    
    for(int i = 1; i <= 5; i++){
        NSString *imageName = [NSString stringWithFormat:@"image%i.jpg", i];
        NSLog(@"++++++++++Image name: %@", imageName);
        
        UIImage *image = [UIImage imageNamed:imageName];
        if(image==nil)
            break;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [photoScrollView addSubview:imageView];
        
        CGRect sizemageView = imageView.frame;
        NSLog(@"++++++++++Image size before: width: %f height: %f", sizemageView.size.width, sizemageView.size.height);
        sizemageView.size.height = kScrollObjHeight;
        sizemageView.size.width = kScrollObjWidth;
        imageView.frame = sizemageView;
        NSLog(@"++++++++++Image size after: width: %f height: %f", kScrollObjHeight, kScrollObjWidth);
        
        imageView.tag = i;
        photoScrollView.tag = i;
        numImages++;
    }
}

-(void)setPositionImageToScrollView {
    UIImageView *imageView = nil;
    NSArray *subPhotoView = [photoScrollView subviews];
    CGFloat curLocation = 0;
    
    for (imageView in subPhotoView) {
        if([imageView isKindOfClass:[UIImageView class]] && imageView.tag > 0) {
            CGRect newFrame = imageView.frame;
            newFrame.origin = CGPointMake(curLocation, 0);
            imageView.frame = newFrame;
            curLocation +=kScrollObjWidth;
        }
    }
    [photoScrollView setContentSize:CGSizeMake((numImages * kScrollObjWidth), photoScrollView.bounds.size.height)];
}

- (IBAction)keyNext:(id)sender {
}

- (IBAction)keyPrevious:(id)sender {
}


@end
