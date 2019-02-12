//
//  FakeNetRequest.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/23.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^response)(NSDictionary *);

@interface FakeNetRequest : NSObject

- (void)startRequest;



@end

NS_ASSUME_NONNULL_END
