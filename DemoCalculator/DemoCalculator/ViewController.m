//
//  ViewController.m
//  DemoCalculator
//
//  Created by Bao on 11/10/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    valueString = @"";
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
    
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self setbackground];
}
-(void)setbackground {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        NSLog(@"Lanscapse");
        _backgroundView.backgroundColor = [UIColor darkGrayColor];
    }
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        NSLog(@"UIDeviceOrientationPortrait");
        _backgroundView.backgroundColor = [UIColor lightGrayColor];
    }
}


-(void)setMode:(int)m
{
    if (total == 0) {
        return;
    }
    mode = m;
    lastButtonWasMode = YES;
    total = [valueString intValue];
}


-(IBAction)Number:(UIControl *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    _labelText.text = [NSString stringWithFormat:@"%ld",(long) sender.tag];
    
    NSInteger num = sender.tag;
    if (num == 0 && total == 0) {
        return;
    }
    if (lastButtonWasMode) {
        lastButtonWasMode = NO;
        valueString = @"";
    }
    
    NSString *numAsString = [NSString stringWithFormat:@"%li", (long)num];
    valueString = [valueString stringByAppendingString:numAsString];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    _labelText.text = [formatter stringFromNumber:n];
    
    if (total == 0) {
        total = [valueString intValue];
    }
    
}

-(IBAction)btnReset:(UIControl *)sender
{
    
    total = 0;
    valueString = @"";
    _labelText.text = @"0";
}

-(IBAction)btnValue:(UIControl *)sender

{
    if (mode == 0) {
        return;
    }
    if (mode == 1) {
        total += [valueString intValue];
    }
    if (mode == 2) {
        total -= [valueString intValue];
    }
    if (mode == 3) {
        total *= [valueString intValue];
    }
    if (mode == 4) {
        total /= [valueString intValue];
    }
    
    valueString = [NSString stringWithFormat:@"%li",(long)total];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    _labelText.text = [formatter stringFromNumber:n];
    mode = 0;
}
-(IBAction)btnSum:(UIControl *)sender
{ [self setMode:1];
    
}
-(IBAction)btnSubtraction:(UIControl *)sender
{
    [self setMode:2];
}
-(IBAction)btnMultiplication:(UIControl *)sender
{
    [self setMode:3];
}
-(IBAction)btnDivision:(UIControl *)sender
{
    [self setMode:4];
}

@end
