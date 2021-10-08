//
//  ViewController.m
//  TCalculator
//
//  Created by admin on 2021/10/05.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize num1, num2, answer, operand, theNumber, lblText, containerView, rootView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
       addObserver:self selector:@selector(orientationChanged:)
       name:UIDeviceOrientationDidChangeNotification
       object:[UIDevice currentDevice]];
    
    [self setNum1:0];
    [self setNum2:0];
    [self setOperand:PLUS];
    [self setAnswer:0.0];
    [self setTheNumber:@"0"];
    
    [self printNumber];
    
}
- (void) orientationChanged:(NSNotification *)note
{
   UIDevice * device = note.object;
   switch(device.orientation)
   {
       case UIDeviceOrientationPortrait:
           rootView.backgroundColor = [UIColor whiteColor];
           NSLog(@"In portrait");
       break;

       case UIDeviceOrientationPortraitUpsideDown:
           rootView.backgroundColor = [UIColor greenColor];
           NSLog(@"In Landscape");

       break;

       default:
       break;
   };
}

-(void)printNumber
{
    [lblText setText:theNumber];
}
-(void)saveNum1
{
    num1 = [theNumber integerValue];
    theNumber = @"0";
    //[lblText setText:theNumber];
}
-(void)checkNum
{
    if ([theNumber isEqualToString:@"0"])
    {
        theNumber = @"";
    }
}
-(IBAction)calculate:(id)sender
{
    num2 = [theNumber integerValue];
    if (operand == PLUS) {
        answer = num1 + num2;
    } else if (operand == MINUS) {
        answer = num1 - num2;
    } else if (operand == MULTIPLY) {
        answer = num1 * num2;
    } else {
        if (num2 == 0) {
            UIAlertController * alert = [UIAlertController
                            alertControllerWithTitle:@"Error"
                                             message:@"Cannot devide by zero!"
                                      preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* noButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                               //Handle no, thanks button
                                            }];

            [alert addAction:noButton];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            answer = (double)num1/(double)num2;
        }
        
    }
    theNumber = [NSString stringWithFormat:@"%f", answer];
    [self printNumber];
    num1 = 0;
    num2 = 0;
    answer = 0.0;
    theNumber = @"0";
    
}
-(IBAction)clearNum:(id)sender
{
    theNumber = @"0";
    [self printNumber];
}
-(IBAction)setPlus:(id)sender
{
    [self saveNum1];
    operand = PLUS;
}
-(IBAction)setMinus:(id)sender
{
    [self saveNum1];
    operand = MINUS;
}
-(IBAction)setMultiply:(id)sender
{
    [self saveNum1];
    operand = MULTIPLY;
}
-(IBAction)setDevide:(id)sender
{
    [self saveNum1];
    operand = DIVIDE;
}

-(IBAction)press9:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"9"];
    [self printNumber];
}
-(IBAction)press8:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"8"];
    [self printNumber];
}
-(IBAction)press7:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"7"];
    [self printNumber];
}
-(IBAction)press6:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"6"];
    [self printNumber];
}
-(IBAction)press5:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"5"];
    [self printNumber];
}
-(IBAction)press4:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"4"];
    [self printNumber];
}
-(IBAction)press3:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"3"];
    [self printNumber];
}
-(IBAction)press2:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"2"];
    [self printNumber];
}
-(IBAction)press1:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"1"];
    [self printNumber];
}
-(IBAction)press0:(id)sender
{
    [self checkNum];
    theNumber = [theNumber stringByAppendingString:@"0"];
    [self printNumber];
}


@end
