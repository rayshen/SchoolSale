//
//  IntroView.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/2.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "IntroView.h"

@implementation IntroView

+(IntroView *)instanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"IntroView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}
@end
