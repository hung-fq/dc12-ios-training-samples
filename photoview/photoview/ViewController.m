//
//  ViewController.m
//  photoview
//
//  Created by Bao on 12/10/2021.
//

#import "ViewController.h"
#import "PageViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avataimage.image = [UIImage imageNamed: _strImage];
    
    float minScale=_bgScrollView.frame.size.width / _avataimage.frame.size.width;
    _bgScrollView.minimumZoomScale = minScale;
    _bgScrollView.maximumZoomScale = 3.0;
    _bgScrollView.contentSize = _avataimage.frame.size;
    _bgScrollView.delegate = self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _avataimage;
}


- (IBAction)didTapButtonLeft:(id)sender {
    [self.delegate leftImage:self];
    
}

- (IBAction)didTapButtonRight:(id)sender {
    [self.delegate rightImage:self];
}

@end

