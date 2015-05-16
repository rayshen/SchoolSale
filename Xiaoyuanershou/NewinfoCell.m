//
//  WitkeyTableCell.m
//  SchoolTrade
//
//  Created by Shen on 14/11/12.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import "NewinfoCell.h"

@implementation NewinfoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
      self.tximgview.frame =CGRectMake(10,10,30,30);
    
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"NewinfoCell" owner:self options:nil];
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UITableViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.tximgview.bounds=CGRectMake(10,10,30,30);
    self.tximgview.frame=CGRectMake(10,10,30,30);
    self.tximgview.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
