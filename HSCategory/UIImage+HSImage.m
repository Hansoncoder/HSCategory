//
//  UIImage+HSImage.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIImage+HSImage.h"

@implementation UIImage (HSImage)

+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName {
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 发回为渲染的图片
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithCircleImageName:(NSString *)imageName {
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 开启上下文
    UIGraphicsBeginImageContext(image.size);
    // 指定圆环路径并设置裁剪区域
    CGFloat imageMinSize = image.size.width < image.size.height? : image.size.height;
    CGRect circleRect = CGRectMake(0, 0, imageMinSize, imageMinSize);
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(contex, circleRect);
    CGContextClip(contex);
    // 将图片添加到上下文
    [image drawAsPatternInRect:circleRect];
    //获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    //返回图片
    return image;
}

@end
