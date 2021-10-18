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
@property (nonatomic) NSString  *valueString;
@property (nonatomic) BOOL lastButtonWasMode;

@property (strong, nonatomic) IBOutlet UILabel *labelText;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation ViewController

#pragma mark - Define const

static NSString * const zeroStringValue = @"0";
static NSString * const emptyStringValue = @"";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _valueString = emptyStringValue;
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
}


#pragma mark - Method

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self setbackground];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
    }];
}

- (void)setbackground {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft ||
        [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight) {
        _backgroundView.backgroundColor = [UIColor darkGrayColor];
    }
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait ||
       [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown ) {
        _backgroundView.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setMode:(NSInteger)m
{
    if (_total == ModeZero) {
        return;
    }
    _calculator = m;
    _lastButtonWasMode = YES;
    _total = [_valueString doubleValue];
}

#pragma mark - IBActions

- (IBAction)Number:(UIControl *)sender
{
    _labelText.text = [NSString stringWithFormat:@"%ld",(long) sender.tag];
    NSInteger num = sender.tag;
    if (num == ModeZero && _total == ModeZero) {
        return;
    }
    if (_lastButtonWasMode) {
        _lastButtonWasMode = NO;
        _valueString = emptyStringValue;
    }
    NSString *numAsString = [NSString stringWithFormat:@"%li", (long)num];
    _valueString = [_valueString stringByAppendingString:numAsString];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:_valueString];
    _labelText.text = [formatter stringFromNumber:n];
    if (_total == ModeZero) {
        _total = [_valueString doubleValue];
    }
}

- (IBAction)resetButton:(UIControl *)sender
{
    _total = ModeZero;
    _valueString = emptyStringValue;
    _labelText.text = zeroStringValue;
}

- (IBAction)valueButton:(UIControl *)sender
{
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
        _total /= [_valueString doubleValue];
    }
    
    _valueString = [NSString stringWithFormat:@"%li",(long)_total];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:_valueString];
    _labelText.text = [formatter stringFromNumber:n];
    _calculator = ModeZero;
}

- (IBAction)sumButton:(UIControl *)sender
{
    [self setMode:Summation];
}

- (IBAction)subtractionButton:(UIControl *)sender
{
    [self setMode:Subtraction];
}

- (IBAction)multiplicationButton:(UIControl *)sender
{
    [self setMode:Multiplication];
}

- (IBAction)divisionButton:(UIControl *)sender
{
    [self setMode:Division];
}

@end
