//
//  TCViewModel.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/9.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCViewModel.h"

@implementation TCViewModel

- (instancetype)initWithTitle:(NSString *)title targetVCName:(NSString *)vcName {
    self = [super init];
    if (self) {
        _title = title;
        _targetVCName = vcName;
    }
    return self;
}

@end
