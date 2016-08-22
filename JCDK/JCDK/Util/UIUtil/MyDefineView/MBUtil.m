//
//  MBUtil.m
//  youzhitou
//
//  Created by 张科 on 16/6/5.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "MBUtil.h"
@implementation MBUtil
static MBProgressHUD *hud;

+(void)showTotastView:(UIView *)View WithTitle:(NSString *)title;
{
    if (hud)
    {
        hud = nil;
        hud = [MBProgressHUD showHUDAddedTo:View animated:YES];
        hud.labelText = title;
        hud.mode = MBProgressHUDModeText;
        [hud hide:YES afterDelay:1.0];

    }
    else
    {
        hud = [MBProgressHUD showHUDAddedTo:View animated:YES];
        hud.labelText = title;
        hud.mode = MBProgressHUDModeText;
        [hud hide:YES afterDelay:1.0];

    }
}
@end
