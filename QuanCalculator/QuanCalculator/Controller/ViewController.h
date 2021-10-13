//
//  ViewController.h
//  QuanCalculator
//
//  Created by Nguyễn Trịnh Hồng Quân on 12/10/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    double firstNumber;
    double secondNumber;
    double total;
    
    NSString *fomular;
    NSString *lastButton;
}
@property (strong, nonatomic) IBOutlet UILabel *resultLable;
@property (strong, nonatomic) IBOutlet UIView *mainScreen;
@end
