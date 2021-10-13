//
//  ViewController.m
//  TPhotoViewer
//
//  Created by admin on 2021/10/11.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentIndex = 0;
    
    Car *car1 = [[Car alloc]init];
    car1.name = @"Ferrari";
    car1.image = [UIImage imageNamed:@"ferrari.jpeg"];
    
    Car *car2 = [[Car alloc]init];
    car2.name = @"Lamborghini";
    car2.image = [UIImage imageNamed:@"lamborghini.jpeg"];
    
    Car *car3 = [[Car alloc]init];
    car3.name = @"Toyota";
    car3.image = [UIImage imageNamed:@"toyota.jpeg"];
    
    Car *car4 = [[Car alloc]init];
    car4.name = @"Ford";
    car4.image = [UIImage imageNamed:@"ford.jpeg"];
    
    Car *car5 = [[Car alloc]init];
    car5.name = @"BMW";
    car5.image = [UIImage imageNamed:@"bmw.jpeg"];
    
    Car *car6 = [[Car alloc]init];
    car6.name = @"Mercedes – Benz";
    car6.image = [UIImage imageNamed:@"mercedes.jpeg"];
    
    Car *car7 = [[Car alloc]init];
    car7.name = @"Audi";
    car7.image = [UIImage imageNamed:@"audi.jpeg"];
    
    Car *car8 = [[Car alloc]init];
    car8.name = @"Lexus";
    car8.image = [UIImage imageNamed:@"lexus.jpeg"];
    
    Car *car9 = [[Car alloc]init];
    car9.name = @"Hyundai";
    car9.image = [UIImage imageNamed:@"hyundai.jpeg"];
    
    Car *car10 = [[Car alloc]init];
    car10.name = @"Vinfast";
    car10.image = [UIImage imageNamed:@"vinfast.jpeg"];
    
    self.cars = [[NSMutableArray alloc]init];
    [self.cars addObject:car1];
    [self.cars addObject:car2];
    [self.cars addObject:car3];
    [self.cars addObject:car4];
    [self.cars addObject:car5];
    [self.cars addObject:car6];
    [self.cars addObject:car7];
    [self.cars addObject:car8];
    [self.cars addObject:car9];
    [self.cars addObject:car10];
    
    [self displayCurrentCar];
    
    //Zoom
    self.scrollView.maximumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 3.0;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.delegate = self;
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self displayRight];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self displayLeft];
}

- (IBAction)btnNextPressed:(id)sender
{
    [self displayRight];
}

- (IBAction)btnPreviousPressed:(id)sender
{
    [self displayLeft];
}

- (void) displayCurrentCar
{
    Car *currentCar = [self.cars objectAtIndex:_currentIndex];
    self.imageView.image = currentCar.image;
    NSString *strName = [NSString stringWithFormat: @"%@ (%d/%lu)", currentCar.name, _currentIndex+1, (unsigned long)[self.cars count]];

    self.name.text = strName;
}

- (void) displayLeft
{
    if (_currentIndex > 0) {
        _currentIndex --;
        [self displayCurrentCar];
    }
}

- (void) displayRight
{
    if (_currentIndex < [self.cars count] - 1) {
        _currentIndex ++;
        [self displayCurrentCar];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
