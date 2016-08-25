//
//  TouZhuViewController.m
//  JCDK
//
//  Created by 李锐 on 16/8/25.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "TouZhuViewController.h"
#import "JinqitouzhuCollectionViewCell.h"
@interface TouZhuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation TouZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.firstBtn.width = self.view.frame.size.width /3;
    self.secondBtn.width = self.view.frame.size.width /3;
    self.thirdBtn.width = self.view.frame.size.width /3;
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
       
        return cell;
    }
    else if (indexPath.row == 1)
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
     
        return cell;
        
    }
    else  
    {
        JinqitouzhuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
        
    }
           
           }
- (IBAction)firstBtn:(UIButton *)sender {
}
- (IBAction)sectionBtn:(UIButton *)sender {
}
- (IBAction)thirdBtn:(UIButton *)sender {
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
