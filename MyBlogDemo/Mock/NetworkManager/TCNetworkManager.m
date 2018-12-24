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
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>

static const NSErrorDomain ErrorDomain = @"TC.MyBlogDemo.Network";


@interface TCNetworkManager()



@end


@implementation TCNetworkManager

+ (instancetype)manager {
    static TCNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TCNetworkManager alloc] init];
#if DEBUG
        [manager installStub];
#endif
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
            if (json) {
                Class responseClass = [myRequest responseClass];
                TCBaseResponse *response = [responseClass resultFromResponseData:json];
                
                [self.delegate successedWithResponse:response];
            }else {
                NSError *emptyResponse = [NSError errorWithDomain:ErrorDomain code:-1 userInfo:@{@"info":@"Response json is nil"}];
                [self.delegate failedWithError:emptyResponse];
            }
        }
    }];
    
    [task resume];
}


#pragma mark - OHHTTPStubs
- (void)installStub {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
        return [request.URL.lastPathComponent isEqualToString:@"listItems"];
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        return [[OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"httpStub.json", self.class)
                                                 statusCode:200
                                                    headers:@{@"Content-Type":@"application/json; charset=utf-8"}]
                requestTime:0.5f
                responseTime:OHHTTPStubsDownloadSpeedWifi];
    }];
}


@end
