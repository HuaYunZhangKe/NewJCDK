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
#import "TZmodel.h"
@interface TouZhuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic, retain)UIView *scrollLine;
@property (nonatomic, retain)NSMutableArray *jq_tArr;
@property (nonatomic, retain)NSMutableArray *jq_cArr;
@property (nonatomic, retain)NSMutableArray *n_tArr;
@property (nonatomic, retain)NSMutableArray *n_cArr;

@property (nonatomic, retain)NSMutableArray *h_tArr;
@property (nonatomic, retain)NSMutableArray *h_cArr;

@property (nonatomic ,assign)NSInteger index;


@end

@implementation TouZhuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.index = 1;
    self.jq_tArr = [NSMutableArray new];
    self.jq_cArr = [NSMutableArray new];
    self.n_tArr = [NSMutableArray new];
    self.n_cArr = [NSMutableArray new];
    self.h_tArr = [NSMutableArray new];
    self.h_cArr = [NSMutableArray new];

    [self historyInfoFromWEb:0 AndGroup:0];//近期按时间
    [self historyInfoFromWEb:0 AndGroup:1];//近期按场次
    [self historyInfoFromWEb:1 AndGroup:0];//未结
    [self historyInfoFromWEb:1 AndGroup:1];//未结

    [self historyInfoFromWEb:2 AndGroup:0];//历史
    [self historyInfoFromWEb:2 AndGroup:1];//历史




    self.jq_tArr = [NSMutableArray new];
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


- (void)historyInfoFromWEb:(NSInteger )type AndGroup:(NSInteger )group
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    NSDictionary *userDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString *userid = userDic[@"id"];

    
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token.length == 0)
    {
        token = @"";
    }
    NSDictionary *paraDic = @{
                              @"userid"   :userid,
                              @"Type"     :@(type),
                              @"Group"    :@(group)
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=betlist",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"%ld_%ld",(long)type,group] forKey:@"type"];
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
    if ([type isEqualToString:@"0_0"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.jq_tArr addObject:dic];

        }
    }
    if ([type isEqualToString:@"0_1"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.jq_cArr addObject:dic];
            
        }
    }
    if ([type isEqualToString:@"1_0"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.n_tArr addObject:dic];
            
        }
    }
    if ([type isEqualToString:@"1_1"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.n_cArr addObject:dic];
            
        }
    }
    if ([type isEqualToString:@"2_0"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.h_tArr addObject:dic];
        }
    }
    if ([type isEqualToString:@"2_1"])
    {
        NSArray *list = [NSArray arrayWithArray:result[@"list"]];
        for (NSDictionary *dic in list)
        {
            [self.h_cArr addObject:dic];
        }
    }

}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
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
        cell.type = 1;
        cell.showDic = @{@"t":self.jq_tArr,@"c":self.jq_cArr};
       
        return cell;
    }
    else if (indexPath.row == 1)
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type = 2;
        cell.showDic = @{@"t":self.n_tArr,@"c":self.n_cArr};

        return cell;
        
    }
    else  
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type = 2;
        cell.showDic = @{@"t":self.h_tArr,@"c":self.h_cArr};

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
    self.index = 1;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (IBAction)sectionBtn:(UIButton *)sender
{
    self.index = 2;

     [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
- (IBAction)thirdBtn:(UIButton *)sender
{
    self.index = 3;
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
