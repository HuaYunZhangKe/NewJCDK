//
//  AppDelegate.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "AppDelegate.h"
#import <UMSocialCore/UMSocialCore.h>
#import "WXApi.h"
#import "WXApiManager.h"
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = self.jcdkTabbarVC;
    [self settingUMConfigue];

    [WXApi registerApp:WX_AppID withDescription:@"ike"];

    NSLog(@"app path:%@",[[NSBundle mainBundle] bundlePath]);
    return YES;
}
- (void)settingUMConfigue
{
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UM_appkey];
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WX_AppID appSecret:WX_AppSecret redirectURL:@"http://www.pingspread.com"];
    //QQ
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQ_AppID appSecret:QQ_APPKey redirectURL:@"http://www.pingspread.com"];
    //设置新浪的appId和appKey
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:Sina_APPKey  appSecret:Sina_AppSecret redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
        return result;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    
    
    return result;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 懒加载
- (JCDKTabBarVC *)jcdkTabbarVC
{
    if (!_jcdkTabbarVC)
    {
        _jcdkTabbarVC = [[JCDKTabBarVC alloc] init];
    }
    return _jcdkTabbarVC;
}


@end
