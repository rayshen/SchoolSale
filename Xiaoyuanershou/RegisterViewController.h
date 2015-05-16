//
//  ASViewController.h
//  ASTextViewDemo
//
//  Created by Adil Soomro on 4/14/14.
//  Copyright (c) 2014 Adil Soomro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

//cells
@property (strong, nonatomic) IBOutlet UITableViewCell *usernameCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *passwordCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *passwordCell2;
@property (strong, nonatomic) IBOutlet UITableViewCell *doneCell;

//fields
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField2;

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

- (IBAction)letMeIn:(id)sender;
@end
