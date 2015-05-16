//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "MyinfoViewController.h"
#import "DetailinfoViewController.h"
@interface MyinfoViewController ()

@property UITableView *tableView;

@end

@implementation MyinfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addtableview];
    self.navigationItem.title=@"我的";
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)addtableview{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return 1;
    }
    if(section==1){
        return 3;
    }
    else
        return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return 0.01f;
    }else{
        return 10.00f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    UIView *sectionheader=[[UIView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), 20)];
    
    return sectionheader;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return 80;
    }
    else
        return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    CGFloat imageSize = 60.f;
    PAImageView *avaterImageView = [[PAImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)-100,10, imageSize, imageSize) backgroundProgressColor:[UIColor whiteColor] progressColor:[UIColor lightGrayColor]];
    //[avaterImageView setImageURL:@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=5454ab5e0bf79052ef1f403e38cbd5ca/c75c10385343fbf2c6e17e6eb27eca8064388faa.jpg"];
    [avaterImageView setImage:[UIImage imageNamed:@"txsample"]];
    
    
    if (cell == nil) {
        if (indexPath.section==0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //[cell.imageView setFrame:CGRectMake(10,10,70,70)];
            [cell addSubview:avaterImageView];
            cell.textLabel.text=@"Rayshen";
            cell.detailTextLabel.text=@"我的东西我做主~";
            cell.detailTextLabel.textColor=[UIColor lightGrayColor];
        }
        if (indexPath.section==1) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text =@"我的摊位";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                case 1:
                    cell.textLabel.text =@"我的求购";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                case 2:
                    cell.textLabel.text =@"我的收藏";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
            }
        }
        if (indexPath.section==2) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text =@"意见反馈";
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                default:
                    break;
            }
        }
    }
        [cell setBackgroundColor:[UIColor whiteColor]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailinfoViewController *detailinfo=[[DetailinfoViewController alloc]init];
    detailinfo.hidesBottomBarWhenPushed=YES;
    
    feedbackViewController *feedback = [self.storyboard instantiateViewControllerWithIdentifier:@"feedbackViewController"];
    feedback.hidesBottomBarWhenPushed=YES;
    
    MyColletionViewController *mcv=[[MyColletionViewController alloc]init];
    mcv.hidesBottomBarWhenPushed=YES;

    if (indexPath.section==0) {
        [self.navigationController pushViewController:detailinfo animated:YES];

    }
    
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            mcv.myinfoType=mySale;
            [self.navigationController pushViewController:mcv animated:YES];
        }
        if (indexPath.row==1) {
            mcv.myinfoType=myWant;
            [self.navigationController pushViewController:mcv animated:YES];
        }
        if (indexPath.row==2) {
            mcv.myinfoType=myCollect;
            [self.navigationController pushViewController:mcv animated:YES];
        }
    }
    
    if (indexPath.section==2) {
        if (indexPath.row==0) {
            [self.navigationController pushViewController:feedback animated:YES];
        }
    }
}

@end