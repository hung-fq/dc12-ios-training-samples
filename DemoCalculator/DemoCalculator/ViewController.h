//
//  ViewController.h
//  DemoCalculator
//
//  Created by Bao on 11/10/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    NSInteger total;
    NSString  *valueString;
    BOOL lastButtonWasMode;
    NSInteger mode;
}
@property (strong, nonatomic) IBOutlet UILabel *labelText;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@end

