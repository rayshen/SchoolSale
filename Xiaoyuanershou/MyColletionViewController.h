//
//  MyColletionViewController.h
//  Xiaoyuanershou
//
//  Created by shen on 15/5/3.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewinfoCell.h"
#import "DetailViewController.h"
@interface MyColletionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

typedef enum{
    //以下是枚举成员
    mySale,
    myWant,
    myCollect
}myType;

@property UITableView *tableView;

@property int myinfoType;

@end
