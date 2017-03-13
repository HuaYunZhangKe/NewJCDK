//
//  SettingVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/21.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SettingVC.h"
#import "NavigationView.h"
#import "LoginVC.h"
#import "AppDelegate.h"
#import "RegistVC.h"
#import "ShareView.h"
#import <UMSocialCore/UMSocialCore.h>
#import "AboutUsVC.h"
#import "OrderWebViewVC.h"


@interface SettingVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,retain)NSArray *dataArr;
@property (nonatomic, retain)ShareView *shareview;
@end

@implementation SettingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, JCDK_Screen_HEIGHT);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor blackColor];
    _tableView.backgroundColor = [UIColor blackColor];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"设置";
    navigationView.saveBtn.hidden = YES;
    WeakSelf(wc);
    [navigationView.saveBtn addTarget:self action:@selector(saveBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];

        
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

//    _tableView.backgroundColor = kAppColor;
    _dataArr = @[@[@"修改密码"],@[@"清空缓存"],@[@"分享给好友",@"用户协议",@"关于竞彩大咖"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count + 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == self.dataArr.count)
    {
        return 1;
    }
    else
    {
        return [self.dataArr[section] count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.backgroundColor = kHexColor(0x2a2e32);
    cell.textLabel.textColor = [ UIColor whiteColor];
    cell.detailTextLabel.textColor = [ UIColor whiteColor];
    cell.textLabel.font =[ UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section != self.dataArr.count)
    {
        cell.textLabel.text = self.dataArr[indexPath.section][indexPath.row];

    }
    else
    {
        cell.textLabel.text = @"";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, JCDK_Screen_WIDTH, 70)];
        label.text = @"退出登录";
        label.textColor = [UIColor whiteColor];
        label.textAlignment  = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell addSubview:label];

//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
        if(indexPath.section == 1)
    {
        if(indexPath.row == 1)
        {
            cell.detailTextLabel.text = @"1.94M";
        }
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == self.dataArr.count)
    {
        return 30;
    }
    else
    {
        return 12;

    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat viewHeight;
    if (section == self.dataArr.count)
    {
        viewHeight = 30;
    }
    else
    {
        viewHeight = 12;
        
    }

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,JCDK_Screen_WIDTH,viewHeight)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.dataArr.count)
    {
        return 60;
    }
    else
    {
        return 50;
 
    }
}
#pragma mark - tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeakSelf(wc);

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        RegistVC *vc = [[RegistVC alloc] initWithNibName:@"RegistVC" bundle:nil];
        vc.fromWhere = 2;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 0 && indexPath.section == 2)
    {
        self.shareview = [[ShareView alloc] initWithFrame:self.view.bounds];
        self.shareview.shareTypeBlock = ^(NSString *type)
        {
            if ([type integerValue] == 1)
            {
                [wc shareDataWithPlatform:UMSocialPlatformType_WechatTimeLine];
            }
            else if ([type integerValue] == 2)
            {
                [wc shareDataWithPlatform:UMSocialPlatformType_WechatSession];
                
            }
            else if ([type integerValue] == 3)
            {
                [wc shareDataWithPlatform:UMSocialPlatformType_QQ];
                
            }
            else
            {
                [wc shareDataWithPlatform:UMSocialPlatformType_Sina];
                
            }
        };
        [self.view addSubview:self.shareview];
    }
    if (indexPath.row == 1 && indexPath.section == 2)
    {
        //用户协议
        OrderWebViewVC *vc = [[OrderWebViewVC alloc] init];
        vc.urlStr = @"http://114.55.227.5/user.html";
        vc.naviTitle = @"用户协议";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.row == 2 && indexPath.section == 2)
    {
        //关于竞彩大咖
        AboutUsVC *vc = [[AboutUsVC alloc] initWithNibName:@"AboutUsVC" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];

        

    }

    if (indexPath.section == self.dataArr.count)
     {
         LoginVC *vc =  [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
         [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isLogin"];
         [self.navigationController pushViewController:vc animated:YES];
     }
    
    
}

- (void)shareDataWithPlatform:(UMSocialPlatformType)platformType
{
    UMSocialMessageObject *messageObject = [self creatMessageObject];
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        }
        else{
            if (error) {
                message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            }
            else{
                message = [NSString stringWithFormat:@"分享失败"];
            }
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
    
}

- (UMSocialMessageObject *)creatMessageObject
{
  
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    NSString *title = @"竞彩大咖";
    NSString *url = @"http://www.baidu.com";
    NSString *text = @"竞彩大咖";
    //    UIImage *image = [UIImage imageNamed:@"xiaowanzi.jpg"];
    //纯文本分享
    messageObject.text = text;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:text thumImage:@"icon_setting.png"];
    [shareObject setWebpageUrl:url];
    messageObject.shareObject = shareObject;
    return messageObject;
}



@end
