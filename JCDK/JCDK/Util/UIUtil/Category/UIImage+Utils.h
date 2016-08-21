//
//  UIImage+Utils.h
//  jingchengyou
//
//  Created by Binea on 15/8/20.
//  Copyright (c) 2015年 XHCX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)
// 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
- (UIImage *)scaleImageToSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale;
- (UIImage *)scaleImageToSize:(CGSize)size;
+ (UIImage*) imageWithColor: (UIColor*) color forRect:(CGRect)rect;
@end
