//
//  RegistVC.h
//  JCDK
//
//  Created by 张科 on 16/8/31.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "NavigationView.h"
#import "ZKTextField.h"
@interface RegistVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet ZKTextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *placeHoder;
@property (weak, nonatomic) IBOutlet UIButton *obtainBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, assign)NSInteger fromWhere;
@end
