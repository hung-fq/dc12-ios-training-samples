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

static NSString * const labelBottonC = @"C";
static NSString * const labelBottonAC = @"AC";

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
    [self đeactiveAllFomularButton];
    if([self.buttonCancel.titleLabel.text  isEqual: labelBottonAC]) {
        [self.buttonCancel setTitle:labelBottonC forState:UIControlStateNormal];
    }
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
    [self đeactiveAllFomularButton];
    self.firstNumber = 0;
    self.secondNumber = 0;
    self.total = 0;
    self.lastButtonString = emptyStringValue;
    self.fomularString = emptyStringValue;
    self.hasError = NO;
}

- (void)handleButtonActive:(UIButton *)extractedExpr {
    [extractedExpr setBackgroundColor:[UIColor whiteColor]];
    [extractedExpr setTintColor:[UIColor systemOrangeColor]];
}

- (void)handleButtonDeActive:(UIButton *)extractedExpr {
    [extractedExpr setBackgroundColor:[UIColor systemOrangeColor]];
    [extractedExpr setTintColor:[UIColor whiteColor]];
}

- (void)đeactiveAllFomularButton {
    [self handleButtonDeActive:self.buttonPlus];
    [self handleButtonDeActive:self.buttonMinus];
    [self handleButtonDeActive:self.buttonDevide];
    [self handleButtonDeActive:self.buttonMultiply];
}

#pragma mark - IBActions

- (IBAction)pressButtonCancel:(id)sender {
    _resultLabel.text = zeroStringValue;
    [self resetAll];
    if([self.buttonCancel.titleLabel.text  isEqual: labelBottonC]) {
        [self.buttonCancel setTitle:labelBottonAC forState:UIControlStateNormal];
    }
}

- (IBAction)pressButtonEqual:(id)sender {
    [self đeactiveAllFomularButton];
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
    [self handleButtonActive:self.buttonPlus];
    [self handleButtonDeActive:self.buttonMinus];
    [self handleButtonDeActive:self.buttonDevide];
    [self handleButtonDeActive:self.buttonMultiply];
}

- (IBAction)pressButtonMinus:(id)sender {
    [self handleFomular:minusFomular];
    [self handleButtonActive:self.buttonMinus];
    [self handleButtonDeActive:self.buttonPlus];
    [self handleButtonDeActive:self.buttonDevide];
    [self handleButtonDeActive:self.buttonMultiply];
}

- (IBAction)pressButtonMultiply:(id)sender {
    [self handleFomular:multiplyFomular];
    [self handleButtonActive:self.buttonMultiply];
    [self handleButtonDeActive:self.buttonMinus];
    [self handleButtonDeActive:self.buttonDevide];
    [self handleButtonDeActive:self.buttonPlus];
}

- (IBAction)pressButtonDevide:(id)sender {
    [self handleFomular:divideFomular];
    [self handleButtonActive:self.buttonDevide];
    [self handleButtonDeActive:self.buttonMinus];
    [self handleButtonDeActive:self.buttonPlus];
    [self handleButtonDeActive:self.buttonMultiply];
}

@end

