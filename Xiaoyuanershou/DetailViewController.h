//
//  DetailViewController.h
//  Xiaoyuanershou
//
//  Created by shen on 15/4/29.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroView.h"
#import "CommentViewCell.h"
#import "HcCustomKeyboard.h"
#import "UIView+MJExtension.h"
#import "MJRefresh.h"
@interface DetailViewController : UIViewController<UIScrollViewDelegate,UIPageViewControllerDelegate,UITableViewDataSource,UITableViewDelegate,HcCustomKeyboardDelegate>
typedef enum{
    //以下是枚举成员
    fromIndex,
    fromMessage
}myEnterType;

@property  UIScrollView *scrollView;

@property  UIPageControl *pageControl;

@property UIScrollView *scrollpad;

@property UITableView *tableView;

@property int entertype;

@end
