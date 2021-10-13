//
//  PageViewController.m
//  photoview
//
//  Created by Bao on 12/10/2021.
//

#import "PageViewController.h"
#import "ViewController.h"
#import "PageDelegate.h"

@interface PageViewController () <PageDelegateDelegate>

{
    NSArray *avatar;
}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    avatar = @[@"image1",@"image2",@"image3",@"image4",@"image5",@"image6",@"image7",@"image8",@"image9",@"image10"];
    self.dataSource = self;
    [self viewImage: 0];
}

-(void)viewImage: (NSUInteger)index {
    ViewController *initialVC = (ViewController *)[self viewControllerAtIndex: index];
    NSArray *viewController = [NSArray arrayWithObject:initialVC];
    [self setViewControllers: viewController direction:UIPageViewControllerNavigationDirectionForward animated: NO completion:nil];
    
}

-(UIViewController *) viewControllerAtIndex: (NSUInteger)index{
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.delegate = self;
    viewController.strImage = avatar[index];
    viewController.pageIndex = (NSUInteger*)index;
    viewController.indexImage = index;
    return viewController;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = (NSUInteger)((ViewController *) viewController).pageIndex;
    _indexImagePage = index;
    if(index == 0 || index == NSNotFound) {
        return  nil;
    }
    index--;
    return  [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = (NSUInteger)((ViewController *) viewController).pageIndex;
    _indexImagePage = index;
    if(index == NSNotFound) {
        return  nil;
    }
    index++;
    if (index == avatar.count) {
        return nil;
    }
    return  [self viewControllerAtIndex:index];
}

- (void) leftImage:() sender
{
    _indexImagePage--;
    
    if (_indexImagePage >= 0) {
        [self viewImage: _indexImagePage];
    } else {
        _indexImagePage = 0;
    }
}

- (void) rightImage:() sender
{
    _indexImagePage++;
    if (_indexImagePage <= avatar.count-1) {
        [self viewImage: _indexImagePage];
    } else {
        _indexImagePage = avatar.count-1;
    }
}

@end
