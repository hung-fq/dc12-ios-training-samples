//
//  ViewController.m
//  QuanCalculator
//
//  Created by Nguyễn Trịnh Hồng Quân on 12/10/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resultLable.text = @"0";
    _mainScreen.backgroundColor = [UIColor blueColor];
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [self setbackground];
}

- (void)setbackground {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft ||
        [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        _mainScreen.backgroundColor = [UIColor redColor];
    }
    else {
        _mainScreen.backgroundColor = [UIColor blueColor];
    }
}

- (NSString *)parseNumberToString:(double) number
{
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:number];
    return [myDoubleNumber stringValue];
}

//Handle method

- (void)handleNumber:(NSInteger ) num
{
    if([lastButton isEqual: @"num"]) {
        if(secondNumber > 0) {
            secondNumber = secondNumber*10 + num;
            _resultLable.text = [self parseNumberToString:secondNumber];
        } else if (firstNumber > 0) {
            firstNumber = firstNumber*10 + num;
            _resultLable.text = [self parseNumberToString:firstNumber];
        }
    } else if ([lastButton isEqual: @"="]) {
        [self resetAll];
        firstNumber = num;
        _resultLable.text = [self parseNumberToString:num];
    } else if ([lastButton isEqual: @"fomular"]) {
        secondNumber = num;
        _resultLable.text = [self parseNumberToString:num];
    } else {
        _resultLable.text = [self parseNumberToString:num];
        firstNumber = num;
    }
    lastButton = @"num";
}

- (double)handleTotal
{
    if([fomular  isEqual: @"+"]) {
        total = firstNumber + secondNumber;
    } else if ([fomular  isEqual: @"-"]) {
        total = firstNumber - secondNumber;
    } else if ([fomular  isEqual: @"*"]) {
        total = firstNumber * secondNumber;
    } else if ([fomular  isEqual: @"/"]) {
        total = firstNumber / secondNumber;
    }
    return total;
}

- (void)handleFomular
{
    lastButton = fomular;
    if(total > 0) {
        firstNumber = total;
        secondNumber = 0;
        total = 0;
    } else if (secondNumber > 0) {
        firstNumber = [self handleTotal];
    }
    lastButton = @"fomular";
}

- (void)resetAll
{
    firstNumber = 0;
    secondNumber = 0;
    total = 0;
    lastButton = @"";
}

//Code handle button

- (IBAction)pressButtonCancel:(id)sender
{
    _resultLable.text = @"0";
    [self resetAll];
}

- (IBAction)pressButtonEqual:(id)sender
{
    if(firstNumber >= 0 && secondNumber > 0) {
        total = [self handleTotal];
        _resultLable.text = [self parseNumberToString:total];
        lastButton = @"=";
    }
}

- (IBAction)pressNum1:(id)sender
{
    [self handleNumber:1];
}

- (IBAction)pressNum2:(id)sender
{
    [self handleNumber:2];
}

- (IBAction)pressNum3:(id)sender
{
    [self handleNumber:3];
}

- (IBAction)pressNum4:(id)sender
{
    [self handleNumber:4];
}

- (IBAction)pressNum5:(id)sender
{
    [self handleNumber:5];
}

- (IBAction)pressNum6:(id)sender
{
    [self handleNumber:6];
}

- (IBAction)pressNum7:(id)sender
{
    [self handleNumber:7];
}

- (IBAction)pressNum8:(id)sender
{
    [self handleNumber:8];
}

- (IBAction)pressNum9:(id)sender
{
    [self handleNumber:9];
}

- (IBAction)pressNum0:(id)sender
{
    [self handleNumber:0];
}

- (IBAction)pressButtonPlus:(id)sender
{
    fomular = @"+";
    [self handleFomular];
}

- (IBAction)pressButtonMinus:(id)sender
{
    fomular = @"-";
    [self handleFomular];
}

- (IBAction)pressButtonMultiply:(id)sender
{
    fomular = @"*";
    [self handleFomular];
}

- (IBAction)pressButtonDevide:(id)sender
{
    fomular = @"/";
    [self handleFomular];
}

@end
