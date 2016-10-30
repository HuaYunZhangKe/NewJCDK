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

    
    
    
    
    // Do any additional setup after loading the view from its nib.
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


//     cell.backgroundColor = [UIColor blackColor];
        return cell;
    
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
