//
//  main.m
//  TCalculator
//
//  Created by admin on 2021/10/05.
//

#import <UIKit/UIKit.h>
#import "Special Classes/AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
