//  代码地址: https://github.com/CoderMJLee/MJRefresh
//  代码地址: http://code4app.com/ios/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E4%B8%8B%E6%8B%89%E4%B8%8A%E6%8B%89%E5%88%B7%E6%96%B0/52326ce26803fabc46000000
//  MJTableViewController.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "IndexViewController.h"
#import "UIView+MJExtension.h"
#import "MJRefresh.h"

static const CGFloat MJDuration = 2.0;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface IndexViewController()
/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation IndexViewController
#pragma mark - 示例代码
#pragma mark UITableView + 下拉刷新 传统
- (void)example01
{
    __weak typeof(self) weakSelf = self;
    
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.legendHeader beginRefreshing];
    
    /**
     也可以这样使用
     [self.tableView.header beginRefreshing];
     
     此时self.tableView.header == self.tableView.legendHeader
     */
}

#pragma mark UITableView + 下拉刷新 动画图片
- (void)example02
{
    // 添加动画图片的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [self.tableView addGifHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    [self.tableView.gifHeader setImages:idleImages forState:MJRefreshHeaderStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    [self.tableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self.tableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStateRefreshing];
    // 在这个例子中，即将刷新 和 正在刷新 用的是一样的动画图片
    
    // 马上进入刷新状态
    [self.tableView.gifHeader beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.gifHeader
}

#pragma mark UITableView + 下拉刷新 隐藏时间
- (void)example03
{
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    self.tableView.header.updatedTimeHidden = YES;
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.legendHeader
}

#pragma mark UITableView + 下拉刷新 隐藏状态和时间01
- (void)example04
{
    // 添加动画图片的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [self.tableView addGifHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    self.tableView.header.updatedTimeHidden = YES;
    
    // 隐藏状态
    self.tableView.header.stateHidden = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 0; i<=72; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PullToRefresh_%03zd", i]];
        [idleImages addObject:image];
    }
    [self.tableView.gifHeader setImages:idleImages forState:MJRefreshHeaderStateIdle];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 73; i<=140; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PullToRefresh_%03zd", i]];
        [refreshingImages addObject:image];
    }
    [self.tableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStateRefreshing];
    
    // 在这个例子中，即将刷新时没有动画图片
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.gifHeader
    
    // 由于动画图片是黑色的，所以故意设置header底色为黑色
    self.tableView.header.backgroundColor = [UIColor blackColor];
}

#pragma mark UITableView + 下拉刷新 隐藏状态和时间02
- (void)example05
{
    // 添加动画图片的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [self.tableView addGifHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    self.tableView.header.updatedTimeHidden = YES;
    
    // 隐藏状态
    self.tableView.header.stateHidden = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    [self.tableView.gifHeader setImages:idleImages forState:MJRefreshHeaderStateIdle];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    [self.tableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStateRefreshing];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.gifHeader
}

#pragma mark UITableView + 下拉刷新 自定义文字
- (void)example06
{
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
    [self.tableView.header setTitle:@"Pull down to refresh" forState:MJRefreshHeaderStateIdle];
    [self.tableView.header setTitle:@"Release to refresh" forState:MJRefreshHeaderStatePulling];
    [self.tableView.header setTitle:@"Loading ..." forState:MJRefreshHeaderStateRefreshing];
    
    // 设置字体
    self.tableView.header.font = [UIFont systemFontOfSize:15];
    
    // 设置颜色
    self.tableView.header.textColor = [UIColor redColor];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.legendHeader
}

#pragma mark UITableView + 上拉刷新 传统
- (void)example11
{
    __weak typeof(self) weakSelf = self;
    
    // 添加传统的上拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    
    /**
     也可以这样使用
     self.tableView.footer.refreshingBlock = ^{
     
     };
     
     此时self.tableView.footer == self.tableView.legendFooter
     */
}

#pragma mark UITableView + 上拉刷新 动画图片
- (void)example12
{
    // 添加动画图片的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    [self.tableView addGifFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    self.tableView.gifFooter.refreshingImages = refreshingImages;
    
    // 此时self.tableView.footer == self.tableView.gifFooter
}

#pragma mark UITableView + 上拉刷新 隐藏状态01
- (void)example13
{
    // 添加动画图片的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    [self.tableView addGifFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 当上拉刷新控件出现50%时（出现一半），就会自动刷新。这个值默认是1.0（也就是上拉刷新100%出现时，才会自动刷新）
//    self.tableView.footer.appearencePercentTriggerAutoRefresh = 0.5;
    
    // 隐藏状态
    self.tableView.footer.stateHidden = YES;
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 73; i<=140; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PullToRefresh_%03zd", i]];
        [refreshingImages addObject:image];
    }
    self.tableView.gifFooter.refreshingImages = refreshingImages;
    
    // 此时self.tableView.footer == self.tableView.gifFooter
    
    // 由于动画图片是黑色的，所以故意设置footer底色为黑色
    self.tableView.footer.backgroundColor = [UIColor blackColor];
}

