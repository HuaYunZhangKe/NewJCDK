//
//  JCDKTabBarVC.h
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDKBaseNaviVC.h"
@interface JCDKTabBarVC : UITabBarController
@property (nonatomic, retain)JCDKBaseNaviVC *firstNaviVC;
@property (nonatomic, retain)JCDKBaseNaviVC *secondNaviVC;
@property (nonatomic, retain)JCDKBaseNaviVC *thirdNaviVC;
@property (nonatomic, retain)JCDKBaseNaviVC *fourthNaviVC;
@property (nonatomic, retain)JCDKBaseNaviVC *fivthNaviVC;

@end
