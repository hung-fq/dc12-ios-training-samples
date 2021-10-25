//
//  ViewController.h
//  QuanPhotoView
//
//  Created by Nguyễn Trịnh Hồng Quân on 14/10/2021.
//

#import <UIKit/UIKit.h>
#import "PageDelegateProtocol.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) id <PageDelegateProtocol> delegate;
@property NSString *imageName;
@property NSUInteger imageIndex;
@property NSUInteger *pageIndex;

@end

