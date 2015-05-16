//
//  editinfoViewController.m
//  SchoolTrade
//
//  Created by Shen on 14/12/27.
//  Copyright (c) 2014年 rayshen. All rights reserved.
//

#import "EditinfoViewController.h"

@interface EditinfoViewController ()

@end

@implementation EditinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textfiled.text=self.value;
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editok:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
