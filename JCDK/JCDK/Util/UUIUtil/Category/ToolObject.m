//
//  ToolObject.m
//  meiya
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "ToolObject.h"
#import <MBProgressHUD.h>
MBProgressHUD *hud1;
@implementation ToolObject
+ (void)showAlertWith:(NSString *)title AndContent:(NSString *)content AndViewController:(id)vController AndCallBack:(alertClickBlock)alertClick
{
    UIAlertController  *alertVC = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *acionCon = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertClick();
    }];
    UIAlertAction *acionCancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //模态取消alertview
        [alertVC dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    [alertVC addAction:acionCon];
    [alertVC addAction:acionCancle];
    [vController presentViewController:alertVC animated:YES completion:^{
        
    }];
}


+ (void)showActionSheetWithTitle:(NSString *)title Item1:(NSString *)item1 AndItem2:(NSString *)item2  AndItem3:(NSString *)item3 AndViewController:(id)vController AndCallBack:(actionClickBlock)alertClick
{
    UIAlertController  *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *acionCon1 = [UIAlertAction actionWithTitle:item1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertClick(1);
    }];
    UIAlertAction *acionCon2 = [UIAlertAction actionWithTitle:item2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertClick(2);
    }];
    
    UIAlertAction *acionCancle = [UIAlertAction actionWithTitle:item3 style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //模态取消alertview
        [alertVC dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    [alertVC addAction:acionCon1];
    [alertVC addAction:acionCon2];
    [alertVC addAction:acionCancle];
    
    [vController presentViewController:alertVC animated:YES completion:^{
        
    }];
    
}
//正则表达式判断
+ (BOOL)RegularExpressionsWithStr:(NSString *)str
{
  NSString *regex = @"^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

+ (void)showHudFromView:(UIView *)view WithTitle:(NSString *)title
{
    hud1 = [[MBProgressHUD alloc] init];
    hud1.labelText = title;
    hud1.yOffset =-50;
    hud1.margin = 20;
    hud1.mode = MBProgressHUDModeIndeterminate;
    [view addSubview:hud1];
    [hud1 show:YES];
}
+ (void)hiddeHudFromView:(UIView *)view
{
    [hud1 removeFromSuperview];
}


@end
