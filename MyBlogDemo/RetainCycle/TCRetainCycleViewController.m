//
//  TCRetainCycleViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/13.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCRetainCycleViewController.h"

typedef void(^selfHoldingBlock)(void);

@interface TCRetainCycleViewController ()

@property(nonatomic, copy) selfHoldingBlock myBlock;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation TCRetainCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    [self alertControllerDemo];
//    [self blockStrongWeakDemo1];
//    [self blockStrongWeakDemo2];
}

- (void)dealloc {
    NSLog(@"TCRetainCycleViewController dealloc");
}

/**
 Retain Cycle in UIAlertController,using __
 */
- (void)alertControllerDemo {
    UIAlertController *textfieldAlert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert Message" preferredStyle:UIAlertControllerStyleAlert];
    [textfieldAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"placeHolder";
    }];
    
    __weak typeof(textfieldAlert) weakAlert = textfieldAlert;
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSString *alertTextfieldText = textfieldAlert.textFields.firstObject.text;          //retain cycle between alertcontroller and Action
        NSString *alertTextfieldText = weakAlert.textFields.firstObject.text;               //using __weak to break the retain cycle
        NSLog(@"input text:%@",alertTextfieldText);
        
        //Since the block and alertcontroller won't be release,following line will cause self(this ViewController) not able to dealloc
//        [self.navigationController popViewControllerAnimated:YES];
    }];
    [textfieldAlert addAction:action];
    
    [self.navigationController presentViewController:textfieldAlert animated:YES completion:nil];
}

/**
 self doesn't hold block,Using strong self is OK
 */
- (void)blockStrongWeakDemo1 {
    void (^testBlock)(void) = ^{
        self.view.backgroundColor = [UIColor redColor];
    };
    
    testBlock();
}

/**
  Solve Retain Cycle by using __weak Self
 */
- (void)blockStrongWeakDemo2 {
    __weak typeof(self) weakSelf = self;
    
    self.myBlock = ^{
        weakSelf.view.backgroundColor = [UIColor redColor];
//        self.view.backgroundColor = [UIColor redColor];           //retain cycle here
    };

    self.myBlock();
}


/**
  __strong Self
 */
- (void)blockStrongWeakDemo3 {
    
    
}


- (void)NSTimerIssue {
    
}

@end
