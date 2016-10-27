//
//  ToolObject.h
//  meiya
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 ZK. All rights reserved.
//IOS基本工具类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^alertClickBlock)(void);
typedef void(^actionClickBlock)(int index);

@interface ToolObject : NSObject

+ (void)showAlertWith:(NSString *)title AndContent:(NSString *)content AndViewController:(id)vController AndCallBack:(alertClickBlock)alertClick;

+ (void)showActionSheetWithTitle:(NSString *)title Item1:(NSString *)item1 AndItem2:(NSString *)item2  AndItem3:(NSString *)item3 AndViewController:(id)vController AndCallBack:(actionClickBlock)alertClick;

+ (BOOL)RegularExpressionsWithStr:(NSString *)str;
+ (void)showHudFromView:(UIView *)view WithTitle:(NSString*)title;
+ (void)hiddeHudFromView:(UIView *)view;

@end
