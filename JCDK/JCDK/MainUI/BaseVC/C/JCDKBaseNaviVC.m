//
//  JCDKBaseNaviVC.m
//  JCDK
//
//  Created by 张科 on 16/8/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseNaviVC.h"

@interface JCDKBaseNaviVC ()<UIGestureRecognizerDelegate>

@end

@implementation JCDKBaseNaviVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count == 1) {
        return NO;
    }
    if (self.topViewController.navigationItem.hidesBackButton) {
        return NO;
    }
    return YES;
}


@end
