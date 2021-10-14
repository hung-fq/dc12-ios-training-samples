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

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resultLable.text = @"0";
    _mainScreen.backgroundColor = [UIColor blueColor];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
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

- (NSString *)parseNumberToString:(double) number {
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:number];
    return [myDoubleNumber stringValue];
}

#pragma mark - Method

- (void)handleNumber:(NSInteger ) num {
    if([self.self.lastButton isEqual: @"num"]) {
        if(self.secondNumber > 0) {
            self.secondNumber = self.secondNumber*10 + num;
            _resultLable.text = [self parseNumberToString:self.secondNumber];
        } else if (self.firstNumber > 0) {
            self.firstNumber = self.firstNumber*10 + num;
            _resultLable.text = [self parseNumberToString:self.firstNumber];
        }
    } else if ([self.lastButton isEqual: @"="]) {
        [self resetAll];
        self.firstNumber = num;
        _resultLable.text = [self parseNumberToString:num];
    } else if ([self.lastButton isEqual: @"self.fomular"]) {
        self.secondNumber = num;
        _resultLable.text = [self parseNumberToString:num];
    } else {
        _resultLable.text = [self parseNumberToString:num];
        self.firstNumber = num;
    }
    self.lastButton = @"num";
}

- (double) handleTotal {
    if([self.fomular  isEqual: @"+"]) {
        self.total = self.firstNumber + self.secondNumber;
    } else if ([self.fomular isEqual: @"-"]) {
        self.total = self.firstNumber - self.secondNumber;
    } else if ([self.fomular isEqual: @"*"]) {
        self.total = self.firstNumber * self.secondNumber;
    } else if ([self.fomular isEqual: @"/"]) {
        self.total = self.firstNumber / self.secondNumber;
    }
    return self.total;
}

- (void) handleFomular {
    self.lastButton = self.fomular;
    if(self.total > 0) {
        self.firstNumber = self.total;
        self.secondNumber = 0;
        self.total = 0;
    } else if (self.secondNumber > 0) {
        self.firstNumber = [self handleTotal];
    }
    self.lastButton = @"self.fomular";
}

- (void)resetAll {
    self.firstNumber = 0;
    self.secondNumber = 0;
    self.total = 0;
    self.lastButton = @"";
}

#pragma mark - IBActions

- (IBAction)pressButtonCancel:(id)sender {
    _resultLable.text = @"0";
    [self resetAll];
}

- (IBAction)pressButtonEqual:(id)sender {
    if(self.firstNumber >= 0 && self.secondNumber > 0) {
        self.total = [self handleTotal];
        _resultLable.text = [self parseNumberToString:self.total];
        self.lastButton = @"=";
    }
}

- (IBAction)pressNum1:(id)sender {
    [self handleNumber:1];
}

- (IBAction)pressNum2:(id)sender {
    [self handleNumber:2];
}

- (IBAction)pressNum3:(id)sender {
    [self handleNumber:3];
}

- (IBAction)pressNum4:(id)sender {
    [self handleNumber:4];
}

- (IBAction)pressNum5:(id)sender {
    [self handleNumber:5];
}

- (IBAction)pressNum6:(id)sender {
    [self handleNumber:6];
}

- (IBAction)pressNum7:(id)sender {
    [self handleNumber:7];
}

- (IBAction)pressNum8:(id)sender {
    [self handleNumber:8];
}

- (IBAction)pressNum9:(id)sender {
    [self handleNumber:9];
}

- (IBAction)pressNum0:(id)sender {
    [self handleNumber:0];
}

- (IBAction)pressButtonPlus:(id)sender {
    self.fomular = @"+";
    [self handleFomular];
}

- (IBAction)pressButtonMinus:(id)sender {
    self.fomular = @"-";
    [self handleFomular];
}

- (IBAction)pressButtonMultiply:(id)sender {
    self.fomular = @"*";
    [self handleFomular];
}

- (IBAction)pressButtonDevide:(id)sender {
    self.fomular = @"/";
    [self handleFomular];
}

@end
