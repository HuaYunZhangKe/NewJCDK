//
//  MycollectionVC.m
//  JCDK
//
//  Created by 魏秀红 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "MycollectionVC.h"
#import "NavigationView.h"
#import "MycollectionCell.h"
#import "CollectionModel.h"
@interface MycollectionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mycollection;
@property (nonatomic, retain)NSMutableArray *mycollarr;
@end

@implementation MycollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navset];
    self.mycollarr = [NSMutableArray new];
    self.mycollection.delegate = self;
    self.mycollection.dataSource = self;
    self.mycollection.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self collectInfoFromWEb:1];
}
//设置导航栏
-(void)navset{
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"我的收藏";
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    MycollectionCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MycollectionCell" owner:self options:nil] objectAtIndex:0];
    
    cell.backgroundColor = [UIColor colorWithRed:32/255.0 green:40/255.0 blue:40/255.0  alpha:1];

    cell.collect = self.mycollarr[indexPath.row];
//     cell.backgroundColor = [UIColor blackColor];
        return cell;
    
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mycollarr.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectInfoFromWEb:(NSInteger )type
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
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=favorites",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"%ld",(long)type] forKey:@"type"];
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
        NSArray *tempArr = [NSArray arrayWithArray:result[@"posts"]];
        for (NSDictionary *dic in tempArr)
        {
            CollectionModel *account = [[CollectionModel alloc] initWithDictionary:dic];
            [self.mycollarr addObject:account];
        }
       [self.mycollection reloadData];
    
}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
}
@end
