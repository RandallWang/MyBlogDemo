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
        _name = [name copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    TCCopyItem *itemCopy = [[[self class] allocWithZone:zone] initWithName:_name];
    return itemCopy;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@, address:%p", self.name, self];
}

@end
