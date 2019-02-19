//
//  TCAutoLayoutTableViewCell.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/2/12.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "TCAutoLayoutTableViewCell.h"

@interface TCAutoLayoutTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation TCAutoLayoutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setImages:(NSArray <UIImage*>*)images {
    self.imageView1.image = images[0];
    self.imageView2.image = images[1];
    self.imageView3.image = images[2];
}

- (void)setAvatar:(UIImage *)avatar {
    self.avatarImageView.image = avatar;
}

- (void)setDes:(NSString *)des {
    self.desLabel.text = des;
}

@end
