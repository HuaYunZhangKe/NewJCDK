//
//  WebService.h
//  StoreHouse
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^successBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response);
typedef void(^failBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response);;

@interface BMHttpHander : NSObject
//get请求
+ (NSURLSessionDataTask * _Nullable)GetRequest:(NSString * _Nullable)urlStr WithParameters:(NSDictionary * _Nullable)parameters WithSuccess:(successBlock  _Nullable)success WithFail:(failBlock  _Nullable) fail;
//Post请求

+ (NSURLSessionDataTask * _Nullable)PostRequest:(NSString * _Nullable)urlStr WithParameters:(NSDictionary * _Nullable)parameters WithSuccess:(successBlock  _Nullable)success WithFail:(failBlock  _Nullable) fail;
+ (NSURLSessionDataTask * _Nullable)PostRequest1:(NSString * _Nullable)urlStr WithParameters:(NSDictionary * _Nullable)parameters WithSuccess:(successBlock  _Nullable)success WithFail:(failBlock  _Nullable) fail;
-  (void)dataHanderWithData:(NSData * _Nullable) data WithResponse:(NSURLResponse * _Nullable) response WithError:(NSError * _Nullable) error WithSuccess:(successBlock  _Nullable)success WithFail:(failBlock  _Nullable) fail;
@end
