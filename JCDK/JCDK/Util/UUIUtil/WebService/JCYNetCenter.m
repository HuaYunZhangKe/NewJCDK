//
//  JCYNetCenter.m
//  jingchengyou
//
//  Created by Binea on 15/8/30.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import "JCYNetCenter.h"
#import "NSString+JSON.h"



@implementation JCYNetCenter

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSDictionary* jsonObject))success
   failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
{
    AFHTTPSessionManager *manager = [JCYNetCenter managerWithBaseURL:nil sessionConfiguration:NO];
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id jsonObject = [NSString JSONValueWithData:responseObject];
        if (success)
        {
            success(jsonObject);
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(task,error);
        }
    }];
}

+(void)POST:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(NSDictionary* jsonObject))success
    failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
{
    AFHTTPSessionManager *manager = [JCYNetCenter managerWithBaseURL:nil sessionConfiguration:NO];
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        id jsonObject = [NSString JSONValueWithData:responseObject];
        if (success)
        {
            success(jsonObject);
        }
        
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(task,error);
        }
    }];
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
