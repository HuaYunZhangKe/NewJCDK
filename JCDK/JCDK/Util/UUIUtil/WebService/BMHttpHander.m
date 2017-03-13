//
//  WebService.m
//  StoreHouse
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "BMHttpHander.h"
#import "Reachability.h"
@implementation BMHttpHander
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
//Get请求
+ (NSURLSessionDataTask *)GetRequest:(NSString *)urlStr WithParameters:(NSDictionary *)parameters WithSuccess:(successBlock)success WithFail:(failBlock) fail
{
    if (![[Reachability reachabilityForInternetConnection] isReachable])
    {
        NSLog(@"网络不可用");
        return nil;
    }
    //NSURLSession
    
    if (urlStr.length == 0 || parameters.count == 0)
    {
        NSLog(@"url为空或者参数为空");
//        return nil;
    }
    //将输入参数拼接到http://api.pingspread.com后
    NSString *urlString = urlStr;
    for (int i = 0; i < parameters.count; i ++)
    {
        NSArray *keyArr = [parameters allKeys];
        if (i == 0)
        {
            NSString *key =  keyArr[i];
            NSString *tempStr = [NSString stringWithFormat:@"?%@=%@",key,[parameters objectForKey:key]];
            urlString = [urlString stringByAppendingString:tempStr];
        }
        else
        {
            NSString *key =  keyArr[i];
            NSString *tempStr = [NSString stringWithFormat:@"&%@=%@",key,[parameters objectForKey:key]];
            urlString = [urlString stringByAppendingString:tempStr];
        }
    }
    //创建http请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    if (request == nil)
    {
        NSLog(@"request为空请检查参数");
        return nil;
    }
    request.HTTPMethod = @"GET";
//    [request setAllHTTPHeaderFields:@{@"accept":@"application/json",
//                                      @"content-type":@"application/json"
//                                      }];
    NSLog(@"%@", request);
    //创建session
    __block NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [[[BMHttpHander alloc] init]  dataHanderWithData:data WithResponse:response WithError:error WithSuccess:success WithFail:fail];
    }];
    //发送http请求
    [dataTask resume];
    return dataTask;
}

//Post请求

+ (NSURLSessionDataTask *)PostRequest:(NSString *)urlStr WithParameters:(NSDictionary *)parameters WithSuccess:(successBlock)success WithFail:(failBlock) fail
{
    if (![[Reachability reachabilityForInternetConnection] isReachable])
    {
        NSLog(@"网络不可用");
        return nil;
    }
    //NSURLSession
    
    if (urlStr.length == 0 || parameters.count == 0)
    {
        NSLog(@"url为空或者参数为空");
        return nil;
    }
    NSData *para = [[BMHttpHander alloc] HTTPBodyWithParameters1:parameters];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
        NSString *SeparatorStr = @"BM";

    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",SeparatorStr];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[para length]] forHTTPHeaderField:@"Content-Length"];
    request.HTTPMethod = @"POST";
//    NSData *bodyData = [para dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = para;
    __block NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [[[BMHttpHander alloc] init]  dataHanderWithData:data WithResponse:response WithError:error WithSuccess:success WithFail:fail];
    }];
    [dataTask resume];
    return dataTask;
}
+ (NSURLSessionDataTask *)PostRequest1:(NSString *)urlStr WithParameters:(NSDictionary *)parameters WithSuccess:(successBlock)success WithFail:(failBlock) fail
{
    if (![[Reachability reachabilityForInternetConnection] isReachable])
    {
        NSLog(@"网络不可用");
        return nil;
    }
    //NSURLSession
    
    if (urlStr.length == 0 || parameters.count == 0)
    {
        NSLog(@"url为空或者参数为空");
        return nil;
    }
    //将输入参数拼接到http://api.pingspread.com后
    NSString *urlString = urlStr;
    for (int i = 0; i < parameters.count; i ++)
    {
        NSArray *keyArr = [parameters allKeys];
        if (i == 0)
        {
            NSString *key =  keyArr[i];
            NSString *tempStr = [NSString stringWithFormat:@"?%@=%@",key,[parameters objectForKey:key]];
            urlString = [urlString stringByAppendingString:tempStr];
        }
        else
        {
            NSString *key =  keyArr[i];
            NSString *tempStr = [NSString stringWithFormat:@"&%@=%@",key,[parameters objectForKey:key]];
            urlString = [urlString stringByAppendingString:tempStr];
        }
    }
    //创建http请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
    if (request == nil)
    {
        NSLog(@"request为空请检查参数");
        return nil;
    }
    request.HTTPMethod = @"POST";
        [request setAllHTTPHeaderFields:@{@"accept":@"application/json",
                                          @"content-type":@"application/json"
                                          }];
    NSLog(@"%@", request);
    //创建session
    __block NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [[[BMHttpHander alloc] init]  dataHanderWithData:data WithResponse:response WithError:error WithSuccess:success WithFail:fail];
    }];
    //发送http请求
    [dataTask resume];
    return dataTask;
}

