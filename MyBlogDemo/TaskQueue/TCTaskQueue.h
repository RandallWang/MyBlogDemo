//
//  TCTaskQueue.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TCTask;

NS_ASSUME_NONNULL_BEGIN

typedef void(^finishCompletion)(void);

@interface TCTaskQueue : NSObject


- (void)enqueue:(TCTask *)task;

- (void)start;

- (void)finishedWithCompletion:(finishCompletion)completion;
@end

NS_ASSUME_NONNULL_END
