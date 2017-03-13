//
//  SHCollectionCell.m
//  JCDK
//
//  Created by 张科 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SHCollectionCell.h"
#import "BiFenTabCell.h"
#import "BiFenListModel.h"
@interface SHCollectionCell()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,retain)NSMutableArray *showArr;
@property (nonatomic ,retain)UILabel *tempLabel;
@property (nonatomic, retain)YSBlockWithInteger callback;
@end

@implementation SHCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.showArr = [NSMutableArray new];
        [self.contentView addSubview:self.tableView];

    }
    return self;
}
- (UILabel *)tempLabel
{
    if (!_tempLabel)
    {
            _tempLabel = [[UILabel alloc] initWithFrame:self.tableView.bounds];

        _tempLabel.text  =@"暂无数据";
        _tempLabel.font = [UIFont systemFontOfSize:20];
        _tempLabel.textColor = [UIColor blackColor];
        _tempLabel.textAlignment = NSTextAlignmentCenter;
        _tempLabel.backgroundColor = [UIColor whiteColor];
    }
    return _tempLabel;
}

- (void)showViewWithPostDic:(NSMutableDictionary *)dic Type:(NSString *)type AndCallBack:(YSBlockWithInteger)callBack{
    self.callback = callBack;
    if (dic == nil)
    {
        [self.tableView reloadData];
        [self.tableView addSubview:self.tempLabel];
        return;
    }
    self.postDic = dic;
    self.type = type;
    NSString *baseUrl = [NSString stringWithFormat:@"%@?g=app&m=score&a=%@",K_Server_Main_URL,type];
    [self biFenDataFromWebWithBaseUrl:baseUrl PostDic:dic Type:type];
    
}
- (void)biFenDataFromWebWithBaseUrl:(NSString *)baseUrl PostDic:(NSMutableDictionary *)dic Type:(NSString *)type
{
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
  
    NSArray *arr = [NSArray arrayWithArray:result[@"list"]];
    [self.showArr removeAllObjects];
    for (NSDictionary *dic in arr)
    {
        BiFenListModel *b = [[BiFenListModel alloc] initWithDictionary:dic];
        [self.showArr addObject:b];
    }
    if ([self.type isEqualToString:@"over"])
    {
        _tempLabel.frame = CGRectMake(0, 35, self.tableView.width, self.tableView.height - 35);
        
    }
    if (self.showArr.count == 0)
    {
        if (![self.tableView.subviews containsObject:self.tempLabel])
        {
            [self.tableView addSubview:self.tempLabel];
        }
        else
        {
            [self.tempLabel removeFromSuperview];
        }
    }
    else
    {
        [self.tempLabel removeFromSuperview];

    }
    [self.tableView reloadData];
    if (_callback) {
        _callback(1);
    }
    
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if ([self.type isEqualToString:@"instant"])
//    {
//        return  7;
//    }
//    else if([self.type isEqualToString:@"over"])
//    {
//        return  8;
//
//    }
//    else if ([self.type isEqualToString:@"next"])
//    {
//        return  8;
//
//    }
//    else
//    {
//        return  3;
//
//    }
    
    
    
    if ([self.type isEqualToString:@"instant"])
    {
        if (self.showArr.count == 0)
        {
            return 0;
        }
        else
        {
            return self.showArr.count;
        }

    }
    else if([self.type isEqualToString:@"over"])
    {
        if (self.showArr.count == 0)
        {
            return 1;
        }
        else
        {
            return self.showArr.count + 1;
        }

    }
    else if ([self.type isEqualToString:@"next"])
    {
        if (self.showArr.count == 0)
        {
            return 1;
        }
        else
        {
            return self.showArr.count + 1;
        }

    }
    else
    {
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.type isEqualToString:@"instant"])
    {
        return 64;
    }
    else if([self.type isEqualToString:@"over"])
    {
        if (indexPath.row == 0)
        {
            return 35;
        }
        else
        {
            return 65;
        }
    }
    else if ([self.type isEqualToString:@"next"])
    {
        if (indexPath.row == 0)
        {
            return 35;
        }
        else
        {
            return 65;
        }

    }
    else
    {
        return 99;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.type isEqualToString:@"instant"])
    {
        BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.type = @"instant";
        cell.b = self.showArr[indexPath.row];

        return cell;
    }
    else if([self.type isEqualToString:@"over"])
    {
        if (indexPath.row == 0)
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:1];

            cell.button1Block = ^(NSInteger index)
            {
                if (index == 1)
                {
                    self.saiguoBlock(1);
                }
                if (index == 2)
                {
                    self.saiguoBlock(2);
                }
                if (index == 3)
                {
                    self.saiguoBlock(3);
                }

            };
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;

        }
        else
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.type = @"over";
            cell.b = self.showArr[indexPath.row];


            return cell;

        }
     }
    else if ([self.type isEqualToString:@"next"])
    {
        if (indexPath.row == 0)
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            
        }
        else
        {
            BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.type = @"next";
            cell.b = self.showArr[indexPath.row];

            return cell;
            
        }

    }
    else
    {
        BiFenTabCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BiFenTabCell" owner:self options:nil] objectAtIndex:2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_gameBlock) {
        BiFenListModel *b = self.showArr[indexPath.row];
        _gameBlock(b);
    }
}
- (JCDKBaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[JCDKBaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor =kHexColor(0x171a1a);

    }
    return _tableView;
}
@end
