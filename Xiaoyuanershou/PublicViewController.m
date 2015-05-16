//
//  PublicViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/4/11.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "PublicViewController.h"

@interface PublicViewController ()

@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self modeltocontroller];
    [self initset];
    // Do any additional setup after loading the view.
}

-(void)modeltocontroller{
    //PublicsaleViewController *PublicsaleViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"PublicsaleViewController"];
    //UINavigationController *PublicNavController=[self.storyboard instantiateViewControllerWithIdentifier:@"PublicNavController"];
    //[self presentViewController:PublicNavController animated:YES completion:nil];
}

-(void)initset{
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
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

@end
