//
//  TCTaskQueue.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "TCTaskQueue.h"
#import "TCTask.h"

@interface TCTaskQueue()

@property (nonatomic, strong)NSMutableArray *tasks;
@property (nonatomic, assign)BOOL isStarted;
@property (nonatomic, copy)finishCompletion finishBlock;
@property (nonatomic, strong)dispatch_queue_t serialQueue;

@end

@implementation TCTaskQueue

- (NSMutableArray *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableArray array];
    }
    return  _tasks;
}

- (void)enqueue:(TCTask *)task {
    NSLock *enqueueLock = [[NSLock alloc] init];
    
    [enqueueLock lock];
    [self.tasks addObject:task];
    [enqueueLock unlock];
}

- (TCTask *)dequeue {
    TCTask *finishedTask = self.tasks.firstObject;
    
    if (finishedTask && finishedTask.finished) {
        NSLock *dequeueLock = [[NSLock alloc] init];
        
        [dequeueLock lock];
        [self.tasks removeObjectAtIndex:0];
        [dequeueLock unlock];
    }
    
    NSLog(@"dequeue successed");
    [self nextTask];
    return finishedTask;
}

- (void)start {
    if (self.isStarted) {
        return;
    }
    self.serialQueue = dispatch_queue_create("serialQueue", NULL);

    dispatch_async(self.serialQueue, ^{
        TCTask *task = self.tasks.firstObject;

        if (task) {

            [task taskFinished:^{
                NSLog(@"finished");
                [self dequeue];
                
            }];
            
            [task start];
        }else {
            self.finishBlock();
        }
    });
}

- (void)nextTask {
    dispatch_async(self.serialQueue, ^{
        TCTask *task = self.tasks.firstObject;
        
        if (task) {
            [task taskFinished:^{
                NSLog(@"finished");
                [self dequeue];
                
            }];
            
            [task start];
        }else {
            self.finishBlock();
        }
    });
}

- (void)finishedWithCompletion:(finishCompletion)completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.finishBlock = completion;
    });
}


@end
