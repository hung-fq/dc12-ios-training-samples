//
//  ViewController.h
//  TPhotoViewer
//
//  Created by admin on 2021/10/11.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface ViewController : UIViewController<UIScrollViewDelegate> {
    int _currentIndex;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) NSMutableArray *cars;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnPrevious;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnNext;


- (IBAction)btnPreviousPressed:(id)sender;
- (IBAction)btnNextPressed:(id)sender;

@end

