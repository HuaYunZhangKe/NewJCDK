//
//  ZhuaJiaTabCellTableViewCell.m
//  JCDK
//
//  Created by 张科 on 2016/10/16.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ZhuaJiaTabCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "LHAFNetworkTool.h"
@implementation ZhuaJiaTabCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setEx:(Expert *)ex
{
    _ex = ex;
    [_pic sd_setImageWithURL:[NSURL URLWithString:ex.avatar] placeholderImage:kPlaceHoderImage];
    [_collect setBackgroundImage:[UIImage imageNamed:@"my12.png"] forState:UIControlStateNormal];
    [_collect setBackgroundImage:[UIImage imageNamed:@"star_yellow.png"] forState:UIControlStateSelected];

    _name.text = ex.user_nicename;
    if ([ex.level integerValue] == 0) {
         _type.text = @"初级专家";
    }
    else if ([ex.level integerValue] == 2)
    {
        _type.text = @"中级专家";
    }
    else
    {
        _type.text = @"高级专家";

    }
    
}

- (IBAction)loveBtnCLick:(UIButton *)sender {
    sender.selected = !sender.selected;
    [LHAFNetworkTool GET:[NSString stringWithFormat:@"%@?g=app&m=index&a=follow&userid=1&follow_id=%@&type=1",K_Server_Main_URL,self.ex.eid] params:nil success:^(NSURLSessionDataTask *task, id responseObject, NSInteger codetype, NSInteger codeMessage)
     {
       
     } fail:^(NSURLSessionDataTask *task, NSError *error) {
         
     }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
