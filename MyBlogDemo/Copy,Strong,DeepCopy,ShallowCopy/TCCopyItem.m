//
//  TCCopyItem.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCCopyItem.h"


@implementation TCCopyItem

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    TCCopyItem *itemCopy = [[[self class] allocWithZone:zone] initWithName:_name];
    return itemCopy;
}

- (id)deepCopy {
    TCCopyItem *deepCopy = [[[self class] alloc] initWithName:_name];
    return deepCopy;
}


@end
