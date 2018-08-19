//
//  TCImage.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCImage.h"

@implementation TCImage

+ (UIImage *)imageNamed:(NSString *)name {
//    NSLog(@"iamge alloc");
    return [TCImage imageNamed:name];
}

+ (UIImage *)imageWithContentsOfFile:(NSString *)path {
//    NSLog(@"iamge alloc");
    TCImage *image = [[TCImage alloc] initWithContentsOfFile:path];
    return image;
}

- (void)dealloc {
//    NSLog(@"image dealloc,by the way, UIImage is really different");
}

@end
