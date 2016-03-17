//
//  UIView+nearestVc.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIView+nearestVc.h"

@implementation UIView (nearestVc)

- (UIViewController *)nearestVc
{
    return (UIViewController *)[self nearsetVC:[UIViewController class]];
}

- (UINavigationController *)nearestNav
{
    return (UINavigationController *)[self nearsetVC:[UINavigationController class]];
}

- (UIViewController *)nearsetVC:(Class)vcClass
{
    for (UIView *view = self; view.superview; view = view.superview) {
        UIResponder *res = view.nextResponder;
        if ([res isKindOfClass:vcClass]) {
            return (UIViewController *)res;
        }
    }
    
    return nil;
}

@end
