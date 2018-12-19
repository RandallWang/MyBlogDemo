//
//  TCNetworkManager.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/18.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TCBaseRequest;
@class TCBaseResponse;


@protocol TCNetworkDelegate

- (void)successedWithResponse:(TCBaseResponse *)response;
- (void)failedWithError:(NSError *)error;

@end


NS_ASSUME_NONNULL_BEGIN

@interface TCNetworkManager : NSObject

@property (nonatomic, weak) id<TCNetworkDelegate> delegate;

+ (instancetype)manager;

- (void)startRequest:(TCBaseRequest *)request;


@end

NS_ASSUME_NONNULL_END
