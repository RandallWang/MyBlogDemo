//
//  TCMemoryOptimizationViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCMemoryOptimizationViewController.h"
#import "TCImage.h"

@interface TCMemoryOptimizationViewController ()

@property (nonatomic, strong)NSArray *testEnumArray;

@end

@implementation TCMemoryOptimizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self notUsingAutoReleasePool];
    [self usingAutoReleasePool];
}

#pragma mark - AutoReleasePool

- (void)notUsingAutoReleasePool {
    int i = 0;
//    NSMutableArray *myTestArray = [NSMutableArray array];
    while (i < 10000) {
//UIImage will not release if using "imageNamed:",check https://stackoverflow.com/questions/24653440/uiimage-dont-release-memory
//        TCImage *tempImage = [TCImage imageNamed:@"a"];
        
//        TCImage *tempImage = [TCImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testImage" ofType:@"jpg"]];
        
        i += 1;
    }
    NSLog(@"first while is done");
    [self usingAutoReleasePool];
}

- (void)usingAutoReleasePool {
    int i = 0;
    while (i < 10000) {
        @autoreleasepool {
//            TCImage *tempImage = [TCImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testImage" ofType:@"jpg"]];
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
//    NSCache *cache = [[NSCache alloc] init];
    
}



@end
