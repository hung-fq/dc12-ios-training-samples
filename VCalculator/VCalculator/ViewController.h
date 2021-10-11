//
//  ViewController.h
//  VCalculator
//
//  Created by LyThienVuong on 11/10/2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
}
@property (weak, nonatomic) IBOutlet UITextField *txtKetqua;
@property (weak, nonatomic) IBOutlet UIView *numberView;

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

