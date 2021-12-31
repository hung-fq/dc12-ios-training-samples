//
//  ViewController.m
//  DemoCalculator
//
//  Created by Bao on 11/10/2021.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController ()

typedef NS_ENUM(NSInteger, Calculators) {
    ModeZero,
    Summation,
    Subtraction,
    Multiplication,
    Division
};

@property (nonatomic) Calculators calculator;
@property (nonatomic) double total;
@property (nonatomic) NSString *valueString;
@property (nonatomic) BOOL lastButtonWasMode;

@property (strong, nonatomic) IBOutlet UILabel *labelText;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *summationButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractionButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplicationButton;
@property (weak, nonatomic) IBOutlet UIButton *divisionButton;

@end

@implementation ViewController

#pragma mark - Define const

static NSString * const zeroStringValue = @"0";
static NSString * const emptyStringValue = @"";
static NSString * const notStringvalue =  @"Not a number";
static int const maximumFractionDigits = 6;
static int const minimumFractionDigits = 0;
static double const roundingIncrement = 0.000001;
static double const zeroBorderButton = 0;
static double const setBorderButton = 2;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _valueString = emptyStringValue;
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - Method

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self setbackground];
}

- (void)setbackground {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft ||
        [[UIDevice currentDevice] orientation ] == UIDeviceOrientationLandscapeRight) {
        _backgroundView.backgroundColor = [UIColor darkGrayColor];
    } else {
        _backgroundView.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setMode:(NSInteger)mode {
    if (_total == ModeZero) {
        return;
    }
    _calculator = mode;
    _lastButtonWasMode = YES;
    _total = [_valueString doubleValue];
}

- (void)setHighlightButton:(UIButton*)buttonSelect {
    [self removeHighlightButton];
    [self.summationButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.subtractionButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.multiplicationButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.divisionButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [buttonSelect.layer setBorderWidth:setBorderButton];
}

- (void)removeHighlightButton {
    [self.summationButton.layer setBorderWidth:zeroBorderButton];
    [self.subtractionButton.layer setBorderWidth:zeroBorderButton];
    [self.multiplicationButton.layer setBorderWidth:zeroBorderButton];
    [self.divisionButton.layer setBorderWidth:zeroBorderButton];
}

#pragma mark - IBActions

- (IBAction)Number:(UIControl *)sender {
    _labelText.text = [NSString stringWithFormat:@"%ld",(long) sender.tag];
    NSInteger mode = sender.tag;
    if (mode == ModeZero && _total == ModeZero) {
        return;
    }
    if (_lastButtonWasMode) {
        _lastButtonWasMode = NO;
        _valueString = emptyStringValue;
    }
    NSString *numAsString = [NSString stringWithFormat:@"%li", (long)mode];
    _valueString = [_valueString stringByAppendingString:numAsString];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number = [formatter numberFromString:_valueString];
    _labelText.text = [formatter stringFromNumber:number];
    if (_total == ModeZero) {
        _total = [_valueString doubleValue];
    }
}

- (IBAction)resetButton:(UIControl *)sender {
    _total = ModeZero;
    _valueString = emptyStringValue;
    _labelText.text = zeroStringValue;
    _calculator = ModeZero;
}

- (IBAction)valueButton:(UIControl *)sender {
    [self removeHighlightButton];
    if (_calculator == ModeZero) {
        return;
    }
    if (_calculator == Summation) {
        _total += [_valueString doubleValue];
    }
    if (_calculator == Subtraction) {
        _total -= [_valueString doubleValue];
    }
    if (_calculator == Multiplication) {
        _total *= [_valueString doubleValue];
    }
    if (_calculator == Division) {
        if (_valueString.doubleValue == zeroStringValue.doubleValue) {
            _labelText.text = notStringvalue;
            return;
        } else {
            _total /= [_valueString doubleValue];
        }
    }
    NSLog(@"%f",_total);
    NSNumberFormatter *NumberFormate = [[NSNumberFormatter alloc] init];
    [NumberFormate setRoundingIncrement:[NSNumber numberWithDouble:roundingIncrement]];
    [NumberFormate setMaximumFractionDigits:maximumFractionDigits];
    [NumberFormate setMinimumFractionDigits:minimumFractionDigits];
    NSString *floatString =  [NumberFormate stringFromNumber:[NSNumber numberWithFloat:_total]];
    _valueString = floatString;
    _labelText.text = floatString;
    _lastButtonWasMode = YES;
}

- (IBAction)sumButton:(UIControl *)sender {
    [self setMode:Summation];
    [self setHighlightButton:_summationButton];
}

- (IBAction)subtractionButton:(UIControl *)sender {
    [self setMode:Subtraction];
    [self setHighlightButton:_subtractionButton];
}

- (IBAction)multiplicationButton:(UIControl *)sender {
    [self setMode:Multiplication];
    [self setHighlightButton:_multiplicationButton];
}

- (IBAction)divisionButton:(UIControl *)sender {
    [self setMode:Division];
    [self setHighlightButton:_divisionButton];
}

@end
