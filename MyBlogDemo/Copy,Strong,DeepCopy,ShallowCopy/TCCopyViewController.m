//
//  TCCopyViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/9.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCCopyViewController.h"

@interface TCCopyViewController ()

@property (nonatomic, strong)NSString *strongString;
@property (nonatomic, copy) NSString *stringCopy;



@end


@implementation TCCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *testString = @"test String";
    
    NSMutableString *testMutableString = [@"test Mutable String" mutableCopy];
    
    self.strongString = testString;
    self.stringCopy = testString;
    
    NSLog(@"*********************");
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    testString = @"changed test string";
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    
    self.strongString = testMutableString;
    self.stringCopy = testMutableString;

    NSLog(@"*********************");
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    [testMutableString appendString:@"changed!!!"];
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");

}

@end
