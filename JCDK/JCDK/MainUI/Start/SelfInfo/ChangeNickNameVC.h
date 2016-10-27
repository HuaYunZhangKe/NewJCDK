//
//  ChangeNickNameVC.h
//  
//
//  Created by 张科 on 2016/10/21.
//
//

#import "JCDKBaseVC.h"
#import "ZKBlocks.h"

@interface ChangeNickNameVC : JCDKBaseVC
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic, copy)YSBlockWithString block;
@end
