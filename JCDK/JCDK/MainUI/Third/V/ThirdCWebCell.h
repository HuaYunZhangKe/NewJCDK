//
//  ThirdCWebCell.h
//  JCDK
//
//  Created by 张科 on 16/9/20.
//  Copyright © 2016年 张科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdCWebCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain)NSString *urlStr;
@end
