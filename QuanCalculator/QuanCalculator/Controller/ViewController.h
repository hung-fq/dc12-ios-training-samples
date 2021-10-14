//
//  ViewController.h
//  QuanCalculator
//
//  Created by Nguyễn Trịnh Hồng Quân on 12/10/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) double firstNumber;
@property (nonatomic) double secondNumber;
@property (nonatomic) double total;

@property (strong, nonatomic) NSString *fomular;
@property (strong, nonatomic) NSString *lastButton;

@property (strong, nonatomic) IBOutlet UILabel *resultLable;
@property (strong, nonatomic) IBOutlet UIView *mainScreen;
@end
