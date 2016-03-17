//
//  UIView+Frame.h
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 提示：
// @property在类中功能:会自动生成get,set方法的声明和实现,和_成员属性.
// @property在分类功能:只会生成get,set方法的声明
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
/** 控件最顶部那根线的位置(minY的位置) */
@property (nonatomic, assign) CGFloat top;
/** 控件最底部那根线的位置(maxY的位置) */
@property (nonatomic, assign) CGFloat bottom;
/** 控件最左边那根线的位置(minX的位置) */
@property (nonatomic, assign) CGFloat left;
/** 控件最右边那根线的位置(maxX的位置) */
@property (nonatomic, assign) CGFloat right;

@end
