//
//  CommentViewCell.h
//  Xiaoyuanershou
//
//  Created by shen on 15/4/29.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *txview;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *floorlabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
@property (weak, nonatomic) IBOutlet UIButton *replybutton;
@property (weak, nonatomic) IBOutlet UIImageView *studenticon;

@end
