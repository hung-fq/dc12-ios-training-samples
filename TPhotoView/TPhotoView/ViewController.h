//
//  ViewController.h
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property NSString *imageName;
@property NSUInteger pageIndex;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

