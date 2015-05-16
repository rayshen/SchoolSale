//
//  ClassesViewCell.m
//  Xiaoyuanershou
//
//  Created by shen on 15/4/12.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "ClassesViewCell.h"

@implementation ClassesViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"ClassesViewCell" owner:self options:nil];
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
        CGFloat borderWidth = 2.0f;
        self.layer.borderWidth=borderWidth;
        self.layer.borderColor=[UIColor lightGrayColor].CGColor;
        self.SecondLabel.textColor=[UIColor grayColor];
    }
    return self;
}

@end
