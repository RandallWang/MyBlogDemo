//
//  TCBaseResponse.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCBaseResponse : NSObject

+ (instancetype)resultFromResponseData:(NSDictionary *)responseData;

@end

NS_ASSUME_NONNULL_END
