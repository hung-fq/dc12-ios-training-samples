//
//  ViewController.m
//  QuanPhotoView
//
//  Created by Nguyễn Trịnh Hồng Quân on 14/10/2021.
//

#import "ViewController.h"
#import "PageDelegateProtocol.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark - Define const

static double maxZoomLimit = 3.0;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed: self.imageName];
    float minZoomLimit = self.scrollView.frame.size.width / self.imageView.frame.size.width;
    self.scrollView.minimumZoomScale = minZoomLimit;
    self.scrollView.maximumZoomScale = maxZoomLimit;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.delegate = self;
}

#pragma mark - Method

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - IBActions

- (IBAction)onClickLeftButton:(id)sender {
    [self.delegate leftImage:self];
}

- (IBAction)onClickRightButton:(id)sender {
    [self.delegate rightImage:self];
}

@end
