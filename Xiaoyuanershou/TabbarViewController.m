//
//  TabbarViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/4/12.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "TabbarViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTintColor:[UIColor brownColor]];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"plusicon"] highlightImage:[UIImage imageNamed:@"plusicon"]];
}


// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    //button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //NSLog(@"aaa:%f",self.tabBar.frame.size.height);
    CGFloat evexplus=CGRectGetWidth(self.view.bounds)/4.8;
    CGFloat evex=CGRectGetWidth(self.view.bounds)/5;
    CGFloat buttonheight=CGRectGetHeight(self.tabBar.frame);

    
    button.frame = CGRectMake(evex*2, 0, evexplus, buttonheight);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:button];
}
/*
-(void)addCenternTabBarButton{
    //NSLog(@"addCenternTabBarButton");
    //创建一个自定义button
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //初始化button的背景图片
    UIImage *centerButtonImg = [UIImage imageNamed:@"addicon"];
    //设置button的frame
    centerButton.frame = CGRectMake(0, 0, centerButtonImg.size.width, centerButtonImg.size.height);
    //设置button的背景图片
    [centerButton setBackgroundImage:centerButtonImg forState:UIControlStateNormal];
    //设置button的action
    [centerButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat imageHeight = centerButtonImg.size.height;
    CGFloat barHeight = self.tabBarController.tabBar.frame.size.height;
    //NSLog(@"imageHeight=%2.f,barHeight=%.2f",imageHeight,barHeight);
    CGFloat delta = imageHeight-barHeight;
    //NSLog(@"delta=%.2f",delta);
    
    //设置centerButton的中心位置
    if(delta<=0){//如果图片高度小于等于TabBar高度
        centerButton.center = self.tabBarController.tabBar.center;
    }else{//如果图片高度大于TabBar高度
        CGPoint center = self.tabBarController.tabBar.center;
        center.y = center.y - delta/2.0;
        centerButton.center = center;
    }
    //将centerButton加入到tabBarController中
    [self.tabBarController.view addSubview:centerButton];
}
/*
/*
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(publishClick:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        
        CGPoint center = self.tabBar.center;
        center.y = self.tabBar.frame.size.height-buttonImage.size.height/2.0;
        button.center = center;
    }
    
    [self.tabBar addSubview:button];
}
*/

-(void)buttonclk{
    UINavigationController *PublicNavController=[self.storyboard instantiateViewControllerWithIdentifier:@"PublicNavController"];
    [self presentViewController:PublicNavController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
}
@end
