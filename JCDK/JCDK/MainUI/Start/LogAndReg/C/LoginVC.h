//
//  LoginVC.h
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "EnterView.h"
@interface LoginVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet EnterView *userName;
@property (weak, nonatomic) IBOutlet EnterView *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end
