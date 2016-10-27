//
//  JCYNetCenter.h
//  jingchengyou
//
//  Created by Binea on 15/8/30.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface JCYNetCenter : NSObject

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSDictionary* jsonObject))success
   failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;

+(void)POST:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSDictionary* jsonObject))success
   failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;
@end
