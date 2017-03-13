//
//  SHomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SHomeVC.h"
#import "NavigationView.h"
#import "SHCollectionCell.h"
#import "ScoreFliterView.h"
#import "CanderView.h"
#import "ClassUtils.h"
#import "BiFenTabCell.h"
#import "OrderWebViewVC.h"
#import "OperSettingVC.h"
@interface SHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *scrollLine;
@property (nonatomic, retain)ScoreFliterView *fliter1;
@property (nonatomic, retain)ScoreFliterView *fliter2;
@property (nonatomic, retain)ScoreFliterView *fliter3;

@property (nonatomic, retain)CanderView *cView;
@property (nonatomic, retain)NSArray *dateArr;
@property (nonatomic, assign)NSInteger dateIndex;
@property (nonatomic, assign)NSInteger currentSelectedIndex;//1为即时  2为赛程  3为赛果  4为关注


@end
static NSString *shCollecionIdef = @"shcllect";
@implementation SHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dateIndex = 0;
    self.currentSelectedIndex = 1;
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setNavigationBar];
    [self.switchView addSubview:self.scrollLine];
    [self settingCollectionView];

}


- (void)setNavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:1];
    [navigationView setNib1];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    navigationView.buttonBlock1 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
        }
        if (button == 2)
        {
            //右边第一个按钮点击
            OperSettingVC *vc = [[OperSettingVC alloc] initWithNibName:@"OperSettingVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (button == 3)
        {
            //右边第二个按钮点击
            if (self.currentSelectedIndex == 1)
            {
                if ([self.view.subviews containsObject:_fliter1])
                {
                    [_fliter1 removeFromSuperview];
                }
                else
                {
                    if (!_fliter1)
                    {
                        _fliter1 = [[[NSBundle mainBundle] loadNibNamed:@"ScoreFliterView" owner:self options:nil] objectAtIndex:0];
                        _fliter1.frame = CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 250);
                        [self.view addSubview:_fliter1];
                        [_fliter1 showViewWithScoreType:@"instant_cate" PostDic:[NSMutableDictionary dictionaryWithDictionary:@{}]];
                        _fliter1.bottomBlock = ^ (NSInteger index)
                        {
                            if (index == 1)
                            {
                                
                            }
                            if (index == 2)
                            {
                                
                            }
                            if (index == 3)
                            {
                                
                            }
                        };
                    }
                    else
                    {
                        [self.view addSubview:_fliter1];
                    }

                }
                
 
            }
            else if(self.currentSelectedIndex == 2)
            {
                
                if ([self.view.subviews containsObject:_fliter2])
                {
                    [_fliter2 removeFromSuperview];
                }
                else
                {
                    if (!_fliter2)
                    {
                        _fliter2 = [[[NSBundle mainBundle] loadNibNamed:@"ScoreFliterView" owner:self options:nil] objectAtIndex:0];
                        _fliter2.frame = CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 250);
                        [self.view addSubview:_fliter2];
                        
                        [_fliter2 showViewWithScoreType:@"over_cate" PostDic:[NSMutableDictionary dictionaryWithDictionary:@{@"date" : @"2017-02-06"}]];
                    }
                    else
                    {
                        [self.view addSubview:_fliter2];
                    }
 
                }

 
            }
            else if (self.currentSelectedIndex == 3)
            {
                
                if ([self.view.subviews containsObject:_fliter3])
                {
                    [_fliter3 removeFromSuperview];
                }
                else
                {
                    if (!_fliter3)
                    {
                        _fliter3 = [[[NSBundle mainBundle] loadNibNamed:@"ScoreFliterView" owner:self options:nil] objectAtIndex:0];
                        _fliter3.frame = CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 250);
                        
                        [_fliter3 showViewWithScoreType:@"next_cate" PostDic:[NSMutableDictionary dictionaryWithDictionary:@{@"date" : @"2017-02-06"}]];

                        [self.view addSubview:_fliter3];
                    }
                    else
                    {
                        [self.view addSubview:_fliter3];
                    }
                }
            }
            else
            {
                
            }
         }
        
    };
    [self.view addSubview:navigationView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)settingCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 105);
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor =kHexColor(0x171a1a);

    [self.collectionView registerClass:[SHCollectionCell class] forCellWithReuseIdentifier:shCollecionIdef];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeakSelf(wc);

    if (self.currentSelectedIndex == 1)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        [cell showViewWithPostDic:[NSMutableDictionary dictionaryWithDictionary:@{@"ast_id":@(0),@"cid":@"",@"type":@"3",@"uid":@"1"}] Type:@"instant" AndCallBack:^(NSInteger integer) {
            
        }];
        cell.gameBlock = ^(BiFenListModel *b)
        {
            OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
            vc.naviTitle = b.league;
            NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
            NSString *userid = userDic[@"id"];
            
            NSString *urlStr = [NSString stringWithFormat:@"%@?g=app&m=match&a=match_content&id=%@&userid=%@",K_Server_Main_URL,b.bid,userid];
            vc.urlStr = urlStr;
            [self.navigationController pushViewController:vc animated:YES];
        };
        NSLog(@"index:%ld",(long)indexPath.section);

       // cell.type = 1;
        return cell;
    }
    else if (self.currentSelectedIndex == 2)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
       // cell.type = 2;
        
       __block BiFenTabCell *cell1;
        [cell showViewWithPostDic:[NSMutableDictionary dictionaryWithDictionary:@{@"ast_id":@(0),@"cid":@"",@"date":@"2017-02-19",@"type":@"3",@"uid":@"1"}] Type:@"over" AndCallBack:^(NSInteger integer) {
             cell1 = [cell.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            cell1.dateLabel.text = self.dateArr[0];
            NSLog(@"%@",self.dateArr[0]);
        }];


        cell.saiguoBlock = ^(NSInteger index)
        {
            //1,上一步日期,2，下一步日期 3，日历弹窗
            if (index == 1)
            {
                
                if (self.dateIndex > 0) {
                    self.dateIndex --;
                    cell1.dateLabel.text = self.dateArr[self.dateIndex] ;

                }
            }
            if (index == 2)
            {
                if (self.dateIndex < 6)
                {
                    self.dateIndex ++;
                    cell1.dateLabel.text = self.dateArr[self.dateIndex] ;

                }
            }
            if (index == 3)
            {
                if (!self.cView)
                {
                    self.cView = [[CanderView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 64)];
                    self.cView.dateArr = self.dateArr;
                    [self.cView show];
                    self.cView.index = self.dateIndex;
                    self.cView.dateButtonBlock = ^(NSInteger index1)
                    {
                        _dateIndex = index1;
                        cell1.dateLabel.text = wc.dateArr[wc.dateIndex] ;

                    };
                    [kAppdelegate.window addSubview:self.cView];

                }
                else
                {
                    [self.cView show];
                    self.cView.index = self.dateIndex;
                    [kAppdelegate.window addSubview:self.cView];
                }
            }
        };
        NSLog(@"index:%ld",(long)indexPath.item);

        return cell;

    }
    else if (self.currentSelectedIndex == 3)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
       // cell.type = 3;
        __block BiFenTabCell *cell1;

       [cell showViewWithPostDic:[NSMutableDictionary dictionaryWithDictionary:@{@"ast_id":@(0),@"cid":@"",@"date":@"2017-02-19",@"type":@"3",@"uid":@"1"}] Type:@"next" AndCallBack:^(NSInteger integer) {
           cell1 = [cell.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
           cell1.dateLabel.text = self.dateArr[0];
           NSLog(@"%@",self.dateArr[0]);

           
       }];
        cell.saiguoBlock = ^(NSInteger index)
        {
            //1,上一步日期,2，下一步日期 3，日历弹窗
            if (index == 1)
            {
                
                if (self.dateIndex > 0) {
                    self.dateIndex --;
                    cell1.dateLabel.text = self.dateArr[self.dateIndex] ;
                    
                }
            }
            if (index == 2)
            {
                if (self.dateIndex < 6)
                {
                    self.dateIndex ++;
                    cell1.dateLabel.text = self.dateArr[self.dateIndex] ;
                    
                }
            }
            if (index == 3)
            {
                if (!self.cView)
                {
                    self.cView = [[CanderView alloc] initWithFrame:CGRectMake(0, 64, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 64)];
                    self.cView.dateArr = self.dateArr;
                    [self.cView show];
                    self.cView.index = self.dateIndex;
                    self.cView.dateButtonBlock = ^(NSInteger index1)
                    {
                        _dateIndex = index1;
                        cell1.dateLabel.text = wc.dateArr[wc.dateIndex] ;
                        
                    };
                    [kAppdelegate.window addSubview:self.cView];
                    
                }
                else
                {
                    [self.cView show];
                    self.cView.index = self.dateIndex;
                    [kAppdelegate.window addSubview:self.cView];
                }
            }
        };

        NSLog(@"index:%ld",(long)indexPath.item);

        return cell;

    }
    else
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        [cell showViewWithPostDic:nil Type:@"running" AndCallBack:^(NSInteger integer) {
            
        }];
        NSLog(@"index:%ld",(long)indexPath.item);
        //cell.type = 4;
        return cell;
    }
}

 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx = scrollView.contentOffset.x;
    CGFloat increment = (JCDK_Screen_WIDTH * 3 / 4.0)   * (offx / (3 * JCDK_Screen_WIDTH));
    self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH / 8.0 - 5.5 + increment, 30, 11, 2);
    if (offx < JCDK_Screen_WIDTH / 2.0)
    {
        [self.firstBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        
    }
    if ((offx > JCDK_Screen_WIDTH / 2.0) &&(offx <JCDK_Screen_WIDTH * 3 / 2.0))
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        
    }
    if ((offx > JCDK_Screen_WIDTH * 3 / 2.0) &&(offx <JCDK_Screen_WIDTH * 5 / 2.0))
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    }
    if (offx > JCDK_Screen_WIDTH * 5 / 2.0)
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
    }


    
    
}
- (IBAction)switchBtnCLick:(UIButton *)sender
{
    self.currentSelectedIndex = sender.tag - 20;
    [self.collectionView reloadData];
    if (sender.tag == 21)
    {
        //即时
        [self.firstBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH / 8.0 - 5.5 , 30, 11, 2);

    

    }
    if (sender.tag == 22)
    {
        //赛果
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH * 3 / 8.0 - 5.5 , 30, 11, 2);

//          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    if (sender.tag == 23)
    {
        //赛程
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH * 5 / 8.0 - 5.5 , 30, 11, 2);

//          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    if (sender.tag == 24)
    {
        //关注
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH * 7 / 8.0 - 5.5 , 30, 11, 2);

//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
}

- (UIView *)scrollLine
{
    if (!_scrollLine)
    {
        _scrollLine = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH / 8.0 - 5.5, 30, 11, 2)];
        _scrollLine.backgroundColor = kYellowColor;
    }
    return _scrollLine;
}
- (NSArray *)dateArr
{
    if (!_dateArr)
    {
        NSMutableArray *tempArr = [NSMutableArray new];
        NSTimeInterval cellTime = 60 * 60 * 24;
        for (int i = 0; i < 7; i ++)
        {
            NSDate *date = [NSDate dateWithTimeIntervalSinceNow:cellTime * i];

            NSString *dateStr = [ClassUtils dataStringWithDate:date];
            [tempArr addObject:dateStr];
        }
        _dateArr = [NSArray arrayWithArray:tempArr];
    }
    return _dateArr;
}
@end