#pragma mark UITableView + 上拉刷新 隐藏状态02
- (void)example14
{
    // 添加动画图片的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    [self.tableView addGifFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 隐藏状态
    self.tableView.footer.stateHidden = YES;
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    self.tableView.gifFooter.refreshingImages = refreshingImages;
    
    // 此时self.tableView.footer == self.tableView.gifFooter
}

#pragma mark UITableView + 上拉刷新 全部加载完毕
- (void)example15
{
    // 添加传统的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadLastData方法）
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadLastData)];
    
    // 其他
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"恢复数据加载" style:UIBarButtonItemStyleDone target:self action:@selector(reset)];
}

- (void)reset
{
    [self.tableView.footer setRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    [self.tableView.footer beginRefreshing];
    [self.tableView.footer resetNoMoreData];
    
    // 此时self.tableView.footer == self.tableView.legendFooter
}

#pragma mark UITableView + 上拉刷新 禁止自动加载
- (void)example16
{
    // 添加传统的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 禁止自动加载
    self.tableView.footer.automaticallyRefresh = NO;
    
    // 此时self.tableView.footer == self.tableView.legendFooter
}

#pragma mark UITableView + 上拉刷新 自定义文字
- (void)example17
{
    // 添加传统的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置文字
    [self.tableView.footer setTitle:@"Click or drag up to refresh" forState:MJRefreshFooterStateIdle];
    [self.tableView.footer setTitle:@"Loading more ..." forState:MJRefreshFooterStateRefreshing];
    [self.tableView.footer setTitle:@"No more data" forState:MJRefreshFooterStateNoMoreData];
    
    // 设置字体
    self.tableView.footer.font = [UIFont systemFontOfSize:17];
    
    // 设置颜色
    self.tableView.footer.textColor = [UIColor blueColor];
    
    // 此时self.tableView.footer == self.tableView.legendFooter
}

#pragma mark UITableView + 上拉刷新 加载后隐藏
- (void)example18
{
    // 添加传统的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadOnceData方法）
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadOnceData)];
}

#pragma mark - 数据处理相关
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.footer endRefreshing];
    });
}

#pragma mark 加载最后一份数据
- (void)loadLastData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，变为没有更多数据的状态
        [self.tableView.footer noticeNoMoreData];
    });
}

#pragma mark 只加载一次数据
- (void)loadOnceData
{
    // 1.添加假数据
    for (int i = 0; i<25; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 隐藏当前的上拉刷新控件
        self.tableView.footer.hidden = YES;
    });
}

- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
    }
    return _data;
}

#pragma mark - 其他
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initset];
    [self example01];
    [self example11];
}


-(void)initset{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    //[self.rightitem setTitleColor:[UIColor colorWithRed:15 green:92 blue:58 alpha:1.00] forState:UIControlStateNormal];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    /*
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];//创建一个视图
    headerView.backgroundColor=[UIColor whiteColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 0, 150, 20)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    
    headerLabel.font = [UIFont boldSystemFontOfSize:15.0];
    
    headerLabel.textColor = [UIColor grayColor];
    
    headerLabel.text = @"最新发布";
    
    [headerView addSubview:headerLabel];
    */
    
    UIView *sectionheader=[[UIView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), 20)];

    return sectionheader;
    
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"最新发布";
}
*/

// 设置section的高度

/*- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 20;
}*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        return 150;
    }
    return 240;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndentifier=@"NewinfoCell";
    NewinfoCell * cell=[self.tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"NewinfoCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
   
    
    if (indexPath.section==1) {
        cell.photo1.image=nil;
        cell.photo2.image=nil;
        cell.photo3.image=nil;
        cell.tximgview.image=[UIImage imageNamed:@"demo-avatar-jobs"];
        cell.studenticon.image=nil;
        cell.namelabel.text=@"乔布斯";
        cell.titlelabel.text=@"收一个小米插线板！！！听说有USB口很厉害的样子";
        cell.pricelabel.text=@"";
        [cell.msbutton setTitle:@"785" forState:UIControlStateNormal];
        [cell.likebutton setTitle:@"999+" forState:UIControlStateNormal];
    }else{
        cell.photo1.image=[UIImage imageNamed:@"test1"];
        cell.photo2.image=[UIImage imageNamed:@"test0"];
        cell.photo3.image=[UIImage imageNamed:@"test2"];
        cell.pricelabel.text=@"参考价 ￥4998";
        
        [cell.msbutton setTitle:@"22" forState:UIControlStateNormal];
        [cell.likebutton setTitle:@"11" forState:UIControlStateNormal];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *DetailViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DetailViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:DetailViewController animated:YES];
}



- (IBAction)rightitemclk:(id)sender {
    SchoolSearchViewController *svc=[[SchoolSearchViewController alloc]init];
    svc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:svc animated:YES];
}


- (IBAction)chooseType:(id)sender {
    NSLog(@"aa");
    BGRootViewVC *BGRootViewVC =[self.storyboard instantiateViewControllerWithIdentifier:@"BGRootViewVC"];
    BGRootViewVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:BGRootViewVC animated:YES];
}
@end
