 //
//  TCBlockViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCBlockViewController.h"
#import "TCCopyItem.h"

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
    __block NSMutableString *string = [NSMutableString string];
    NSLog(@"string:%p,pointer address:%p", string, &string);

    [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendString:[NSString stringWithFormat:@"%@", obj]];
        NSLog(@"string:%p,pointer address:%p", string, &string);
    }];
    
    TCCopyItem *test = [[TCCopyItem alloc] initWithName:@"a"];
    NSLog(@"item:%@,pointer address:%p", test, &test);
    [self TCBlockCompletionHandler:^void(int testValue) {
        NSLog(@"item:%@,pointer address:%p", test, &test);

        NSLog(@"%i",testValue);
        NSLog(@"done!");
    }];
}

- (void)TCBlockCompletionHandler:(TestBlock)completion {
    NSLog(@"do something");
    completion(1);
}

@end
