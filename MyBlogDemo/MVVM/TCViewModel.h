//
//  TCViewModel.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/9.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCViewModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *targetVCName;


- (instancetype)initWithTitle:(NSString *)title targetVCName:(NSString *)vcName NS_DESIGNATED_INITIALIZER;

- (instancetype)init __attribute__((unavailable("init not available, Call NS_DESIGNATED_INITIALIZER instead")));


@end

NS_ASSUME_NONNULL_END
