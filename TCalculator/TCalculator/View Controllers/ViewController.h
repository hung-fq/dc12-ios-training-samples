//
//  ViewController.h
//  TCalculator
//
//  Created by admin on 2021/10/05.
//

#import <UIKit/UIKit.h>

#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3

@interface ViewController : UIViewController

@property NSInteger num1;
@property NSInteger num2;
@property double answer;

@property NSInteger operand;
@property (strong, nonatomic) NSString *theNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblText;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (strong, nonatomic) IBOutlet UIView *containerView;


@end

