//
//  CLSDetailViewCell.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/2.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "CLSDetailViewCell.h"

@implementation CLSDetailViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CLSDetailViewCell" owner:self options:nil];
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        
        self = [arrayOfViews objectAtIndex:0];
        CGFloat borderWidth = 1.0f;
        self.layer.borderWidth=borderWidth;
        self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    }
    return self;
}

@end
