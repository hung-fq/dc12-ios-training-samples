//
//  ViewController.h
//  photoview
//
//  Created by Bao on 12/10/2021.
//

#import <UIKit/UIKit.h>
#import "PageDelegate.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *avataimage;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;

@property NSString *strImage;
@property NSUInteger *pageIndex;
@property NSUInteger indexImage;

@property (nonatomic, weak) id <PageDelegateDelegate> delegate;

@end

