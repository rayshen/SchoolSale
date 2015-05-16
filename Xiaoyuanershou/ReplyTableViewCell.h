//
//  ReplyTableViewCell.h
//  SchoolTrade
//
//  Created by Shen on 14/10/7.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tximageview;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;

@end
