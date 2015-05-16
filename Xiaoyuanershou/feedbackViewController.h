//
//  feedbackViewController.h
//  SchoolTrade
//
//  Created by Shen on 14/12/29.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface feedbackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textview;
- (IBAction)clicksend:(id)sender;

@end
