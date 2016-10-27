//
//  ChangeSignVC.h
//  JCDK
//
//  Created by 张科 on 2016/10/18.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"
#import "ZKBlocks.h"
@interface ChangeSignVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet UITextView *textVIew;
@property (weak, nonatomic) IBOutlet UILabel *placeHoder;
@property (nonatomic, copy)YSBlockWithString block;
@end
