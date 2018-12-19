//
//  TCItemModel.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCItemModel.h"

@implementation TCItemModel



- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,description:%@", self.itemName, self.itemDescription];
}


@end
