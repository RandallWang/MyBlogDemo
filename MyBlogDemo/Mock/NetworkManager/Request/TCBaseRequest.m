//
//  TCBaseRequest.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCBaseRequest.h"
#import "TCBaseResponse.h"

static NSString * const Host = @"https://app.randallwang.com";

//static NSString * const Host = @"http://localhost:12306";


@implementation TCBaseRequest



- (NSString *)requestPath {
    return @"";
}

- (NSURL *)requestURL {
    NSURL *hostURL = [NSURL URLWithString:Host];
    return [hostURL URLByAppendingPathComponent:[self requestPath]];
}


- (TCHttpMethod)requestMethod {
    return TCHttpMethodGET;
}


- (Class)responseClass {
    return [TCBaseResponse class];
}


@end
