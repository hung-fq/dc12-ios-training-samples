//
//  ViewController.m
//  VXmlPhoto
//
//  Created by LyThienVuong on 20/10/2021.
//

#import "ViewController.h"
#import "XMLParser.h"
#import "Magazine.h"

@interface ViewController () {
    NSInteger numImages;
    CGFloat scrollHeight;
    CGFloat scrollWidth;
    UIImageView *imageView;
}
@property (nonatomic, retain) NSMutableArray *magArray;
@property (weak, nonatomic) IBOutlet UIScrollView *photoScrollView;
- (IBAction)tapPre:(id)sender;
- (IBAction)tapNext:(id)sender;
@end

@implementation ViewController
@synthesize magArray, photoScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scrollHeight = self.view.frame.size.height;
    scrollWidth = self.view.frame.size.width;
    
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"magazine" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:xmlPath];
    if (xmlData == nil) {
        return;
    }
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    XMLParser *xmlMargazineParser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:xmlMargazineParser];
    BOOL result = [xmlParser parse];

    if (!result) {
        return;
    } else {
        photoScrollView.clipsToBounds = YES;
        photoScrollView.scrollEnabled = YES;
        photoScrollView.pagingEnabled = YES;
        magArray = [xmlMargazineParser arrMagazine];


        for(int i = 0; i < [magArray count]; i++) {
            Magazine *mag = (Magazine*)[magArray objectAtIndex:i];
            NSString *magThumb = mag.magThumb;
            NSString *imgName = [NSString stringWithFormat:@"%@", magThumb];
            UIImage *image = [UIImage imageNamed:imgName];

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
        [self setPositionImageViewOnScrollView];
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

- (IBAction)tapNext:(id)sender {
    if([photoScrollView contentOffset].x == scrollWidth*(numImages - 1)){
        return;
    }
    photoScrollView.contentOffset = CGPointMake([photoScrollView contentOffset].x + scrollWidth, [photoScrollView contentOffset].y);
}

- (IBAction)tapPre:(id)sender {
    if([photoScrollView contentOffset].x == 0){
        return;
    }
    photoScrollView.contentOffset = CGPointMake([photoScrollView contentOffset].x - scrollWidth, [photoScrollView contentOffset].y);
}
@end
