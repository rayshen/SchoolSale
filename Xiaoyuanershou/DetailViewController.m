//
//  DetailViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/4/29.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "DetailViewController.h"

static const CGFloat MJDuration = 2.0;

#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface DetailViewController ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation DetailViewController

IntroView *introview;
UIButton *wantbutton;

CGFloat TableViewHeight=0.0f;

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


- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i<3; i++) {
        [self.data addObject:MJRandomData];
    }
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    
    [self addscrollpad];
    [self addscrollview];
    [self addintroview];
    [self addtableview];

    [self addwantbutton];
    //[self example11];
    self.navigationItem.title=@"详情";
    
    [[HcCustomKeyboard customKeyboard] textViewShowView:self customKeyboardDelegate:self];
    // Do any additional setup after loading the view from its nib.
    //if(self.entertype)
    _scrollpad.contentSize=CGSizeMake(CGRectGetWidth(self.view.bounds),_scrollView.frame.size.height+introview.frame.size.height+self.tableView.frame.size.height+120);
}

-(void)talkBtnClick:(UITextView *)textViewGet
{
    NSLog(@"%@",textViewGet.text);
}

-(void)addintroview{
    int viewwidth=CGRectGetWidth(self.view.bounds);
    int viewheight=CGRectGetWidth(self.view.bounds);
    introview.frame = CGRectMake(0, _scrollView.frame.size.height+10,viewwidth,viewheight);

    introview=[IntroView instanceView];
    NSString *text = @"照片可以看出手机还是挺新的，几乎没有用过。杭州工大周围的可以当面交易。\n可以小刀。";
    introview.contentlabel.text = text;
    introview.contentlabel.lineBreakMode = UILineBreakModeWordWrap; //这个是关键
    introview.contentlabel.numberOfLines = 0;  //这个是关键
    //[introview.contentlabel setTextColor:[UIColor grayColor]];
    CGSize expectedLabelSize = [introview.contentlabel.text sizeWithFont:[UIFont systemFontOfSize:22.0] constrainedToSize:CGSizeMake(300.0f,CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    CGRect newFrame = introview.contentlabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    introview.contentlabel.frame = newFrame;
    [introview.contentlabel sizeToFit];
    
    CGFloat introViewHeight = 0.0f;
    CGFloat padding=10.0f;
    for (UIView* view in introview.subviews){
        introViewHeight += view.frame.size.height;
    }
    [introview setFrame:CGRectMake(0, _scrollView.frame.size.height+10,viewwidth,introViewHeight+padding)];
    [_scrollpad addSubview:introview];
    
}

-(void)addscrollpad{
    _scrollpad=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [_scrollpad setBackgroundColor:[UIColor clearColor]];
    [_scrollpad setShowsVerticalScrollIndicator:YES];
    [self.view addSubview:_scrollpad];
}

-(void)addscrollview{
    int maxpicnum=3;
    int viewwidth=CGRectGetWidth(self.view.bounds);
    int scrollviewheight=viewwidth/1.33;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, viewwidth, scrollviewheight)];
    
    //设置ScrollView滚动内容的区域
    //它通常是需要大于ScrollerView的显示区域的
    //这样才有必要在ScrollerView中滚动它
    [_scrollView setContentSize:CGSizeMake(viewwidth * maxpicnum, scrollviewheight)];
    
    //开启滚动分页功能，如果不需要这个功能关闭即可
    [_scrollView setPagingEnabled:YES];
    
    //设置划到顶部
    [_scrollView setScrollsToTop:NO];
    
    //隐藏横向与纵向的滚动条
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    
    //在本类中代理scrollView的整体事件
    [_scrollView setDelegate:self];
    
    for (int i =0; i<maxpicnum; i++)
    {
        //在这里给每一个ScrollView添加一个图片
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(i *viewwidth,0,viewwidth,scrollviewheight)];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"test%d",i]]];
        
        //把每页需要显示的VIEW添加进ScrollerView中
        [_scrollView addSubview:imageView];
    }
    
    //整体再将ScrollerView显示在窗口中
    [_scrollpad addSubview:_scrollView];
    
    
    //页面控制小工具
    //它会在底部绘制小圆点标志当前显示页面
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,0,viewwidth,20)];
    //设置页面的数量
    [_pageControl setNumberOfPages:maxpicnum];
    //监听页面是否发生改变
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [_scrollpad addSubview:_pageControl];
    
    //[self addTimer];
    //[self.view addSubview:_scrollpad];
}


- (void)changePage:(id)sender
{
    //得到当前页面的ID
    //int page = [sender currentPage];
    
    //在这里写你需要执行的代码
    //......
}

//手指离开屏幕后ScrollView还会继续滚动一段时间只到停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"结束滚动后缓冲滚动彻底结束时调用");
}

-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    //NSLog(@"结束滚动后开始缓冲滚动时调用");
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    //页面滚动时调用，根据滚动的值来设置当前Pagecontrol的ID
    [_pageControl setCurrentPage:fabs(scrollView.contentOffset.x/self.view.frame.size.width)];
    
    //NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.x);
    //NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.y);
}

-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    //NSLog(@"滚动视图开始滚动，它只调用一次");
}

-(void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
    //NSLog(@"滚动视图结束滚动，它只调用一次");
    
}

-(void)addtableview{
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, _scrollView.frame.size.height+introview.frame.size.height, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [_scrollpad addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    
    
    [self.tableView setFrame:CGRectMake(0, _scrollView.frame.size.height+introview.frame.size.height, CGRectGetWidth(self.view.bounds), self.data.count*100+10)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10.00f;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
  return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIndentifier=@"CommentViewCell";
    CommentViewCell * cell=[self.tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"CommentViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.floorlabel.text=[NSString stringWithFormat:@"%d楼",[indexPath row] + 1];
    
    cell.replybutton.tag = [indexPath row];

    [cell.replybutton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    if(indexPath.row==0){
        cell.namelabel.text=@"清仓的二哥";
        cell.txview.image=[UIImage imageNamed:@"txsample"];
        cell.contentlabel.text=@"可以小刀的。工大的便宜点卖。";
    }
    if(indexPath.row==1){
        cell.studenticon.image=nil;
    }
    if(indexPath.row==2){
        cell.namelabel.text=@"沃茨";
        cell.studenticon.image=nil;
        cell.txview.image=[UIImage imageNamed:@"demo-avatar-woz"];
        cell.contentlabel.text=@"便宜一点肯定好卖。";
    }
    
    return cell;
}

-(void)buttonPressed:(id)sender{
    NSLog(@"点击了按钮");
    [[HcCustomKeyboard customKeyboard] toggleView:@"回复他："];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了按钮");
    [[HcCustomKeyboard customKeyboard] toggleView:@"回复他："];
}

-(void)addwantbutton{
    wantbutton=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds), 0, 44, 44)];
    [wantbutton setTintColor:[UIColor whiteColor]];
    [wantbutton setImage:[UIImage imageNamed:@"heart-outline"] forState:UIControlStateNormal];
    [wantbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wantbutton addTarget:self action:@selector(wantbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:wantbutton];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)wantbuttonclk{
    [wantbutton setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}


@end
