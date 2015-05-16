//
//  IntroView.h
//  Xiaoyuanershou
//
//  Created by shen on 15/5/2.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *txview;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;
+(IntroView *)instanceView;
@end
