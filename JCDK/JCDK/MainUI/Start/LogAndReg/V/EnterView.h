//
//  EnterView.h
//  JCDK
//
//  Created by 张科 on 16/8/31.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKTextField.h"
@interface EnterView : UIView
@property (nonatomic, retain)ZKTextField *textField;
@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)UIView *backView;
@property (nonatomic, retain)UILabel *placeHoder;
@property (nonatomic, retain)NSString *imageStr;
@property (nonatomic, retain)NSString *placeStr;
- (void)creatSubView;

@end
