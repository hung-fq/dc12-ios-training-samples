//
//  ViewController.m
//  VCalculator
//
//  Created by LyThienVuong on 11/10/2021.
//

#import "ViewController.h"

#define CONG    @"+"
#define TRU     @"-"
#define NHAN    @"*"
#define CHIA    @"/"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtKetqua,numberView;
int sothunhat;
int sothuhai;
double ketqua;
NSString *dau;
bool isDaTinhToan;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    txtKetqua.text = @"";
    sothunhat = 0;
    sothuhai = 0;
    ketqua = 0.0;
    dau = @"";
    isDaTinhToan = false;
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [numberView setBackgroundColor:[UIColor yellowColor]];
}

- (IBAction)key0:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"0";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"0"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key1:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"1";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"1"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key2:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"2";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"2"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key3:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"3";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"3"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key4:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"4";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"4"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key5:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"5";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"5"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key6:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"6";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"6"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key7:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"7";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"7"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key8:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"8";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"8"];
        txtKetqua.text = kq;
    }
}

- (IBAction)key9:(id)sender {
    NSString *kq = txtKetqua.text;
    if(isDaTinhToan){
        txtKetqua.text = @"9";
        isDaTinhToan = false;
    }else{
        kq = [kq stringByAppendingString:@"9"];
        txtKetqua.text = kq;
    }
}

- (IBAction)keyCong:(id)sender {
    [self laySoThuNhat];
    dau = CONG;
}

- (IBAction)keyTru:(id)sender {
    [self laySoThuNhat];
    dau = TRU;
}

- (IBAction)keyChia:(id)sender {
    [self laySoThuNhat];
    dau = CHIA;
}

- (IBAction)keyNhan:(id)sender {
    [self laySoThuNhat];
    dau = NHAN;
}

- (void)laySoThuNhat {
    NSString *s1 = txtKetqua.text;
    sothunhat = [s1 intValue];
    txtKetqua.text = @"";
}

- (IBAction)keyXoa:(id)sender {
    sothunhat = 0;
    sothuhai = 0;
    txtKetqua.text = @"";
}

- (IBAction)keyKetqua:(id)sender {
    NSString *s2 = txtKetqua.text;
    sothuhai = [s2 intValue];
    
    if([dau isEqualToString:@"+"]) {
        ketqua = sothunhat + sothuhai;
        txtKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    }else if([dau isEqualToString:@"-"]) {
        ketqua = sothunhat - sothuhai;
        txtKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    }else if([dau isEqualToString:@"*"]) {
        ketqua = sothunhat * sothuhai;
        txtKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    }else {
        if(sothuhai == 0){
            txtKetqua.text = [NSString stringWithFormat:@"Khong the chia cho 0"];
        }else{
            ketqua = (double)sothunhat / (double)sothuhai;
            txtKetqua.text = [NSString stringWithFormat:@"%f", ketqua];
        }
    }
    
    sothunhat = 0;
    sothuhai = 0;
    ketqua = 0.0;
    isDaTinhToan = true;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if(size.width>size.height){
        [self.view setBackgroundColor:[UIColor greenColor]];
        [numberView setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.view setBackgroundColor:[UIColor yellowColor]];
        [numberView setBackgroundColor:[UIColor yellowColor]];
    }
}

@end
