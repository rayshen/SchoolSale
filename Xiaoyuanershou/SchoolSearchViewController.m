//
//  MainViewController.m
//  UISearchDisplayControllerDemo
//
//  Created by Enwaysoft on 14-8-20.
//  Copyright (c) 2014年 Enway. All rights reserved.
//

#import "SchoolSearchViewController.h"

@interface SchoolSearchViewController ()

@end

@implementation SchoolSearchViewController

UIView *headerView;
UISearchBar *searchBar;
UILabel *headerLabel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //data = [NSArray arrayWithObjects:@"iPhone6",@"iPhone5S",@"iPhone6 Plus",@"iPad Air",@"iPad4",@"iPod Touch5",@"iPod",@"iMac",@"iWatch" ,@"iCloud",nil];
        myData = [NSArray arrayWithObjects:@"浙江工业大学",@"浙江大学",nil];
        data = [NSArray arrayWithObjects:@"浙江工业大学",@"浙江大学",@"杭州电子科技大学",@"浙江理工大学",@"浙江工商大学",@"杭州师范大学",@"浙江师范大学",@"浙江传媒学院",@"浙江科技学院",@"宁波大学",nil];
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationItem.title=@"学校设置";
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 84)];//创建一个视图
    headerView.backgroundColor=[UIColor whiteColor];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchBar.placeholder = @"输入学校搜索进行关注";
    searchDisplayController=[[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate=self;
    // searchResultsDataSource 就是 UITableViewDataSource
    searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    searchDisplayController.searchResultsDelegate = self;
    [headerView addSubview:searchBar];
    
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 44, self.view.frame.size.width, 40)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:20.0];
    headerLabel.textColor = [UIColor grayColor];
    headerLabel.text = @"已关注的大学校区";
    [headerView addSubview:headerLabel];
    
    //UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    //searchBar.placeholder = @"输入学校搜索";
    
    // 添加 searchbar 到 headerview
    self.tableView.tableHeaderView = headerView;
    
    // 用 searchbar 初始化 SearchDisplayController
    // 并把 searchDisplayController 和当前 controller 关联起来
    //searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
    // searchResultsDataSource 就是 UITableViewDataSource
    //searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    //searchDisplayController.searchResultsDelegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 84)];//创建一个视图
        headerView.backgroundColor=[UIColor whiteColor];
        
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        searchBar.placeholder = @"输入学校搜索";
        searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
        // searchResultsDataSource 就是 UITableViewDataSource
        searchDisplayController.searchResultsDataSource = self;
        // searchResultsDelegate 就是 UITableViewDelegate
        searchDisplayController.searchResultsDelegate = self;
        [headerView addSubview:searchBar];

         UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
         headerLabel.backgroundColor = [UIColor clearColor];
         headerLabel.font = [UIFont boldSystemFontOfSize:15.0];
         headerLabel.textColor = [UIColor grayColor];
         headerLabel.text = @"我收藏的大学校区";
         [headerView addSubview:headerLabel];
        
 
        UIView *sectionheader=[[UIView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), 20)];
 
        return headerView;
    }else{
        return nil;
    }
}
*/

/*
 * 如果原 TableView 和 SearchDisplayController 中的 TableView 的 delete 指向同一个对象
 * 需要在回调中区分出当前是哪个 TableView
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return myData.count;
    }else{
        // 谓词搜索
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@",searchDisplayController.searchBar.text];
        
        filterData =  [[NSArray alloc] initWithArray:[data filteredArrayUsingPredicate:predicate]];
        
        return filterData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    if (tableView == self.tableView) {
        cell.textLabel.text = myData[indexPath.row];
    }else{
        cell.textLabel.text = filterData[indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text;
    if (tableView == self.tableView) {
        text = myData[indexPath.row];
    }else{
        text = filterData[indexPath.row];
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要关注吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
        [alert show];
    }
    NSLog(@"you click %d   %@",indexPath.row,text);
}



- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    [searchBar setFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.tableView.tableHeaderView = headerView;
    [self.tableView reloadData];

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
        if (buttonIndex == 0) {     // and they clicked OK.
            
            myData = [NSArray arrayWithObjects:@"浙江工业大学",@"浙江大学",@"杭州电子科技大学",nil];
            [searchDisplayController setActive:NO animated:YES];
        }
}

@end
