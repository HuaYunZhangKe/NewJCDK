//
//  OrderWebViewVC.h
//  IKE
//
//  Created by 张科 on 16/10/11.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "JCDKBaseVC.h"

@interface OrderWebViewVC : JCDKBaseVC
@property (nonatomic ,retain)UIWebView *webView;
@property (nonatomic, retain)NSString *urlStr;
@property (nonatomic ,retain)NSString *naviTitle;
@end
