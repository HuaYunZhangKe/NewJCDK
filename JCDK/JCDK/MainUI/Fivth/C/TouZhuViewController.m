//
//  TouZhuViewController.m
//  JCDK
//
//  Created by 李锐 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "TouZhuViewController.h"
#import "JinqitouzhuCollectionViewCell.h"
#import "NavigationView.h"
@interface TouZhuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *scrollLine;
@end

@implementation TouZhuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    WeakSelf(wc);
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"投注记录";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

    
    [self.bgView addSubview:self.scrollLine];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT - 105);
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[JinqitouzhuCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
   
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
       
        return cell;
    }
    else if (indexPath.row == 1)
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
     
        return cell;
        
    }
    else  
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
        
    }
           
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx = scrollView.contentOffset.x;
    CGFloat linex = (JCDK_Screen_WIDTH * 2 / 3.0) * (offx / (JCDK_Screen_WIDTH * 2));
    self.scrollLine.frame = CGRectMake(JCDK_Screen_WIDTH / 6.0 - 26 + linex, 38, 56, 2);
    if (offx < JCDK_Screen_WIDTH / 2.0)
    {
        [self.firstBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    }
    if (offx > JCDK_Screen_WIDTH / 2.0 &&(offx < 3 / 2.0 * JCDK_Screen_WIDTH))
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kYellowColor forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
    }
    if (offx > 3 / 2.0 * JCDK_Screen_WIDTH)
    {
        [self.firstBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.secondBtn setTitleColor:kWhiteColor1 forState:UIControlStateNormal];
        [self.thirdBtn setTitleColor:kYellowColor forState:UIControlStateNormal];

    }
    
}
- (IBAction)firstBtn:(UIButton *)sender
{
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (IBAction)sectionBtn:(UIButton *)sender
{
     [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (IBAction)thirdBtn:(UIButton *)sender
{
     [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (UIView *)scrollLine
{
    if (!_scrollLine)
    {
        _scrollLine = [[UIView alloc] initWithFrame:CGRectMake(JCDK_Screen_WIDTH / 6.0 - 26, 38, 56, 2)];
        _scrollLine.backgroundColor = kYellowColor;
    }
    return _scrollLine;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
