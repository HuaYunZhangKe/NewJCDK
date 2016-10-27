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
@interface SelfInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,retain)NSMutableDictionary *infoDic;
@end

@implementation SelfInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"个人信息";
    navigationView.saveBtn.hidden = NO;
    WeakSelf(wc);
    self.infoDic = [NSMutableDictionary dictionaryWithDictionary:@{@"head":@"",@"nickname":@"",@"sign":@"",@"gender":@""}];
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];

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
            return cell;
        }
       else if (indexPath.row == 1)
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:1];
            
            cell.titleLabel2.text  = @"昵称";
            cell.phone.text = self.infoDic[@"nickname"];
            return cell;

        }
        else if (indexPath.row == 2)
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:1];
            cell.titleLabel2.text  = @"签名";
            cell.phone.text = self.infoDic[@"sign"];
            return cell;
        }
        else
        {
            InfoCell1 *cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoCell1" owner:self options:nil] objectAtIndex:2];
            cell.titleLabel3.text  = @"性别";
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
            [self.infoDic setObject:str forKey:@"nickname"];
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
            [self.infoDic setObject:str forKey:@"sign"];
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
