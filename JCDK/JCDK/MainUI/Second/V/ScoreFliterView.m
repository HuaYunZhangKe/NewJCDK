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
#import "BiFenClassModel.h"
#import "ChineseString.h"
@interface ScoreFliterView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UIButton *currentBtn;
@property (nonatomic, assign)NSInteger classType;//1全部，2北单，3竞彩，4胜负彩
@property (nonatomic ,retain)NSMutableArray *serviceDataArr;
@property (nonatomic, retain)NSMutableArray *showArr;
@property (nonatomic, retain)NSMutableArray *letterArr;
@property (nonatomic, retain)NSString *scoreType;
@property (nonatomic, retain)NSMutableDictionary *postDic;
@property (nonatomic ,retain)NSString *type;

@end
@implementation ScoreFliterView


- (void)showViewWithScoreType:(NSString *)scoreType PostDic:(NSMutableDictionary *)dic
{
    NSString *baseUrl = [NSString stringWithFormat:@"%@?g=app&m=score&a=%@",K_Server_Main_URL,scoreType];
    [dic setObject:@(self.classType) forKey:@"type"];
    self.scoreType = scoreType;
    self.postDic = dic;
    [self classDataFromWebWithBaseUrl:baseUrl PostDic:dic Type:scoreType];
}
- (void)classDataFromWebWithBaseUrl:(NSString *)baseUrl PostDic:(NSMutableDictionary *)dic Type:(NSString *)type
{
    self.type = type;
    [BMHttpHander PostRequest:baseUrl WithParameters:[NSDictionary dictionaryWithDictionary:dic] WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:type forKey:@"type"];
        if ([status integerValue] == 1)
        {
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
        }
        else
        {
            [self showTotast:result[@"error"]];
        }
        
    } WithFail:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        [self performSelectorOnMainThread:@selector(showTotast:) withObject:@"网络请求失败" waitUntilDone:NO];
        
    }];
    
}

