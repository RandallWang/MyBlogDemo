//
//  BaseViewController.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/5/9.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCBlogModel;

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong)TCBlogModel *model;
    
@end

NS_ASSUME_NONNULL_END
