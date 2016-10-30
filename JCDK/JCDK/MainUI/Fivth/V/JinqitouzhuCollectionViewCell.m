//
//  JinqitouzhuCollectionViewCell.m
//  JCDK
//
//  Created by 李锐 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JinqitouzhuCollectionViewCell.h"
#import "JinqiTableViewCell.h"
#import "HeadView.h"
#import "TouZhuTabCell.h"
@interface JinqitouzhuCollectionViewCell ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)HeadView *headView;
@property(nonatomic,retain)NSMutableArray *arr;
@property (nonatomic ,assign)NSInteger index;
@end
@implementation JinqitouzhuCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self) {
        [self  creatView];
        self.index = 1;
        
    }
    return self;
}
- (void)setShowDic:(NSDictionary *)showDic
{
    _showDic = showDic;
}
- (void)setType:(NSInteger)type
{
    _type = type;
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 60, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0x171a1a);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    [_tableView registerClass:[JinqiTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorColor =kHexColor(0x171a1a);
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 60)];
    headView.backgroundColor = kHexColor(0x000000);
    [self addSubview: headView];
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"按时间",@"按场次"]];
    self.segment.frame = CGRectMake(77, 10, 200, 40);
    [headView addSubview:self.segment];
    self.segment.tintColor = kRedColor;
    
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName: [UIColor whiteColor]};
     [_segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                             NSForegroundColorAttributeName: [UIColor whiteColor]};
    [_segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    [_segment addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    _segment.layer.cornerRadius = 20;
    _segment.layer.masksToBounds = YES;
    _segment.layer.borderWidth = 1.0;
    _segment.layer.borderColor = kRedColor.CGColor;
   


}
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.index == 1)
    {
        NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"t"]];
        return secArr.count;
    }
    else
    {
        NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"c"]];
        return secArr.count;

    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        JinqiTableViewCell *cell = [[JinqiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jq"];
        if (self.index == 1)
        {
            NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"t"]];
            
            cell.dic = secArr[indexPath.section];
            
        }
        else
        {
            NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"c"]];
            
            cell.dic = secArr[indexPath.section];
            
        }

               return cell;

    }
    else
    {
        TouZhuTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TouZhuTabCell" owner:self options:nil] objectAtIndex:0];
        if (self.index == 1)
        {
            NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"t"]];
            
            cell.dic = secArr[indexPath.section];
        }
        else
        {
            NSArray *secArr = [NSArray arrayWithArray:self.showDic[@"c"]];
            
            cell.dic = secArr[indexPath.section];
            
        }

        return cell;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 35;

    }
    else
    {
        return 160;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
    self.headView.backgroundColor =kHexColor(0x2a2e32);
    _headView. name.text = @"中超222";
    _headView.vsLabel.text = @"北京国 VS 重庆力";
    [_headView.arrow addTarget:self action:@selector(arrowClick:) forControlEvents:UIControlEventTouchUpInside];
    _headView.arrow.tag = section;
    if ([_arr[section]isEqualToString:@"1"]) {
        _headView.arrow.selected =YES;
    }
    else{
        _headView.arrow.selected =NO;

    }
    
    return _headView;
}
-(void)arrowClick:(UIButton *)btn
{
    btn.selected = ! btn.selected;
    if (btn.selected) {
        
        [self.arr replaceObjectAtIndex:btn.tag withObject:@"1"];
         }
    else
    {
        [self.arr replaceObjectAtIndex:btn.tag withObject:@"0"];
    }
    [_tableView reloadData];

}

-(void)segAction:(UISegmentedControl *)seg
{
    if(seg.selectedSegmentIndex == 1)
    {
        self.index = 1;
        [_tableView reloadData];
    }
    else
        
    {
        self.index = 2;
        [_tableView reloadData];
    }
}
@end
