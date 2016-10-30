//
//  ErcodeVC.m
//  JCDK
//
//  Created by 魏秀红 on 2016/10/30.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ErcodeVC.h"
#import "NavigationView.h"
#import "CoreImage/CoreImage.h"


@interface ErcodeVC ()
@property (weak, nonatomic) IBOutlet UIImageView *ercodeimg;


@end

@implementation ErcodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self navset];
    [self setnavigationBar];
    [self ercode];
    
    
    // Do any additional setup after loading the view from its nib.
}

//设置导航栏
-(void)navset{
    WeakSelf(wc);
    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:4];
    navigationView.titleLabel4.text = @"邀请";
//    navigationView.rightBtn0.hidden = false;
    navigationView.buttonBlock4 = ^(NSInteger button)
    {
        [wc.navigationController popViewControllerAnimated:NO];
    };
    
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    [self.view addSubview:navigationView];
    
}

- (void)setnavigationBar
{
    WeakSelf(wc);

    NavigationView *navigationView = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex:0];
    navigationView.frame = CGRectMake(0, 0, JCDK_Screen_WIDTH, 64);
    
    navigationView.titleLabel0.text = @"我的邀请";
     [navigationView.leftBtn0 setImage:[UIImage imageNamed:@"rerturn"] forState:UIControlStateNormal];
     [navigationView.rightBtn0 setImage:[UIImage imageNamed:@"detail_top_right"] forState:UIControlStateNormal];
    navigationView.buttonBlock0 = ^(NSInteger button)
    {
        if (button == 1)
        {
            //左边按钮点击
              [wc.navigationController popViewControllerAnimated:NO];
        }
        if (button == 2)
        {
            //右边按钮点击分享的按钮
        }
    };
    [self.view addSubview:navigationView];
    
}
-(void)ercode{
    [super viewDidLoad];
    // 1.创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认
    [filter setDefaults];
    // 3.给过滤器添加数据(正则表达式/账号和密码)
    NSString *dataString = @"邀请码abcdefg";
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 4.获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 5.将CIImage转换成UIImage，并放大显示
    self.ercodeimg.image = [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
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