//拼接httpbody
- (NSString *)HTTPBodyWithParameters:(NSDictionary *)parameters
{
    NSMutableArray *parametersArray = [[NSMutableArray alloc]init];
    
    for (NSString *key in [parameters allKeys]) {
        id value = [parameters objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [parametersArray addObject:[NSString stringWithFormat:@"%@=%@",key,value]];
        }
        
    }
    
    return [parametersArray componentsJoinedByString:@"&"];
}
- (NSData *)HTTPBodyWithParameters1:(NSDictionary *)parameters
{
    NSMutableArray *parametersArray = [[NSMutableArray alloc]init];
    NSString *SeparatorStr = @"BM";
    //分界线 --BM
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",SeparatorStr];
    // 结束符 --BM--
    NSString *lastStr = [[NSString alloc]initWithFormat:@"--%@--",SeparatorStr];

    NSArray *picArr = @[@"avatar",@"cover",@"card_reverse",@"card_reverse",@"image"];
    NSMutableString *bodyNoPic=[[NSMutableString alloc]init];
    NSMutableData *bodyData=[[NSMutableData alloc]init];
    [bodyNoPic appendString:@"\r\n"];
    int i = 0;
    for (NSString *key in [parameters allKeys])
    {
        
        if (![picArr containsObject:key])
        {
            //添加分界线，换行
            [bodyNoPic appendFormat:@"%@\r\n",MPboundary];
            //添加字段名称，换2行
            [bodyNoPic appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
            //添加字段的值
            [bodyNoPic appendFormat:@"%@\r\n",[parameters objectForKey:key]];
        }
        else
        {
            NSMutableString *bodyPic = [[NSMutableString alloc] init];

            ////添加分界线，换行
            [bodyPic appendFormat:@"%@\r\n",MPboundary];
            //声明pic字段，文件名为boris.png
            [bodyPic appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"boris.png\"\r\n",key];
            //声明上传文件的格式
            [bodyPic appendFormat:@"Content-Type: image/png\r\n\r\n"];
            //image Data转换为String
            NSMutableData *picTempData = [[NSMutableData alloc] init];
            [picTempData appendData:[bodyPic dataUsingEncoding:NSUTF8StringEncoding]];
            [picTempData appendData:[parameters objectForKey:key]];
            [picTempData appendData:[ @"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [bodyData appendData:picTempData];
          
        }
        i ++;
    }
    NSMutableData *noPicData = [[NSMutableData alloc] init];
   [noPicData appendData:[ bodyNoPic dataUsingEncoding:NSUTF8StringEncoding]];
    [noPicData appendData:bodyData];
    [noPicData appendData:[lastStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *string = [[NSString alloc] initWithData:noPicData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
    return noPicData;
}

//数据处理
-  (void)dataHanderWithData:(NSData * _Nullable) data WithResponse:(NSURLResponse * _Nullable) response WithError:(NSError * _Nullable) error WithSuccess:(successBlock)success WithFail:(failBlock) fail
{
    if (!error)
    {
        //请求成功
        NSError *jsonerror;
        NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonerror];
        if (jsonerror)
        {
            //json解析失败
            NSLog(@"json解析错误:%@", jsonerror);
            NSLog(@"mark:   %@", jsonStr);
            success(data, response);
        }
        else
        {
            //json解析成功
            if ([result isKindOfClass:[NSDictionary class]])
            {
                success(data, response);
            }
        }
    }
    else
    {
        //请求失败
        fail(data, response);
        NSLog(@"response-error:%@", error);
        
    }
    
}

@end
