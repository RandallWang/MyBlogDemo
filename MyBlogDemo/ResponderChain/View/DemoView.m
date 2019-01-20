//
//  DemoView.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/20.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@--hitTest", self.name);

    return [super hitTest:point withEvent:event];
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@--pointInside", self.name);

    return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@--touchesBegan********", self.name);
}

@end
