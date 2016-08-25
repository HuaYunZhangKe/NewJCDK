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
@interface SHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *scrollLine;

@end
static NSString *shCollecionIdef = @"shcllect";
@implementation SHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
        }
        if (button == 3)
        {
            //右边第二个按钮点击
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
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[SHCollectionCell class] forCellWithReuseIdentifier:shCollecionIdef];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        cell.type = 1;
        return cell;
    }
    else if (indexPath.row == 1)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        cell.type = 2;
        return cell;

    }
    else if (indexPath.row == 2)
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        cell.type = 3;
        return cell;

    }
    else
    {
        SHCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shCollecionIdef forIndexPath:indexPath];
        cell.type = 4;
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
    
    if (sender.tag == 21)
    {
        //即时
        [self.firstBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    

    }
    if (sender.tag == 22)
    {
        //赛果
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    if (sender.tag == 23)
    {
        //赛程
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    if (sender.tag == 24)
    {
        //关注
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.fourthBtn setTitleColor:kYellowColor forState:UIControlStateNormal];

          [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
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
@end
