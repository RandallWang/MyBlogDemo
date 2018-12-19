//
//  TCListItemRequest.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCListItemRequest.h"
#import "TCListItemResponse.h"

@implementation TCListItemRequest

- (NSString *)requestPath {
    return @"/listItems";
}

- (TCHttpMethod)requestMethod {
    return TCHttpMethodGET;
}

- (Class)responseClass {
    return [TCListItemResponse class];
}

@end
