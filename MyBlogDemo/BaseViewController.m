//
//  BaseViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/5/9.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "BaseViewController.h"
#import "MyBlogDemo-Swift.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.model.title;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
