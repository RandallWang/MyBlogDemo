//
//  TCCrashViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/24.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "TCCrashViewController.h"

@interface TestClass:NSObject

@property (nonatomic, copy)NSString *name;

@end


@implementation TestClass


@end

@interface TCCrashViewController ()

@property (nonatomic, weak) TestClass *weakObj;

@end

@implementation TCCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSObject *obj = nil;
    [obj description];
    
    obj = NULL;
    [obj description];
    
//    self.weakObj = [[TestClass alloc] init];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.weakObj.name = @"";
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
