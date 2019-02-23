//
//  TCTask.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^taskFinishedBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface TCTask : NSObject

@property (nonatomic, assign) BOOL finished;

- (void)start;

- (void)taskFinished:(taskFinishedBlock)completion;

@end

NS_ASSUME_NONNULL_END
