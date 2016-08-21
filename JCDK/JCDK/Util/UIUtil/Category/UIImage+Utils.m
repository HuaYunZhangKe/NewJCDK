//
//  UIImage+Utils.m
//  jingchengyou
//
//  Created by Binea on 15/8/20.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

- (UIImage *)scaleImageToSize:(CGSize)size
{
    return [self scaleImageToSize:size opaque:NO scale:[UIScreen mainScreen].scale];
}
- (UIImage *)scaleImageToSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    if(scale<=0)
    {
        scale = [UIScreen mainScreen].scale;
    }
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+ (UIImage*) imageWithColor: (UIColor*) color forRect:(CGRect)rect
{
//    UIGraphicsBeginImageContextWithOptions(rect.size,YES, [UIScreen mainScreen].scale);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
    rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
