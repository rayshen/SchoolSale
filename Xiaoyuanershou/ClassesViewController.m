//
//  INSViewController.m
//  Berlin Insomniac
//
//  Created by Salánki, Benjámin on 06/03/14.
//  Copyright (c) 2014 Berlin Insomniac. All rights reserved.
//

#import "ClassesViewController.h"

@interface ClassesViewController ()

@end

@implementation ClassesViewController

UIView *transview;
UIBarButtonItem *rightItem;
UILabel *descriptionLabel2;

NSString *MainLabelString[10]={
    @"校园代步",@"手机数码",@"电脑办公",@"数码配件",@"电器",
    @"运动健身",@"衣物伞帽",@"图书教材",@"出租",@"其他"
};

NSString *SecondLabelString[10]={
    @"自行车 电动车",@"手机 平板 相机",@"笔记本 显示器 台式",@"耳机 U盘 键盘",@"电扇 空调 饮水机",
    @"健身卡 篮球 足球",@"上衣 裤子 背包",@"教材 考研 杂志",@"租房 服装 道具",@"我还有点奇怪的东西"
};

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];

    //transview=[[UIView alloc]initWithFrame:CGRectMake(0, 20.0, CGRectGetWidth(self.view.bounds) - 40.0, 20.0)];
    //[self addbgview];
    //[self addwantbutton];
    [self addcollectionview];
}

-(void)addbgview{
    UIView *topbgview=[[UIView alloc]initWithFrame:CGRectMake(0,-20,CGRectGetWidth(self.view.bounds),64)];
    [topbgview setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:topbgview];
}

-(void)addwantbutton{
    UIButton *wantbutton=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 130.0, 0, 100, 44)];
    [wantbutton setTintColor:[UIColor whiteColor]];
    [wantbutton setImage:[UIImage imageNamed:@"lightbulb"] forState:UIControlStateNormal];
    [wantbutton setTitle: @"我要求购" forState: UIControlStateNormal];
    [wantbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wantbutton addTarget:self action:@selector(wantbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    rightItem = [[UIBarButtonItem alloc]initWithCustomView:wantbutton];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)addcollectionview{
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setItemSize:CGSizeMake((CGRectGetWidth(self.view.bounds)-50)/2, (CGRectGetWidth(self.view.bounds)-50)/2/145*70)];//设置cell的尺寸
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//设置其布局方向
    
        NSLog(@"%f",CGRectGetWidth(self.view.bounds));
    
    
        cv=[[UICollectionView alloc]initWithFrame:CGRectMake(20,40,CGRectGetWidth(self.view.bounds)-40,500) collectionViewLayout:flowLayout];
        [cv registerClass:[ClassesViewCell class] forCellWithReuseIdentifier:@"ClassesViewCell"];
        
        [cv setBackgroundColor:[UIColor clearColor]];
        cv.delegate=self;
        cv.dataSource=self;
    
    [self.view addSubview:cv];
}

//设置index界面的ITEM个数，文字和图片===========================================
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClassesViewCell *cell = (ClassesViewCell *)[cv dequeueReusableCellWithReuseIdentifier:@"ClassesViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.4];
    
    cell.MainLabel.text=MainLabelString[indexPath.row];
    cell.SecondLabel.text=SecondLabelString[indexPath.row];
    cell.imgview.image=[UIImage imageNamed:[NSString stringWithFormat:@"class%d",(int)indexPath.row]];
    [cell setBackgroundColor:[UIColor colorWithRed:240 green:217 blue:171 alpha:1]];

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
    
    CLSDetailViewController *CLSDetailViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"CLSDetailViewController"];
    [self.navigationController pushViewController:CLSDetailViewController animated:YES];
    CLSDetailViewController.navigationItem.title=MainLabelString[[indexPath row]];
    
    return;
}


- (IBAction)tosearch:(id)sender {
    QSearchViewController *qs=[[QSearchViewController alloc]init];
    qs.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:qs animated:YES];
}

- (IBAction)toiwant:(id)sender {
    WantViewController *WantViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"WantViewController"];
    [self.navigationController pushViewController:WantViewController animated:YES];
    NSLog(@"点击求购");
}
@end
