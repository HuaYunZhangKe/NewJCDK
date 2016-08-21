//
//  ToolBarView.h
//  youzhitou
//
//  Created by 张科 on 16/8/15.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKBlocks.h"
@interface ToolBarView : UIView
@property (nonatomic, copy)YSBlock finishBlock;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *finishBtn;

@end
