//
//  TCListItemResponse.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCBaseResponse.h"

@class TCItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface TCListItemResponse : TCBaseResponse

@property (nonatomic, copy)NSArray <TCItemModel *>*items;

@end

NS_ASSUME_NONNULL_END
