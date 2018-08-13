//
//  TCRetainCycleViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/13.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCRetainCycleViewController.h"

@interface TCRetainCycleViewController ()

@end

@implementation TCRetainCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)alertControllerDemo {
    UIAlertController *textfieldAlert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [textfieldAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"placeHolder";
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *alertTextfieldText = textfieldAlert.textFields.firstObject.text;
        NSLog(@"%@",alertTextfieldText);
    }];
    
    [textfieldAlert addAction:action];
    
    [self.navigationController presentViewController:textfieldAlert animated:YES completion:nil];
}




@end
