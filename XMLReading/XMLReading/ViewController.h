//
//  ViewController.h
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import <UIKit/UIKit.h>

@protocol didClickOnNextButton <NSObject>
-(void)clickNextRegconize;
@end

@protocol didClickOnPreviousButton <NSObject>
-(void)clickPreviousRegconize;
@end

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property NSString *imageName;
@property NSUInteger pageIndex;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) id <didClickOnNextButton> goNextDelegate;
@property (weak, nonatomic) id <didClickOnPreviousButton> goPreviousDelegate;


@end

