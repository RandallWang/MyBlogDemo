 //
//  TCBlockViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCBlockViewController.h"

typedef void(^TestBlock)(int testValue);

@interface TCBlockViewController ()

- (void)TCBlockCompletionHandler:(TestBlock)completion;

@end


@implementation TCBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self simpleBlockUsage];
    [self standerBlockUsage];
}

- (void)simpleBlockUsage {
    void (^itemCountBlock)(void) = ^(void) {
        NSLog(@"2");
    };
    NSLog(@"1");
    itemCountBlock();
    NSLog(@"3");
}

- (void)standerBlockUsage {
    NSArray *testArray = @[@"1", @"2", @"3"];
    __block int count = 0;
    [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += 1;
        NSLog(@"count:%i", count);
    }];
    
    [self TCBlockCompletionHandler:^void(int testValue) {
        NSLog(@"%i",testValue);
        NSLog(@"done!");
    }];

}

- (void)TCBlockCompletionHandler:(TestBlock)completion {
    NSLog(@"do something");
    completion(1);
}

@end
