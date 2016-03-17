//
//  UIImage+HSImage.h
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HSImage)

/** 用于主流框架，传入图片名称，返回没有渲染的图片(原始文件) ***/
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;
/**  裁剪为圆形图片  ***/
+ (UIImage *)imageWithCircleImageName:(NSString *)imageName;

@end
