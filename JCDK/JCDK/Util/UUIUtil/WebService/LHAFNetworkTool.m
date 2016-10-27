//
//  LHAFNetworkTool.m
//  MVC
//
//  Created by dllo on 15/11/6.
//  Copyright © 2015年 蓝鸥科技.李贺. All rights reserved.
//

#import "LHAFNetworkTool.h"
#import "AFNetworking.h"
#import "NSString+JSON.h"



@implementation LHAFNetworkTool

#pragma mark - GET请求

+(void)GET:(NSString *)url params:(NSDictionary *)params
   success:(LHResponseSuccess)success fail:(LHResponseFail)fail{
    
    AFHTTPSessionManager *manager = [LHAFNetworkTool managerWithBaseURL:nil sessionConfiguration:NO];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        id dic = [LHAFNetworkTool responseConfiguration:responseObject];
        NSDictionary *tempDic = [NSDictionary dictionaryWithDictionary:dic];
        NSString *code = tempDic[@"code"];
        NSInteger codeType = [code integerValue] / 1000;
        NSInteger codeMessage = [code integerValue] % 1000;
        success(task,dic, codeType, codeMessage);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];

}

+(void)POST:(NSString *)url params:(NSDictionary *)params
    success:(LHResponseSuccess)success fail:(LHResponseFail)fail{
    
    AFHTTPSessionManager *manager = [LHAFNetworkTool managerWithBaseURL:nil sessionConfiguration:NO];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dic = [LHAFNetworkTool responseConfiguration:responseObject];
        NSDictionary *tempDic = [NSDictionary dictionaryWithDictionary:dic];
        NSString *code = tempDic[@"code"];
        NSInteger codeType = [code integerValue] / 1000;
        NSInteger codeMessage = [code integerValue] % 1000;
        
        success(task,dic, codeType, codeMessage);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task,error);
    }];
}
#pragma mark - Private
+(id)responseConfiguration:(id)responseObject{
//    
 NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
  string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
   NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    
    return dic;
}



+(AFHTTPSessionManager *)managerWithBaseURL:(NSString *)baseURL  sessionConfiguration:(BOOL)isconfiguration{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager =nil;
    
    NSURL *url = [NSURL URLWithString:baseURL];
    
    if (isconfiguration) {
        
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
    }else{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    // 3. 设置响应数据的基本了类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil]];
    

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}
@end
