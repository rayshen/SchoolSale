//
//  editinfoViewController.h
//  SchoolTrade
//
//  Created by Shen on 14/12/27.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditinfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textfiled;
- (IBAction)editok:(id)sender;
@property NSString *value;
@end
