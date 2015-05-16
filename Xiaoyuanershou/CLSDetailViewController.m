//
//  CLSDetailViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/2.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "CLSDetailViewController.h"

@interface CLSDetailViewController ()

@end

@implementation CLSDetailViewController

UICollectionView *cv;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addcollectionview];
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];

    // Do any additional setup after loading the view.
}

-(void)addcollectionview{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(145, 180)];//设置cell的尺寸
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//设置其布局方向
    
    NSLog(@"%f",CGRectGetWidth(self.view.bounds));
    
    
    cv=[[UICollectionView alloc]initWithFrame:CGRectMake(10,10,CGRectGetWidth(self.view.bounds)-20,500) collectionViewLayout:flowLayout];
    [cv registerClass:[CLSDetailViewCell class] forCellWithReuseIdentifier:@"CLSDetailViewCell"];
    
    [cv setBackgroundColor:[UIColor clearColor]];
    cv.delegate=self;
    cv.dataSource=self;
    
    [self.view addSubview:cv];
}

//设置index界面的ITEM个数，文字和图片===========================================
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CLSDetailViewCell *cell = (CLSDetailViewCell *)[cv dequeueReusableCellWithReuseIdentifier:@"CLSDetailViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.4];
    
    //[cell setBackgroundColor:[UIColor colorWithRed:240 green:217 blue:171 alpha:1]];
    
    /*
     //图片名称
     NSString *imageToLoad = [NSString stringWithFormat:@"tx%i.png", (int)indexPath.row];
     //加载图片
     cell.imgview.image = [UIImage imageNamed:imageToLoad];
     */
    return cell;
}
//===========================================================================


//collectionView的点击接口函数实现=============================================
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell #%ld was selected", indexPath.row);
    DetailViewController *DetailViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DetailViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:DetailViewController animated:YES];
    return;
}


@end
