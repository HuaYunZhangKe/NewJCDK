//
//  FreeTableViewCell.m
//  JCDK
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "FreeTableViewCell.h"

@implementation FreeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {self.img = [[UIImageView alloc] init];
        [self.contentView addSubview:_img];
        
        self.titleLb = [ JCDKBaseLabel new];
        [self.contentView addSubview:_titleLb];
        self.point = [UIImageView new];
        [self.contentView addSubview:_point];
        self.countLb = [JCDKBaseLabel new];
        [self.contentView addSubview:_countLb];
        self.dayLb = [ JCDKBaseLabel new];
        [self.contentView  addSubview:_dayLb];
        self.detailLb = [JCDKBaseLabel  new];
        [self.contentView addSubview:_detailLb];
        
        self.img.backgroundColor = [UIColor redColor];
        self.img.layer.cornerRadius = 70 /4;
        self.point.image = [UIImage imageNamed:@"bfzx_small"];
        self.countLb.font = [UIFont systemFontOfSize:10];
        self.detailLb.font = [UIFont systemFontOfSize:13];
        self.dayLb.font= [UIFont systemFontOfSize:10];
}
    return self;

    }
-(void)layoutSubviews
{
    [super layoutSubviews];
self.img.frame = CGRectMake(16, 12.5, 70 /2, 70/2);
    self.titleLb.frame = CGRectMake(_img.right + 10, _img.top, 100, 13);
    self.point.frame = CGRectMake(_titleLb.left, _titleLb.bottom + 10, 9, 9);
    self.countLb .frame = CGRectMake(_point.right +12/2, _point.top, 100, 9);
    self.dayLb.frame =  CGRectMake(_titleLb.right +11, _titleLb.top, 20, 9);
    self.detailLb.frame =  CGRectMake(self.contentView.right - 60, self.contentView.center.y, 60, 11);
    
                 }
- (void)awakeFromNib {
    // Initialization code                     
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
