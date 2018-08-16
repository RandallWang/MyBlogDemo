//
//  TCCopyItem.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCCopyItem : NSObject<NSCopying>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
