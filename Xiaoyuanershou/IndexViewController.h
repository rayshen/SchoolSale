//  代码地址: https://github.com/CoderMJLee/MJRefresh
//  代码地址: http://code4app.com/ios/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E4%B8%8B%E6%8B%89%E4%B8%8A%E6%8B%89%E5%88%B7%E6%96%B0/52326ce26803fabc46000000
//  MJTableViewController.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/3/4.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewinfoCell.h"
#import "DetailViewController.h"
#import "BGRootViewVC.h"
#import "SchoolSearchViewController.h"
@interface IndexViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIButton *rightitem;
- (IBAction)rightitemclk:(id)sender;
- (IBAction)chooseType:(id)sender;

@end