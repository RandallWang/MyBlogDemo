//
//  TCBaseRequest.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TCHttpMethodPOST,
    TCHttpMethodGET,
} TCHttpMethod;


NS_ASSUME_NONNULL_BEGIN

@interface TCBaseRequest : NSObject


- (NSString *)requestPath;

- (NSURL *)requestURL;


- (TCHttpMethod)requestMethod;


- (Class)responseClass;



@end

NS_ASSUME_NONNULL_END
