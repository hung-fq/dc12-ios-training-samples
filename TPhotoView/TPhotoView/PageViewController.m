//
//  PageViewController.m
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()
    @property NSArray *cars;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cars = @[@"ferrari",@"lamborghini",@"toyota",@"ford",@"bmw",@"mercedes",@"audi",@"lexus",@"hyundai",@"vinfast"];
    self.dataSource = self;
    ViewController *initVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (UIViewController *) viewControllerAtIndex: (NSUInteger) index {
    NSLog(@"viewControllerAtIndex");

    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.imageName = self.cars[index];
    viewController.pageIndex = index;
    return viewController;
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    NSLog(@"viewControllerAfterViewController");
    if (index == NSNotFound) {
        return  nil;
    }
    index ++;
    if (index == [self.cars count]) {
        return  nil;
    }
    return [self viewControllerAtIndex:index];
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    NSLog(@"viewControllerBeforeViewController");
    if (index == 0 || index == NSNotFound) {
        return  nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

@end
