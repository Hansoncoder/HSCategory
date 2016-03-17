//
//  UIView+nearestVc.h
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (nearestVc)

// 拿到离view最近的控制器
- (UIViewController *)nearestVc;

// 拿到离view最近的导航控制器
- (UINavigationController *)nearestNav;


@end
