//
//  UIView+Frame.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - setter methods

- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setTop:(CGFloat)top {
    self.y = top;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)left {
    self.x = left;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

#pragma mark - getter methods

- (CGFloat)x { return self.frame.origin.x; }

- (CGFloat)y { return self.frame.origin.y; }

- (CGFloat)width { return  self.bounds.size.width; }

- (CGFloat)height { return  self.bounds.size.height; }

- (CGFloat)centerX { return self.center.x; }

- (CGFloat)centerY { return self.center.y; }

- (CGFloat)top { return self.y; }

- (CGFloat)right { return CGRectGetMaxX(self.frame); }

- (CGFloat)left { return self.x; }

- (CGFloat)bottom { return CGRectGetMaxY(self.frame); }

@end
