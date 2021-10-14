//
//  ViewController.m
//  QuanCalculator
//
//  Created by Nguyễn Trịnh Hồng Quân on 12/10/2021.
//

#import "ViewController.h"

@interface ViewController ()

#pragma mark - Define Private property

@property (nonatomic) double firstNumber;
@property (nonatomic) double secondNumber;
@property (nonatomic) double total;

@property (nonatomic, assign) BOOL hasError;
@property (strong, nonatomic) NSString *fomularString;
@property (strong, nonatomic) NSString *lastButtonString;

@end

@implementation ViewController

#pragma mark - Define const

static double const multipleValue = 10;

static NSString * const numberButtonType = @"num";
static NSString * const equalButtonType = @"=";
static NSString * const fomularButtonType = @"fomular";

static NSString * const sumFomular = @"+";
static NSString * const minusFomular = @"-";
static NSString * const multiplyFomular = @"*";
static NSString * const divideFomular = @"/";

static NSString * const zeroStringValue = @"0";
static NSString * const emptyStringValue = @"";
static NSString * const errorMessage = @"Can't devide for 0";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resultLabel.text = zeroStringValue;
    _mainScreen.backgroundColor = [UIColor blueColor];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self setBackground];
}

- (void)setBackground {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft
        ||[[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        _mainScreen.backgroundColor = [UIColor redColor];
    } else {
        _mainScreen.backgroundColor = [UIColor blueColor];
    }
}

- (NSString *)parseNumberToString:(double) number {
    NSNumber *myDoubleNumber = [NSNumber numberWithDouble:number];
    return [myDoubleNumber stringValue];
}

#pragma mark - Method

- (void)handleNumber:(NSInteger)number {
    if(self.hasError) {
        _resultLabel.text = [self parseNumberToString:number];
    } else if([self.lastButtonString isEqual: numberButtonType]) {
        if(self.secondNumber > 0) {
            self.secondNumber = self.secondNumber*multipleValue + number;
            _resultLabel.text = [self parseNumberToString:self.secondNumber];
        } else if (self.firstNumber >= 0) {
            self.firstNumber = self.firstNumber*multipleValue + number;
            _resultLabel.text = [self parseNumberToString:self.firstNumber];
        }
    } else if ([self.lastButtonString isEqual: equalButtonType]) {
        [self resetAll];
        self.firstNumber = number;
        _resultLabel.text = [self parseNumberToString:number];
    } else if ([self.lastButtonString isEqual: fomularButtonType]) {
        self.secondNumber = number;
        _resultLabel.text = [self parseNumberToString:number];
    } else {
        _resultLabel.text = [self parseNumberToString:number];
        self.firstNumber = number;
    }
    self.lastButtonString = numberButtonType;
}

- (double)handleTotal {
    if([self.fomularString isEqual: sumFomular]) {
        self.total = self.firstNumber + self.secondNumber;
    } else if ([self.fomularString isEqual: minusFomular]) {
        self.total = self.firstNumber - self.secondNumber;
    } else if ([self.fomularString isEqual: multiplyFomular]) {
        self.total = self.firstNumber * self.secondNumber;
    } else if ([self.fomularString isEqual: divideFomular]) {
        self.total = self.firstNumber / self.secondNumber;
    }
    return self.total;
}

- (void)handleFomular:(NSString *)fomular {
    if(self.hasError) {
        _resultLabel.text = errorMessage;
    } else {
        if(self.lastButtonString == equalButtonType) {
            self.firstNumber = self.total;
            self.secondNumber = 0;
            self.total = 0;
        } else if (self.secondNumber > 0) {
            self.firstNumber = [self handleTotal];
            self.resultLabel.text = [self parseNumberToString:self.firstNumber];
        } else if([self.fomularString isEqual: divideFomular]
                 && self.secondNumber == 0) {
           _resultLabel.text = errorMessage;
            self.hasError = YES;
       }
        self.fomularString = fomular;
        self.lastButtonString = fomularButtonType;
    }
}

- (void)resetAll {
    self.firstNumber = 0;
    self.secondNumber = 0;
    self.total = 0;
    self.lastButtonString = emptyStringValue;
    self.fomularString = emptyStringValue;
    self.hasError = NO;
}

#pragma mark - IBActions

- (IBAction)pressButtonCancel:(id)sender {
    _resultLabel.text = zeroStringValue;
    [self resetAll];
}

- (IBAction)pressButtonEqual:(id)sender {
    if(self.hasError) {
        _resultLabel.text = errorMessage;
    } else {
        if(self.secondNumber > 0) {
            self.total = [self handleTotal];
            _resultLabel.text = [self parseNumberToString:self.total];
            self.lastButtonString = equalButtonType;
        } else if([self.fomularString isEqual: divideFomular]
                  && self.secondNumber == 0) {
            _resultLabel.text = errorMessage;
            self.hasError = YES;
        }
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
    [self handleFomular:sumFomular];
}

- (IBAction)pressButtonMinus:(id)sender {
    [self handleFomular:minusFomular];
}

- (IBAction)pressButtonMultiply:(id)sender {
    [self handleFomular:multiplyFomular];
}

- (IBAction)pressButtonDevide:(id)sender {
    [self handleFomular:divideFomular];
}

@end

