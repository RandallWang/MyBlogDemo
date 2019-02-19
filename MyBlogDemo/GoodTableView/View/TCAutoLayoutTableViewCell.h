//
//  TCAutoLayoutTableViewCell.h
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/12.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCAutoLayoutTableViewCell : UITableViewCell

- (void)setImages:(NSArray <UIImage*>*)images;

- (void)setAvatar:(UIImage *)avatar;

- (void)setDes:(NSString *)des;

@end

NS_ASSUME_NONNULL_END
