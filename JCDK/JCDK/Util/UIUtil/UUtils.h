//
//  UUtils.h
//  IKE
//
//  Created by 张科 on 16/9/11.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UUtils : NSObject
+(UIButton *)quickButtonSuper:(UIView *)view Frame:(CGRect)frame Target:(id)target Sel:(SEL)action;
+ (CGRect )heightForString:(NSString *)string AndSize:(CGSize)size AndAttibute:(NSDictionary *)dic;

@end
