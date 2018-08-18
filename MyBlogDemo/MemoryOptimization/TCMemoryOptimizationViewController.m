//
//  TCMemoryOptimizationViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCMemoryOptimizationViewController.h"

@interface TCMemoryOptimizationViewController ()

@property (nonatomic, strong)NSArray *testEnumArray;

@end

@implementation TCMemoryOptimizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self notUsingAutoReleasePool];
//    [self usingAutoReleasePool];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - AutoReleasePool

- (void)notUsingAutoReleasePool {
    int i = 0;
    while (i < 1000000) {
        NSArray *newArray = [NSArray array];
        i += 1;
    }
}

- (void)usingAutoReleasePool {
    int i = 0;
    while (i < 1000000) {
        @autoreleasepool {
            NSArray *newArray = [NSArray array];
            i += 1;
        }
    }
}

- (void)forinTest {
    for (id object in self.testEnumArray) {
        NSLog(@"object:%@",object);
    }
}


- (void)blockEnumeraterTest {
    [self.testEnumArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

#pragma mark - NSData and UIImage


#pragma mark - NSCache

- (void)cacheTest {
    NSCache *cache = [[NSCache alloc] init];
    
}



@end
