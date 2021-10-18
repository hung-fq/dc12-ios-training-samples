//
//  ViewController.m
//  photoview
//
//  Created by Bao on 12/10/2021.
//

#import "ViewController.h"
#import "PageViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avataimage;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;

@end

@implementation ViewController

#pragma mark - Define const

static double maximumZoom = 3.0;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.avataimage.image = [UIImage imageNamed: _strImage];
    float minScale=_bgScrollView.frame.size.width / _avataimage.frame.size.width;
    _bgScrollView.minimumZoomScale = minScale;
    _bgScrollView.maximumZoomScale = maximumZoom;
    _bgScrollView.contentSize = _avataimage.frame.size;
    _bgScrollView.delegate = self;
}

#pragma mark - Method

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _avataimage;
}

#pragma mark - IBActions

- (IBAction)didTapButtonLeft:(id)sender {
    [self.delegate leftImage:self];
    
}

- (IBAction)didTapButtonRight:(id)sender {
    [self.delegate rightImage:self];
}

@end

