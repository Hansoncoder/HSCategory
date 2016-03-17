//
//  NSString+MIME.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "NSString+MIME.h"

@implementation NSString (MIME)
- (NSString *)MIMEType
{
    // 1.创建URL
    NSURL *url = [NSURL fileURLWithPath:self];
    // 2.创建一个Request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.利用NSURLConnection发送请求
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    return response.MIMEType;
}
@end
