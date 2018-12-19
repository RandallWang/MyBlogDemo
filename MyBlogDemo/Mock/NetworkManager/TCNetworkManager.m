//
//  TCNetworkManager.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/18.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCNetworkManager.h"
#import "TCBaseRequest.h"
#import "TCBaseResponse.h"

static const NSString *ErrorDomain = @"";


@interface TCNetworkManager()



@end


@implementation TCNetworkManager

+ (instancetype)manager {
    static TCNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TCNetworkManager alloc] init];
    });
    
    return manager;
}


- (void)startRequest:(TCBaseRequest *)myRequest {
    assert([myRequest isKindOfClass:[TCBaseRequest class]]);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:myRequest.requestURL];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            [self.delegate failedWithError:error];
        }else {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            Class responseClass = [myRequest responseClass];
            TCBaseResponse *response = [responseClass resultFromResponseData:json];
            
            [self.delegate successedWithResponse:response];
        }
    }];
    
    [task resume];
}




@end
