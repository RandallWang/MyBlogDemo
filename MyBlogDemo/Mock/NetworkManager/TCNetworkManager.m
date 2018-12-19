//
//  TCNetworkManager.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/18.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCNetworkManager.h"

@implementation TCNetworkManager




- (NSString *)requestURL {
    return @"/listItems";
}

- (TCHttpMethod)requestMethod {
    return TCHttpMethodGET;
}

@end
