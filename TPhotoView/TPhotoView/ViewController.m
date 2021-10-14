//
//  ViewController.m
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:self.imageName];
    
    //Zoom
    self.scrollView.maximumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 3.0;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.delegate = self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (IBAction)btnNextPress:(id)sender {
    //TODO - implement for Next button
}

- (IBAction)btnPreviousPress:(id)sender {
    //TODO - implement for Previous button
}
@end
