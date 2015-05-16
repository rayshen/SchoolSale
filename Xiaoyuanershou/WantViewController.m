//
//  ViewController.m
//  testKeywordDemo
//
//  Created by bluewave on 14-7-25.
//  Copyright (c) 2014年 Bluewave. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "WantViewController.h"

@interface WantViewController ()

@end

@implementation WantViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma end

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"I WANT ！";
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    [self initilzer];
}

#pragma mark - 初始化
- (void)initilzer{
    self.view.backgroundColor=[UIColor whiteColor];
    [self initview];
    
    [self addtopview];
    //[self sharePhotoview];
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    
}

-(void)initview{
    self.titleField.layer.borderWidth=0.5;
    self.titleField.layer.borderColor=[UIColor colorWithWhite:0.5f alpha:1.0f].CGColor;
    
    UIButton *backbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [backbutton setTintColor:[UIColor whiteColor]];
    [backbutton setImage:[UIImage imageNamed:@"arrow-left-outline"] forState:UIControlStateNormal];
    [backbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:backbutton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
    UIButton *pubbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [pubbutton setTintColor:[UIColor whiteColor]];
    [pubbutton setImage:[UIImage imageNamed:@"arrow-right-outline"] forState:UIControlStateNormal];
    [pubbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pubbutton addTarget:self action:@selector(pubbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:pubbutton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}

-(void)backbuttonclk{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)pubbuttonclk{
    WantchooseViewController *wtc=[[WantchooseViewController alloc]init];
    [self.navigationController pushViewController:wtc animated:YES];
    
}

-(void)addtopview{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    [topView setBarStyle:UIBarStyleDefault];
    [topView setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, 50, 25);
    [btn addTarget:self action:@selector(hidenKeyboard) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"arrow-down-outline"] forState:UIControlStateNormal];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
    
    [self.titleField setInputAccessoryView:topView];
    [self.txtMsg setInputAccessoryView:topView];
}


//隐藏键盘的方法
-(void)hidenKeyboard
{
    [self.titleField resignFirstResponder];
    [self.txtMsg resignFirstResponder];
}


- (void)sharePhotoview
{
    if (!self.photoView)
    {
        self.photoView = [[MessagePhotoView alloc]initWithFrame:CGRectMake(0.0f,CGRectGetHeight(self.view.frame)-280,CGRectGetWidth(self.view.frame), 216)];
        [self.view addSubview:self.photoView];
        self.photoView.delegate = self;
    }
}
//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
}
@end
