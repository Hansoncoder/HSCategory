//
//  NSObject+performSelector.h
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (performSelector)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end
