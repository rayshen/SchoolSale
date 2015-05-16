//
//  WitkeyTableCell.h
//  SchoolTrade
//
//  Created by Shen on 14/11/12.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewinfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UIImageView *tximgview;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UIImageView *photo1;
@property (weak, nonatomic) IBOutlet UIImageView *photo2;
@property (weak, nonatomic) IBOutlet UIImageView *photo3;
@property (weak, nonatomic) IBOutlet UILabel *schoollabel;
@property (weak, nonatomic) IBOutlet UIButton *msbutton;
@property (weak, nonatomic) IBOutlet UIButton *likebutton;
@property (weak, nonatomic) IBOutlet UIImageView *studenticon;

@property int num;

@end
