//
//  UUtils.m
//  IKE
//
//  Created by 张科 on 16/9/11.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "UUtils.h"
@implementation UUtils
+(UIButton *)quickButtonSuper:(UIView *)view Frame:(CGRect)frame Target:(id)target Sel:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
}


+ (CGRect )heightForString:(NSString *)string AndSize:(CGSize)size AndAttibute:(NSDictionary *)dic
{
    CGRect frame = [string boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return frame;
}
@end
