
//
//  TCBaseResponse.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCBaseResponse.h"

@implementation TCBaseResponse

+ (instancetype)resultFromResponseData:(NSDictionary *)responseData {
    if (responseData) {
        return [[self alloc] init];
    }
    return nil;
}

@end
