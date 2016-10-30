//
//  SelfInfoVC.m
//  JCDK
//
//  Created by 张科 on 2016/10/18.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "SelfInfoVC.h"
#import "InfoCell1.h"
#import "ToolObject.h"
#import <AVFoundation/AVFoundation.h>
#import "NavigationView.h"
#import "ChangeSignVC.h"
#import "ChangeNickNameVC.h"
#import <UIImageView+WebCache.h>
@interface SelfInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,retain)NSMutableDictionary *infoDic;
@end

@implementation SelfInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.infoDic = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"]];
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"个人信息";
    navigationView.saveBtn.hidden = NO;
    WeakSelf(wc);
        navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    [navigationView.saveBtn addTarget:self action:@selector(saveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

}
- (void)saveBtnClick:(UIButton *)button
{
    InfoCell1 *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    InfoCell1 *cell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    InfoCell1 *cell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    if (cell1.phone.text.length == 0)
    {
        [self showTotast:@"请输入昵称"];;
    }
    if (cell2.phone.text.length == 0)
    {
        [self showTotast:@"请输入签名"];
    }
    [self postMyInfoToWEb:1];
 
}

- (void)postMyInfoToWEb:(NSInteger )type
{
    //    * @example  http://api.myike.com.cn/?m=api&v=locallife.mod&id=10&token=BgETMCIwH19fXVELWlwHVQNEWQ4PUVVVEVoMDAhTBBBcWlsIVgNGV1wMBBNyPzAdAl9dE0NbWFgBAgFCW14&debug=1 查看
    
    
    
    InfoCell1 *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
     InfoCell1 *cell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    InfoCell1 *cell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
   
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token.length == 0)
    {
        token = @"";
    }
//    NSDictionary *info = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSDictionary *paraDic = @{
                              @"id"   :self.infoDic[@"id"],
                              @"user_nicename"     :self.infoDic[@"user_nicename"],
                              @"sex" :@([self.infoDic[@"sex"] integerValue]),
                              @"signature":self.infoDic[@"introduction"]
                              };
    
    
    [BMHttpHander PostRequest:[NSString stringWithFormat:@"%@?g=app&m=user&a=edit_user",K_Server_Main_URL] WithParameters:paraDic WithSuccess:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *status = result[@"status"];
        [result setObject:[NSString stringWithFormat:@"%ld",(long)type] forKey:@"type"];
        if ([status integerValue] == 1)
        {
            [self performSelectorOnMainThread:@selector(webRequestSuccess:) withObject:result waitUntilDone:NO];
            [self showTotast:@"编辑信息成功"];
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
      [self.tableView reloadData];
    
}
- (void)showTotast:(NSString *)title
{
    
    [MBUtil showTotastView:kAppdelegate.window WithTitle:title];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 80;
    }
    else
    {
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.row == 0)
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:0];
            cell.titleLabel1.text  = @"头像";

            [cell.pic1 sd_setImageWithURL:[NSURL URLWithString:self.infoDic[@"avatar"]] placeholderImage:kPlaceHoderImage];
            return cell;
        }
       else if (indexPath.row == 1)
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:1];
            
            cell.titleLabel2.text  = @"昵称";
            cell.phone.text = self.infoDic[@"user_nicename"];
            
            return cell;

        }
        else if (indexPath.row == 2)
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:1];
            cell.titleLabel2.text  = @"签名";
            cell.phone.text = self.infoDic[@"introduction"];
            return cell;
        }
        else
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:2];
            cell.titleLabel3.text  = @"性别";
            cell.sex = self.infoDic[@"sex"];
            cell.buttonBlock = ^(NSInteger index)
            {
                [self.infoDic setObject:[@(index) stringValue] forKey:@"sex"];
            };
            return cell;

        }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [ToolObject showActionSheetWithTitle:@"选取图片" Item1:@"从相册选取" AndItem2:@"拍一张" AndItem3:@"取消" AndViewController:self AndCallBack:^(int index) {
            if (index == 1) {
                [self LocalPhoto];
            } else if ( index == 2) {
                [self takePhoto];
                
                
            }
        }];
    }
    if (indexPath.row == 1)
    {
        ChangeNickNameVC *vc = [[ChangeNickNameVC alloc] initWithNibName:@"ChangeNickNameVC" bundle:nil];
        InfoCell1 *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        vc.textfield.text = cell.phone.text;
        
        vc.block = ^(NSString *str)
        {
            //            cell.phone.text = str;
            [self.infoDic setObject:str forKey:@"user_nicename"];
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];

        
    }
    if (indexPath.row == 2)
    {
        ChangeSignVC *vc = [[ChangeSignVC alloc] initWithNibName:@"ChangeSignVC" bundle:nil];
        InfoCell1 *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        vc.textVIew.text = cell.phone.text;

        vc.block = ^(NSString *str)
        {
//            cell.phone.text = str;
            [self.infoDic setObject:str forKey:@"introduction"];
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES
         ];
        
    }
  }
- (void)takePhoto
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        [ToolObject showAlertWith:@"请在设备的\"设置-隐私-相机\"中允许访问相机。" AndContent:nil AndViewController:self AndCallBack:^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root"]];
            
        }];
        NSLog(@"相机权限受限");
    }
    //相册中选取
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePick = [[UIImagePickerController alloc] init];
        imagePick.allowsEditing = YES;
        imagePick.delegate = self;
        imagePick.sourceType = sourceType;
        [self presentViewController:imagePick animated:YES completion:^{
            
        }];
    } else {
        
    }
    
}

- (void)LocalPhoto
{
    //拍照
    UIImagePickerControllerSourceType sourceTyoe = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *pick = [[UIImagePickerController alloc] init];
        pick.allowsEditing = YES;
        pick.sourceType = sourceTyoe;
        pick.delegate = self;
        [self presentViewController:pick animated:YES completion:^{
            
        }];
    } else {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Photos"]];
        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //
    //    if ([type isEqualToString:@"public.image"])
    //    {
    //        UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    NSLog(@"%@",type);
    if ([type isEqualToString:@"public.image"])
    {
        UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        
        //        UIImage *tempImage;
        NSData *photo = UIImageJPEGRepresentation(image, 0.3);
        UIImage *tempImage = [UIImage imageWithData:photo];
        InfoCell1 *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.pic1.image = tempImage;
//        NSString *baseString = [photo base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        UIImage * theImage = [UIImage imageWithData:photo];
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
