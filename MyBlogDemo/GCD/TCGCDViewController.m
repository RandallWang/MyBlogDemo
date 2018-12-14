//
//  TCGCDViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/14.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCGCDViewController.h"

@interface TCGCDViewController ()

@end

@implementation TCGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCD";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self serialQueue];
//    [self concurrentQueue];
    
//    [self dispatchGroup1];
//    [self dispatchGroup2];
//    [self dispatchGroup3];
    
//    [self dispatchBarrierAsync];
    
    [self createaDeadLock];
}

- (void)serialQueue {
    NSLog(@"Serial Queue");
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    dispatch_async(serialQueue, ^{
        NSLog(@"1");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"2");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"3");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"4");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"5");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"6");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"7");
    });
}

- (void)concurrentQueue {
    NSLog(@"Concurrent Queue");
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        NSLog(@"1");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"2");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"3");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"4");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"5");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"6");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"7");
    });
}

- (void)dispatchGroup1 {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_group_async(group, globalQueue, ^{
        sleep(1);
        NSLog(@"Do Something1");
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Do Something2");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"Done");
    });
}

- (void)dispatchGroup2 {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);

    dispatch_group_enter(group);
    dispatch_async(globalQueue, ^{
        sleep(1);
        NSLog(@"Do Something1");
        dispatch_group_leave(group);
    });
    
    
    dispatch_group_enter(group);
    dispatch_async(globalQueue, ^{
        sleep(0.5);
        NSLog(@"Do Something2");
        dispatch_group_leave(group);
    });

    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"Done");
    });
}

- (void)dispatchGroup3 {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_group_async(group, globalQueue, ^{
        sleep(1);
        NSLog(@"Do Something1");
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"Do Something2");
    });

    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"Done");
}

- (void)dispatchBarrierAsync {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue.barrier.test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
        sleep(1);
        NSLog(@"Read Something1");
    });
    
    dispatch_async(concurrentQueue, ^{
        sleep(0.5);
        NSLog(@"Read Something2");
    });

    dispatch_async(concurrentQueue, ^{
        sleep(0.5);
        NSLog(@"Read Something3");
    });

    dispatch_barrier_async(concurrentQueue, ^{
        NSLog(@"write something");
    });
    
    dispatch_async(concurrentQueue, ^{
        sleep(1);
        NSLog(@"Read Something4");
    });

    dispatch_async(concurrentQueue, ^{
        sleep(0.5);
        NSLog(@"Read Something5");
    });

    dispatch_async(concurrentQueue, ^{
        sleep(0.5);
        NSLog(@"Read Something6");
    });
}

- (void)createaDeadLock {
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"This is a dead lock!");
    });
}








@end