- (void)webRequestSuccess:(NSDictionary *)result
{
    NSString *type = result[@"type"];
    NSArray *list = [NSArray arrayWithArray:result[@"list"]];
    NSMutableArray *titleArr = [NSMutableArray new];
    [self.serviceDataArr removeAllObjects];
    [self.showArr removeAllObjects];
    for (NSDictionary *dic in list)
    {
        BiFenClassModel *class = [[BiFenClassModel alloc] initWithDictionary:dic];
        class.isSelected = YES;
        [titleArr addObject:class.c_name];
        [self.serviceDataArr addObject:class];
    }
    self.letterArr = [ChineseString IndexArray:[NSArray arrayWithArray:titleArr]];
    for (NSString * Letter in self.letterArr)
    {
        NSMutableArray *tempArr = [NSMutableArray new];
        for (BiFenClassModel *b in self.serviceDataArr)
        {
            if ([Letter isEqualToString:[ChineseString obtainFirstLetter:b.c_name]])
            {
                b.isSelected = YES;

                [tempArr addObject:b];
            }
        }
        [self.showArr addObject:tempArr];
        
    }
    if (self.classType == 1)
    {
        _sliderViewHeight.constant = 25;

        self.scrollView.contentSize = CGSizeMake(self.letterArr.count * 20, 20);
        for (int i = 0; i< self.letterArr.count; i ++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20 * i, 0, 25, 20);
            [button setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
            [button setTitle:self.letterArr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:9];
            [button addTarget:self action:@selector(letterBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:button];
        }
    }
    else
    {
        _sliderViewHeight.constant = 0;
    }
    [self.tableView reloadData];


}
- (void)showHud:(NSString *)title
{
    [MBUtil showHudView:self WithTitle:title];
}
- (void)hiddeHud
{
    [MBUtil hideHud:self];
}
- (void)showTotast:(NSString *)title
{
    [MBUtil showTotastView:self WithTitle:title];
    
}
- (void)awakeFromNib
{
    self.classType = 3;
    self.serviceDataArr = [NSMutableArray new];
    self.showArr = [NSMutableArray new];
    [self.topView addSubview:self.line];
    self.currentBtn = self.thirdBtn;
    self.tableView.backgroundColor = kHexColor(0x202828);
    self.backgroundColor = kHexColor(0x202828);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
       
    
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
    
    self.classType = sender.tag - 100;
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
    [self showViewWithScoreType:self.scoreType PostDic:self.postDic];
}

- (IBAction)bottomBtnCLick:(UIButton *)sender {
    if (sender.tag == 111)
    {
        self.chooseAllBtn.backgroundColor = kYellowColor;
        [self.chooseAllBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        self.fanxuanBtn.backgroundColor = [UIColor clearColor];
        [self.fanxuanBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        if (self.classType == 1)
        {
            for (int i = 0; i < self.showArr.count; i ++)
            {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:self.showArr[i]];
                for (int j = 0; j < arr.count ; j ++)
                {
                    BiFenClassModel *b = arr[j];
                    b.isSelected = YES;
                    [arr replaceObjectAtIndex:j withObject:b];
                }
                [self.showArr replaceObjectAtIndex:i withObject:arr];
            }
        }
        else
        {
//            for (BiFenClassModel *b in self.serviceDataArr) {
//                
//            }
            for (int i = 0; i < self.serviceDataArr.count; i ++) {
                BiFenClassModel *b = self.serviceDataArr[i];
                b.isSelected = YES;
                [self.serviceDataArr replaceObjectAtIndex:i withObject:b];
            }
        }
        [self.tableView reloadData];
            
        if (_bottomBlock) {
            _bottomBlock(1);
        }
    }
    if (sender.tag == 112)
    {
        self.chooseAllBtn.backgroundColor = [UIColor clearColor];
        [self.chooseAllBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        self.fanxuanBtn.backgroundColor = kYellowColor;
        [self.fanxuanBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        _bottomBlock(2);
        if (self.classType == 1)
        {
            for (int i = 0; i < self.showArr.count; i ++)
            {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:self.showArr[i]];
                for (int j = 0; j < arr.count ; j ++)
                {
                    BiFenClassModel *b = arr[j];
                    b.isSelected = NO;
                    [arr replaceObjectAtIndex:j withObject:b];
                }
                [self.showArr replaceObjectAtIndex:i withObject:arr];
            }
        }
        else
        {
            //            for (BiFenClassModel *b in self.serviceDataArr) {
            //
            //            }
            for (int i = 0; i < self.serviceDataArr.count; i ++) {
                BiFenClassModel *b = self.serviceDataArr[i];
                b.isSelected = NO;
                [self.serviceDataArr replaceObjectAtIndex:i withObject:b];
            }
        }
        [self.tableView reloadData];



    }
    if (sender.tag == 113)
    {
        _bottomBlock(3);
        [self removeFromSuperview];

    }

}
- (void)letterBtnCLick:(UIButton *)button
{
    NSString *head = button.titleLabel.text;
    NSInteger section = [self.letterArr indexOfObject:head];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.classType == 1)
    {
        return self.showArr.count;
    }
    else
    {
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.classType == 1)
    {
        return 33;
    }
    else
    {
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.classType == 1)
    {
        NSArray *arr = [NSArray arrayWithArray:self.showArr[indexPath.section]];
        return [ScoreFiterTabCell1 cellHeightForArray:arr];
    }
    else
    {
        return [ScoreFiterTabCell1 cellHeightForArray:self.serviceDataArr];
    }

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ScoreSectionView * LView = [[[NSBundle mainBundle] loadNibNamed:@"ScoreSectionView" owner:self options:nil] objectAtIndex:0];

    LView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 33);
    LView.letterlabel.text = self.letterArr[section];
    return LView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreFiterTabCell1 *cell = [[ScoreFiterTabCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self.classType == 1)
    {
        NSArray *arr = self.showArr[indexPath.section];
        cell.showArr = arr;

    }
    else
    {
        cell.showArr = self.serviceDataArr;
 
    }
    return cell;
}
- (UIView *)line
{
    if (!_line)
    {
        _line = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH * 5 / 8.0 - 5.5, 30, 11, 2)];
        _line.backgroundColor = kYellowColor;
    }
    return _line;
}

@end
