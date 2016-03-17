//
//  NSMutableURLRequest+Upload.m
//  HSCategory
//
//  Created by Mac on 14/3/9.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "NSMutableURLRequest+Upload.h"

@implementation NSMutableURLRequest (Upload)

+(instancetype)uploadRequestWithUploadURL:(NSURL *)uploadURL fileURL:(NSURL *)fileURL uploadField:(NSString *)uploadField{
    // 1.2创建POST请求
    NSMutableURLRequest *request= [NSMutableURLRequest requestWithURL:uploadURL];
    request.HTTPMethod = @"POST";
    
    // 2.要设置请求头Content-Type为固定格式
    //boundary 分隔符，可以随便写
    // UUID 惟一的标识符
    NSString *randomStr =  [NSUUID UUID].UUIDString;
    randomStr = [randomStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",randomStr];
    NSLog(@"contentType %@",contentType);
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    
    //3.要设置请求体的内容为固定的格式
    request.HTTPBody = [request requestBodyWithBoundary:randomStr fileURL:fileURL uploadField:uploadField];
    
    return request;
    
}

#pragma mark 返回上传文件的请求体(二进制)
/**
 * boundary 分隔符
 * fileURL 上传文件的本地路径
 */
-(NSData *)requestBodyWithBoundary:(NSString *)boundary fileURL:(NSURL *)fileURL uploadField:(NSString *)uploadField{
    NSMutableData *data = [NSMutableData data];
    
    NSMutableString *topStr = [NSMutableString string];
    // 第1行
    [topStr appendFormat:@"--%@\n",boundary];
    
    // 第2行
    /*
     * name 的值不是固定，是服务器指定的字段
     * filename:文件保存名字
     */
    // 随机文件名
    
    NSString *filename = [NSString stringWithFormat:@"%@.%@",boundary,[fileURL.absoluteString pathExtension]];
    
    
    [topStr appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\n",uploadField,filename];
    
    // 第3行,添加文件上传的类型
    NSString *mimeType = [self mimeTypeWithFileURL:fileURL];
    [topStr appendFormat:@"Content-Type: %@\n",mimeType];
    
    // 第4行
    [topStr appendString:@"\n"];
    
    
    
    // 把顶部的二进制添加到data
    [data appendData:[topStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 第5行(添加图片的二进制数据)
    NSData *fileData = [NSData dataWithContentsOfURL:fileURL];
    [data appendData:fileData];
    
    // 尾部字符串拼接
    NSMutableString *bottomStr = [NSMutableString string];
    
    // 第6行
    [bottomStr appendFormat:@"\n--%@\n",boundary];
    
    // 第7行
    [bottomStr appendFormat:@"Content-Disposition: form-data; name=\"submit\"\n"];
    
    // 第8行
    [bottomStr appendString:@"\n"];
    
    // 第9行
    [bottomStr appendString:@"Submit\n"];
    
    // 第10行
    [bottomStr appendFormat:@"--%@--\n",boundary];
    
    // 拼接尾部的二进制数据
    [data appendData:[bottomStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSLog(@"%@",topStr);
    
    NSLog(@"%@",bottomStr);
    return [data copy];
}


/*返回文件的类型*/
-(NSString *)mimeTypeWithFileURL:(NSURL *)fileURL{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
    
    //2.使用NSURLConnection这个类获取MIMEType
    // 本地请求
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"文件的类型%@",response.MIMEType);
    
    return response.MIMEType;
    
}

@end
