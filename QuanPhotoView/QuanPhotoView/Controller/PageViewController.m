//
//  PageViewController.m
//  QuanPhotoView
//
//  Created by Nguyễn Trịnh Hồng Quân on 21/10/2021.
//

#import "PageViewController.h"
#import "ViewController.h"
#import "PageDelegateProtocol.h"

@interface PageViewController () <PageDelegateProtocol>

@property (nonatomic) NSArray *listImages;
@property NSInteger indexImagePage;

@end

@implementation PageViewController

#pragma mark - Define const

static int const zeroValue = 0;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listImages = @[@"img1", @"img2", @"img3",
                        @"img4", @"img5", @"img6",
                        @"img7", @"img8", @"img9",
                        @"img10"];
    self.dataSource = self;
    [self viewImage: zeroValue];
}

#pragma mark - Method

- (void)viewImage: (NSUInteger)pageIndex {
    ViewController *viewController = (ViewController *)[self getViewControllerByPageIndex: pageIndex];
    NSArray *arrayViewController = [NSArray arrayWithObject:viewController];
    [self setViewControllers: arrayViewController direction:UIPageViewControllerNavigationDirectionForward animated: NO completion:nil];
}

- (UIViewController *)getViewControllerByPageIndex: (NSUInteger)pageIndex {
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.delegate = self;
    viewController.imageName = self.listImages[pageIndex];
    viewController.pageIndex = (NSUInteger*)pageIndex;
    viewController.imageIndex = pageIndex;
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    self.indexImagePage = (NSUInteger)((ViewController *) viewController).pageIndex;
    if(self.indexImagePage == NSNotFound ||
       self.indexImagePage <= zeroValue) {
        return nil;
    }
    return [self getViewControllerByPageIndex:self.indexImagePage - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    self.indexImagePage = (NSUInteger)((ViewController *) viewController).pageIndex;
    if(self.indexImagePage == NSNotFound ||
       self.indexImagePage == self.listImages.count + 1) {
        return nil;
    }
    return [self getViewControllerByPageIndex:self.indexImagePage + 1];
}

- (void)leftImage:() sender {
    self.indexImagePage--;
    if (self.indexImagePage >= zeroValue) {
        [self viewImage: self.indexImagePage];
    } else {
        self.indexImagePage = zeroValue;
    }
}

- (void)rightImage:() sender {
    self.indexImagePage++;
    if (self.indexImagePage <= self.listImages.count - 1) {
        [self viewImage: self.indexImagePage];
    } else {
        self.indexImagePage = self.listImages.count - 1;
    }
}

@end
