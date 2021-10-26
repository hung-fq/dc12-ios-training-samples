//
//  PageViewController.h
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface PageViewController : UIPageViewController <UIPageViewControllerDataSource, NSXMLParserDelegate, didClickOnNextButton, didClickOnPreviousButton>
@property (nonatomic,strong) NSMutableArray *imagesArray;
@property (nonatomic,strong) NSString *imageName;
@property NSUInteger pageIndex;
@end

