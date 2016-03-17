//
//  NSObject+performSelector.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "NSObject+performSelector.h"

@implementation NSObject (performSelector)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects
{
    //  1.创建签名对象
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    
    // 判断传入的方法是否存储, 如果方法不存在签名对象为nil
    if (signature == nil) {
        // 传入的方法不存在
        NSString *info = [NSString stringWithFormat:@" -[%@ %@]:  unrecognized selector sent to instance %p", [self class], NSStringFromSelector(aSelector),self];
        
        @throw [[NSException alloc] initWithName:@"发送未知消息" reason:info userInfo:nil];
    }
    
    // 2.创建一个NSInvocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
     // 3.保存方法所属的对象
    invocation.target = self;
    
    // 给invocation设置的方法, 必须和签名中的方法一致
    //  4.保存方法名称
    invocation.selector = aSelector;
    
    // 5.设置参数
    /*
     当前如果直接遍历参数数组来设置参数, 会存在问题
     如果参数数组元素多余参数个数, 那么就会报错
     */
    NSUInteger arguments =  signature.numberOfArguments;
    /*
     如果直接遍历参数值的个数, 会存在问题
     如果参数的个数大于了参数值的个数, 那么数组会越界
     */
    NSUInteger objectsCount = objects.count + 2;
    /*
     参数和参数值, 谁少就遍历谁
     */
    NSUInteger count = MIN(arguments, objectsCount);
    
    for (int i = 2; i < count; i++) {
        NSObject *obj = objects[i - 2];
        // 处理数组参数中NSNull问题
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:i];
    }
    
    // 6.调用NSInvocation对象的invoke方法
    [invocation invoke];
    
    id res = nil;
    // 判断当前方法是否有返回值
//    NSLog(@"ReturnType = %zd", signature.methodReturnLength);
    if ( signature.methodReturnLength != 0) {
        // 7.获取返回值
        // getReturnValue方法会将会去到的方法返回值赋值给传入的对象
        [invocation getReturnValue:&res];
    }
    
    return res;
}
@end
