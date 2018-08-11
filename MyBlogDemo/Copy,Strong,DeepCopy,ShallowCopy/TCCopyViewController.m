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

@property (nonatomic, strong)NSArray *arrayStrong;
@property (nonatomic, copy)NSArray *arrayCopy;

@end


@implementation TCCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self copyAndStrongStringTest];
}

- (void)copyAndStrongStringTest {
    NSString *testString = @"test String";
    self.strongString = testString;
    self.stringCopy = testString;
    
    NSLog(@"*********NSString Test************");
    NSLog(@"address:%p",testString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    testString = @"changed test string";
    NSLog(@"address:%p",testString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    
    NSMutableString *testMutableString = [@"test Mutable String" mutableCopy];
    self.strongString = testMutableString;
    self.stringCopy = testMutableString;
    
    NSLog(@"*********NSMutableString Test************");
    NSLog(@"address:%p",testMutableString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    [testMutableString appendString:@"changed!!!"];
    NSLog(@"address:%p",testMutableString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
}

- (void)copyAndStrongArrayTest {
    
}

@end
