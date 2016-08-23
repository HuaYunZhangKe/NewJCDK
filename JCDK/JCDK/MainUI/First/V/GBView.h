//
//  GBView.h
//  JCDK
//
//  Created by 张科 on 16/8/23.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBView : UIView<UIScrollViewDelegate>
@property (nonatomic, retain)NSArray *gbArr;
@property (nonatomic, retain)UIScrollView *scrollView;
- (void)settingGBViewWithArray:(NSArray *)array;
@end
