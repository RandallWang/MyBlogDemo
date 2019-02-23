//
//  TCTaskQueueViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "TCTaskQueueViewController.h"
#import "TCTaskQueue.h"
#import "TCTask.h"

@interface TCTaskQueueViewController ()

@end

@implementation TCTaskQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    TCTask *task = [[TCTask alloc] init];
//    [task start];
//    [task taskFinished:^{
//        NSLog(@"task finished");
//    }];
    
    TCTaskQueue *taskQueue = [[TCTaskQueue alloc] init];

    for (int i = 0; i < 10; i ++) {
        TCTask *task = [[TCTask alloc] init];
        [taskQueue enqueue:task];
    }

    [taskQueue finishedWithCompletion:^{
        NSLog(@"all tasks finished!");
    }];
    
    [taskQueue start];

    self.view.backgroundColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
