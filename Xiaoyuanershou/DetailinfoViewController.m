//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "DetailinfoViewController.h"
#import "editinfoViewController.h"
@interface DetailinfoViewController ()

@property UITableView *tableView;

@end


@implementation DetailinfoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    [self addtableview];
    self.navigationItem.title=@"我的账户";
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


-(void)addtableview{
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)+40) style:UITableViewStyleGrouped];
    //[self.tableView setContentSize:CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)+200)];
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
        return 4;
    }
    else if (section==1) {
        return 4;
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int section = (int)indexPath.section;
    int row = (int)indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    CGFloat imageSize = 40.f;
    PAImageView *avaterImageView = [[PAImageView alloc]initWithFrame:CGRectMake(-40, -10, imageSize, imageSize) backgroundProgressColor:[UIColor whiteColor] progressColor:[UIColor lightGrayColor]];
    //[avaterImageView setImageURL:@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=5454ab5e0bf79052ef1f403e38cbd5ca/c75c10385343fbf2c6e17e6eb27eca8064388faa.jpg"];
    [avaterImageView setImage:[UIImage imageNamed:@"txsample"]];
    
    switch (section) {
        case 0:
            switch (row) {
                case 0:
                    cell.textLabel.text =  @"头像";
                    cell.detailTextLabel.text=@" ";
                    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
                    [cell.detailTextLabel addSubview:avaterImageView];
                    break;
                case 1:
                    cell.textLabel.text = @"昵称";
                    cell.detailTextLabel.text=@"Rayshen";
                    break;
                case 2:
                    cell.textLabel.text = @"学校";
                    cell.detailTextLabel.text=@"浙江工业大学";
                    break;
                case 3:
                    cell.textLabel.text = @"学生认证";
                    cell.detailTextLabel.text=@"已认证";
                    
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (row) {
                case 0:
                    cell.textLabel.text = @"邮箱管理";
                    cell.detailTextLabel.text=@"114425126@qq.com";

                    break;
                case 1:
                    cell.textLabel.text =  @"手机设置";
                    cell.detailTextLabel.text=@"15757111111";
                    break;
                case 2:
                    cell.textLabel.text =  @"QQ设置";
                    cell.detailTextLabel.text=@"114425126";
                    break;
                case 3:
                    cell.textLabel.text =  @"密码管理";
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (row) {
                case 0:
                    cell.textLabel.text = @"退出登陆";
                    break;
                    
                default:
                    break;
            }
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)atableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0&&indexPath.row==0){
        return 60;
    }else
        return 44;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    EditinfoViewController *editinfoViewController = [storyBoard instantiateViewControllerWithIdentifier:@"EditinfoViewController"];
    
    RSKExampleViewController *rsk =[[RSKExampleViewController alloc] init];

    ASViewController *loginvc=[[ASViewController alloc]init];
    
    SchoolSettingViewController *ssvc=[[SchoolSettingViewController alloc]init];
    
    StuConfirmViewController *scvc=[storyBoard instantiateViewControllerWithIdentifier:@"StuConfirmViewController"];
    
    if (indexPath.section==2&&indexPath.row==0) {
        // loginvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:loginvc animated:YES completion:nil];
        
    }else{
        switch (indexPath.section) {
            case 0:
                switch (indexPath.row) {
                    case 0:
                        [self.navigationController pushViewController:rsk animated:YES];
                        break;
                    case 1:
                        editinfoViewController.value=@"Rayshen";
                        [self.navigationController pushViewController:editinfoViewController animated:YES];
                        break;
                    case 2:
                        [self.navigationController pushViewController:ssvc animated:YES];
                        break;
                    case 3:
                        [self.navigationController pushViewController:scvc animated:YES];
                        break;
                    default:
                        break;
                }
                break;
            case 1:
                switch (indexPath.row) {
                    case 0:
                        editinfoViewController.value=@"114425126@qq.com";
                        [self.navigationController pushViewController:editinfoViewController animated:YES];
                        break;
                    case 1:
                        editinfoViewController.value=@"15757111111";
                        [self.navigationController pushViewController:editinfoViewController animated:YES];
                        break;
                    case 2:
                        editinfoViewController.value=@"114425126";
                        [self.navigationController pushViewController:editinfoViewController animated:YES];
                        break;
                    default:
                        break;
                }
                break;
            case 2:
                switch (indexPath.row) {
                    case 0:
                        break;
                        
                    default:
                        break;
                }
            default:
                break;
        }
    }

}
@end