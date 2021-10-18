//
//  ViewController.h
//  photoview
//
//  Created by Bao on 12/10/2021.
//

#import <UIKit/UIKit.h>
#import "PageDelegate.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) id <PageDelegateDelegate> delegate;
@property NSString *strImage;
@property NSUInteger *pageIndex;
@property NSUInteger indexImage;

@end

