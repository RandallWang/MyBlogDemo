//
//  TCTask.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "TCTask.h"

@interface TCTask()

@property (nonatomic, assign) double duration;
@property (nonatomic, copy)taskFinishedBlock finishBlock;
@property (nonatomic, assign) BOOL isRuning;

@end

@implementation TCTask

- (instancetype)init {
    self = [super init];
    if (self) {
        self.duration = drand48() + arc4random_uniform(3);
        self.finished = NO;
    }
    return self;
}

- (void)start {
    if (self.isRuning) {
        return;
    }
    
    self.isRuning = YES;
    NSDate *date = [NSDate date];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"finsihed:%f,test duration:%f", self.duration, [[NSDate date] timeIntervalSinceDate:date]);
        self.finished = YES;
//        if (self.finishBlock) {
            self.finishBlock();
//        }
    });
}

- (void)taskFinished:(taskFinishedBlock)completion {
    self.finishBlock = completion;
}

@end
