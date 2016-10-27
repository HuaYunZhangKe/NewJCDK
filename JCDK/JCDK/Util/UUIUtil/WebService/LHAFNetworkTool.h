
#import <Foundation/Foundation.h>

typedef void (^LHResponseSuccess)(NSURLSessionDataTask * task,id responseObject,NSInteger codetype, NSInteger codeMessage);

/**
 *  宏定义请求失败的block
 *
 *  @param error 报错信息
 */
typedef void (^LHResponseFail)(NSURLSessionDataTask * task, NSError * error);


@interface LHAFNetworkTool : NSObject



/**
 *  普通get方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+(void)GET:(NSString *)url
    params:(NSDictionary *)params success:(LHResponseSuccess)success
      fail:(LHResponseFail)fail;
+(void)POST:(NSString *)url params:(NSDictionary *)params
    success:(LHResponseSuccess)success fail:(LHResponseFail)fail;
@end
