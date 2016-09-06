//
//  ScoreFliterView.m
//  JCDK
//
//  Created by 张科 on 16/9/3.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ScoreFliterView.h"
#import "ScoreSectionView.h"
#import "ScoreFiterTabCell1.h"

@interface ScoreFliterView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UIButton *currentBtn;
@property (nonatomic, retain)NSArray *letters;
@end
@implementation ScoreFliterView
- (void)awakeFromNib
{
    [self.topView addSubview:self.line];
    self.currentBtn = self.firstBtn;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.letters = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    self.scrollView.contentSize = CGSizeMake(self.letters.count * 20, 20);
    for (int i = 0; i< self.letters.count; i ++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20 * i, 0, 25, 20);
        [button setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [button setTitle:self.letters[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:9];
        [button addTarget:self action:@selector(letterBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
}
- (void)layoutSubviews
{
    
}
//- (void)show
//{
//    self.hidden = NO;
//    self.height = 0;
//    [UIView animateWithDuration:0.3 animations:^{
//        self.height = JCDK_Screen_HEIGHT - 250;
//    }];
//}
//- (void)dismiss
//{
//    [UIView animateWithDuration:0.3 animations:^{
//        self.height = 0;
//    }];
//}
- (IBAction)topBtnClick:(UIButton *)sender {
    [self.currentBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    [sender setTitleColor:kYellowColor forState:UIControlStateNormal];
    self.currentBtn = sender;
    if (sender.tag == 101)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.line.frame = CGRectMake(JCDK_Screen_WIDTH / 8.0 - 5.5, 30, 11, 2);

        } completion:^(BOOL finished) {
            
        }];

    }
    if (sender.tag == 102)
    {
        [UIView animateWithDuration:0.2 animations:^{
        self.line.frame = CGRectMake(JCDK_Screen_WIDTH  * 3 / 8.0 - 5.5 , 30, 11, 2);

        } completion:^(BOOL finished) {
            
        }];

    }
    if (sender.tag == 103)
    {
        [UIView animateWithDuration:0.2 animations:^{
        self.line.frame = CGRectMake(JCDK_Screen_WIDTH  * 5 / 8.0 - 5.5 , 30, 11, 2);
 
        } completion:^(BOOL finished) {
            
        }];

    }
    if (sender.tag == 104)
    {
        [UIView animateWithDuration:0.2 animations:^{
        self.line.frame = CGRectMake(JCDK_Screen_WIDTH  * 7 / 8.0 - 5.5 , 30, 11, 2);
        } completion:^(BOOL finished) {
            
        }];

    }
}

- (IBAction)bottomBtnCLick:(UIButton *)sender {
    if (sender.tag == 111)
    {
        self.chooseAllBtn.backgroundColor = kYellowColor;
        [self.chooseAllBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        self.fanxuanBtn.backgroundColor = [UIColor clearColor];
        [self.fanxuanBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
    }
    if (sender.tag == 112)
    {
        self.chooseAllBtn.backgroundColor = [UIColor clearColor];
        [self.chooseAllBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        self.fanxuanBtn.backgroundColor = kYellowColor;
        [self.fanxuanBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];

    }
    if (sender.tag == 113)
    {
        
    }

}
- (void)letterBtnCLick:(UIButton *)button
{
    NSString *head = button.titleLabel.text;
    NSInteger section = [self.letters indexOfObject:head];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.letters.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ScoreFiterTabCell1 cellHeightForArray:@[@"AAA",@"BBB",@"CCC",@"DDD",@"DDD",@"DDD",@"DDD",@"DDD",@"DDD"]];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ScoreSectionView * LView = [[[NSBundle mainBundle] loadNibNamed:@"ScoreSectionView" owner:self options:nil] objectAtIndex:0];
    LView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 33);
    LView.letterlabel.text = self.letters[section];
    return LView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreFiterTabCell1 *cell = [[ScoreFiterTabCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.showArr = @[@"AAA",@"BBB",@"CCC",@"DDD",@"DDD",@"DDD",@"DDD",@"DDD",@"DDD"];
    return cell;
}
- (UIView *)line
{
    if (!_line)
    {
        _line = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH / 8.0 - 5.5, 30, 11, 2)];
        _line.backgroundColor = kYellowColor;
    }
    return _line;
}

@end
