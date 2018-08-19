//
//  TCImage.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCImage : UIImage

+ (UIImage *)imageNamed:(NSString *)name;

+ (UIImage *)imageWithContentsOfFile:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
