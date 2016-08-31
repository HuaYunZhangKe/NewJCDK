//
//  ThirdCollectionCell2.m
//  JCDK
//
//  Created by 张科 on 16/8/29.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ThirdCollectionCell2.h"
#import "PaiHangTabCell.h"
@interface ThirdCollectionCell2()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, retain)UIButton *currentBtn;
@end
@implementation ThirdCollectionCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)settingIndex2Nib
{
    self.line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 33, JCDK_Screen_WIDTH / 5.0, 2)];
    self.line2.backgroundColor = kYellowColor;
    self.currentBtn = self.first2Btn;
    [self.backView2 addSubview:self.line2];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 45;
    }
    else
    {
        return 66;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        PaiHangTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PaiHangTabCell" owner:self options:nil] objectAtIndex:0];
        return cell;
    }
    else
    {
        PaiHangTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"paihang"];
        if (!cell)
        {
                  cell = [[[NSBundle mainBundle] loadNibNamed:@"PaiHangTabCell" owner:self options:nil] objectAtIndex:1];
        }
        return cell;
    }
}
- (IBAction)buttonClick:(UIButton *)sender
{
    [self.currentBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    [sender setTitleColor:kYellowColor forState:UIControlStateNormal];
    self.currentBtn = sender;
    if (sender.tag == 61)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.line2.frame = CGRectMake(0, 33, JCDK_Screen_WIDTH / 5.0, 2);
        }];
    }
    if (sender.tag == 62)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.line2.frame = CGRectMake(JCDK_Screen_WIDTH / 5.0, 33, JCDK_Screen_WIDTH  / 5.0, 2);
        }];
 
    }
    if (sender.tag == 63)
    {
        [UIView animateWithDuration:0.2 animations:^{
        self.line2.frame = CGRectMake(JCDK_Screen_WIDTH * 2 / 5.0, 33, JCDK_Screen_WIDTH / 5.0, 2);
        }];
        

  

    }
    if (sender.tag == 64)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.line2.frame = CGRectMake(JCDK_Screen_WIDTH * 3 / 5.0, 33, JCDK_Screen_WIDTH  / 5.0, 2);

        }];

   
    }
    if (sender.tag == 65)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.line2.frame = CGRectMake(JCDK_Screen_WIDTH * 4 / 5.0, 33, JCDK_Screen_WIDTH / 5.0, 2);
            
        }];
        
    }
}

@end
