//
//  TCMockViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCMockViewController.h"


@interface TCMockViewController ()

@end

@implementation TCMockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Mock";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self testPostmanMock];
    [self testMocoMock];
}

- (void)testPostmanMock {
    NSURLSession *session = [NSURLSession sharedSession];

    NSURL *postmanURL= [NSURL URLWithString:@"https://9cce0ad0-1394-4ad6-a82b-883f4c0535f5.mock.pstmn.io"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[postmanURL URLByAppendingPathComponent:@"DemoPath"]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [task resume];
}


- (void)testMocoMock {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *mocoURL= [NSURL URLWithString:@"http://localhost:12306"];
    NSURLRequest *request = [NSURLRequest requestWithURL:mocoURL];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [task resume];
}



@end
