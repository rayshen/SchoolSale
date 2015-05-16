//
//  MyColletionViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/3.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "MyColletionViewController.h"

@interface MyColletionViewController ()

@end

@implementation MyColletionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initfromtype];
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    [self addtableview];
}

-(void)initfromtype{
    if (self.myinfoType==mySale) {
        self.navigationItem.title=@"我的摊位";
    
    }else if(self.myinfoType==myWant){
        self.navigationItem.title=@"我的求购";

    
    
    }else if(self.myinfoType==myCollect){
        self.navigationItem.title=@"我的收藏";

        
    }else{
    
    }
}

-(void)addtableview{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
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
    return 3;
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
    DetailViewController *dvc =[[DetailViewController alloc] init];
    //DetailViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:dvc animated:YES];
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
