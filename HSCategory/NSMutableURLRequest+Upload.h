//
//  NSMutableURLRequest+Upload.h
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (Upload)

/*
 * 返回一个上传的请求
 * uploadURL : 文件上传的服务器路径
 * fileURL: 文件上传的本地路径
 * uploadField :服务器指定的上传文件字段
 */
+(instancetype)uploadRequestWithUploadURL:(NSURL *)uploadURL fileURL:(NSURL *)fileURL uploadField:(NSString *)uploadField;

@end
