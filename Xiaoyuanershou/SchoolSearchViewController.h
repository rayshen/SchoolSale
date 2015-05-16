//
//  MainViewController.h
//  UISearchDisplayControllerDemo
//
//  Created by Enwaysoft on 14-8-20.
//  Copyright (c) 2014年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolSearchViewController : UITableViewController<UISearchDisplayDelegate,UIAlertViewDelegate>{
    NSArray *data;
    NSArray *myData;
    NSArray *filterData;
    UISearchDisplayController *searchDisplayController;
}
@end
