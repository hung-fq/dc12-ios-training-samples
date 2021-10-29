//
//  ViewController.m
//  VCalculator
//
//  Created by LyThienVuong on 11/10/2021.
//

#import "ViewController.h"

static NSString *const Cong = @"+";
static NSString *const Tru = @"-";
static NSString *const Nhan = @"*";
static NSString *const Chia = @"/";
static NSString *const So0 = @"0";
static NSString *const So1 = @"1";
static NSString *const So2 = @"2";
static NSString *const So3 = @"3";
static NSString *const So4 = @"4";
static NSString *const So5 = @"5";
static NSString *const So6 = @"6";
static NSString *const So7 = @"7";
static NSString *const So8 = @"8";
static NSString *const So9 = @"9";
static NSString *const ChiaCho0 = @"Khong the chia cho 0";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblKetqua;
@property (weak, nonatomic) IBOutlet UIView *viewNumber;
- (IBAction)key0:(id)sender;
- (IBAction)key1:(id)sender;
- (IBAction)key2:(id)sender;
- (IBAction)key3:(id)sender;
- (IBAction)key4:(id)sender;
- (IBAction)key5:(id)sender;
- (IBAction)key6:(id)sender;
- (IBAction)key7:(id)sender;
- (IBAction)key8:(id)sender;
- (IBAction)key9:(id)sender;
- (IBAction)keyCong:(id)sender;
- (IBAction)keyTru:(id)sender;
- (IBAction)keyChia:(id)sender;
- (IBAction)keyNhan:(id)sender;
- (IBAction)keyXoa:(id)sender;
- (IBAction)keyKetqua:(id)sender;
@end

@implementation ViewController
@synthesize lblKetqua,viewNumber;
int sothunhat;
int sothuhai;
double ketqua;
bool isDaTinhToan;
NSString *dau;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    lblKetqua.text = @"";
    sothunhat = 0;
    sothuhai = 0;
    ketqua = 0.0;
    dau = @"";
    isDaTinhToan = false;
    lblKetqua.text = So0;
    [viewNumber setBackgroundColor:[UIColor lightGrayColor]];
}

- (IBAction)key0:(id)sender {
    NSString *kq = lblKetqua.text;
    if([lblKetqua.text isEqualToString:So0]) {
        return;
    }
    if(isDaTinhToan) {
        lblKetqua.text = So0;
        isDaTinhToan = false;
    } else {
        kq = [kq stringByAppendingString:So0];
        lblKetqua.text = kq;
    }
}

- (IBAction)key1:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So1;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So1;
        } else {
            kq = [kq stringByAppendingString:So1];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key2:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So2;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So2;
        } else {
            kq = [kq stringByAppendingString:So2];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key3:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So3;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So3;
        } else {
            kq = [kq stringByAppendingString:So3];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key4:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So4;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So4;
        } else {
            kq = [kq stringByAppendingString:So4];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key5:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So5;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So5;
        } else {
            kq = [kq stringByAppendingString:So5];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key6:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So6;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So6;
        } else {
            kq = [kq stringByAppendingString:So6];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key7:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So7;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So7;
        } else {
            kq = [kq stringByAppendingString:So7];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key8:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So8;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So8;
        } else {
            kq = [kq stringByAppendingString:So8];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)key9:(id)sender {
    NSString *kq = lblKetqua.text;
    if(isDaTinhToan) {
        lblKetqua.text = So9;
        isDaTinhToan = false;
    } else {
        if([lblKetqua.text isEqualToString:So0]) {
            lblKetqua.text = So9;
        } else {
            kq = [kq stringByAppendingString:So9];
            lblKetqua.text = kq;
        }
    }
}

- (IBAction)keyCong:(id)sender {
    [self laySoThuNhat];
    dau = Cong;
}

- (IBAction)keyTru:(id)sender {
    [self laySoThuNhat];
    dau = Tru;
}

- (IBAction)keyChia:(id)sender {
    [self laySoThuNhat];
    dau = Chia;
}

- (IBAction)keyNhan:(id)sender {
    [self laySoThuNhat];
    dau = Nhan;
}

- (IBAction)keyXoa:(id)sender {
    sothunhat = 0;
    sothuhai = 0;
    lblKetqua.text = @"0";
}

- (void)laySoThuNhat {
    NSString *s1 = lblKetqua.text;
    sothunhat = [s1 intValue];
    lblKetqua.text = @"";
}

- (IBAction)keyKetqua:(id)sender {
    NSString *s2 = lblKetqua.text;
    sothuhai = [s2 intValue];
    
    if ([dau isEqualToString:Cong]) {
        ketqua = sothunhat + sothuhai;
        lblKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    } else if ([dau isEqualToString:Tru]) {
        ketqua = sothunhat - sothuhai;
        lblKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    } else if ([dau isEqualToString:Nhan]) {
        ketqua = sothunhat * sothuhai;
        lblKetqua.text = [NSString stringWithFormat:@"%i", (int)ketqua];
    } else {
        if (sothuhai == 0) {
            lblKetqua.text = [NSString stringWithFormat:ChiaCho0];
        } else {
            ketqua = (double)sothunhat / (double)sothuhai;
            lblKetqua.text = [NSString stringWithFormat:@"%f", ketqua];
        }
    }
    
    sothunhat = 0;
    sothuhai = 0;
    ketqua = 0.0;
    isDaTinhToan = true;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft ||
        [[UIDevice currentDevice] orientation ] == UIDeviceOrientationLandscapeRight) {
        viewNumber.backgroundColor = [UIColor darkGrayColor];
    } else {
        viewNumber.backgroundColor = [UIColor lightGrayColor];
    }
}


@end
