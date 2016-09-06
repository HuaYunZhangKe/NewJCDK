//
//  RegistVC1.h
//  JCDK
//
//  Created by 张科 on 16/9/2.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "EnterView.h"
@interface RegistVC1 : JCDKBaseVC
@property (weak, nonatomic) IBOutlet EnterView *obtainCode;
@property (weak, nonatomic) IBOutlet EnterView *password;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (nonatomic, retain)NSDictionary *postDic;//注册首页传过来的手机号码,以及验证码
@end
