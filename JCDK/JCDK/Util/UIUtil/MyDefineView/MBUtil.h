//
//  MBUtil.h
//  youzhitou
//
//  Created by 张科 on 16/6/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
@interface MBUtil : NSObject
+(void)showTotastView:(UIView *)View WithTitle:(NSString *)title;
+(void)showHudView:(UIView *)View WithTitle:(NSString *)title;
+(void)hideHud:(UIView *)view;



@end
