//
//  THomeVC.m
//  JCDK
//
//  Created by 张科 on 16/8/19.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "THomeVC.h"
#import "NavigationView.h"
#import "LRProgress.h"
#import "ThirdCollectionCell.h"
#import "ThirdCollectionCell1.h"
#import "ThirdCollectionCell2.h"
#import "ThirdCWebCell.h"
@interface THomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *scrollLine;

@end

@implementation THomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    [self setnavigationBar];
    [self settingCollectionView];
    //[self settingbgView];
    [self.switchView addSubview:self.scrollLine];
}
- (void)setnavigationBar
{
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:1];
    [navigationView setNib1];
    navigationView.titleLabel1.text = @"猜球";
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)settingbgView
{
    [self.bgView settingGBViewWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
}
- (IBAction)switchBtnClick:(UIButton *)sender {
    if (sender.tag == 41)
    {
        //赛前
    }
    if (sender.tag == 42)
    {
        //串关
    }
    if (sender.tag == 43)
    {
        //排行榜
    }
}
- (void)settingCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 81 - 64 - 49);
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor =kHexColor(0x171a1a);
    self.collectionView.pagingEnabled = YES;
 
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    if (indexPath.row == 0)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"ThirdCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Third0"];
        ThirdCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Third0" forIndexPath:indexPath];
          [cell settingIndex0Nib];

        return cell;
    }
    else if (indexPath.row == 1)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"ThirdCollectionCell1" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Third1"];
        ThirdCollectionCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Third1" forIndexPath:indexPath];
        [cell settingIndex1Nib];
        return cell;
    }
    else
    {
        [collectionView registerNib:[UINib nibWithNibName:@"ThirdCollectionCell2" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Third2"];

        ThirdCollectionCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Third2" forIndexPath:indexPath];
//        [cell settingIndex2Nib];
        return cell;
    }
     */
    [collectionView registerNib:[UINib nibWithNibName:@"ThirdCWebCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Third0"];
    ThirdCWebCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Third0" forIndexPath:indexPath];
    if (indexPath.row == 0)
    {
        cell.urlStr = @"http://114.55.227.5/index.php?g=app&m=match&a=match";
    }
    else if (indexPath.row == 1)
    {
        cell.urlStr = @"http://114.55.227.5/index.php?g=app&m=match&a=index";

    }
    else
    {
        cell.urlStr = @"http://114.55.227.5/index.php?g=app&m=match&a=listorder";
 
    }
    return cell;

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx = scrollView.contentOffset.x;
    CGFloat increment = (JCDK_Screen_WIDTH * 2 / 3.0)   * (offx / (2 * JCDK_Screen_WIDTH));
    self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH / 6.0 - 5.5 + increment, 30, 11, 2);
    if (offx < JCDK_Screen_WIDTH / 2.0)
    {
        [self.firstBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];

    }
    if ((offx > JCDK_Screen_WIDTH / 2.0) && (offx < JCDK_Screen_WIDTH * 3 / 2.0))
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    }
    if (offx > JCDK_Screen_WIDTH * 3 / 2.0)
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kYellowColor forState:UIControlStateNormal];

    }


}
- (IBAction)firstBtnAction:(id)sender {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

}
- (IBAction)secondBtnAction:(id)sender {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

}

- (IBAction)thirdBtnAction:(id)sender {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (UIView *)scrollLine
{
    if (!_scrollLine)
    {
        _scrollLine = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH / 6.0 - 5.5, 30, 11, 2)];
        _scrollLine.backgroundColor = kYellowColor;
    }
    return _scrollLine;
}



@end
