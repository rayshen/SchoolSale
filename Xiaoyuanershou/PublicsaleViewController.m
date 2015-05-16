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

#import "PublicsaleViewController.h"

@interface PublicsaleViewController (){
    BOOL cb1isselected;
    BOOL cb2isselected;
    UIButton *checkbox;
    UIButton *checkbox2;
}

@end

@implementation PublicsaleViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma end

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"卖点什么";
    [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
    [self initilzer];
}

#pragma mark - 初始化
- (void)initilzer{
    self.view.backgroundColor=[UIColor whiteColor];
    [self initview];
    [self addtopview];
    [self sharePhotoview];
    [self addcontactview];
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

-(void)addcontactview{
    UIView *contactview=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds)-360,CGRectGetWidth(self.view.bounds), 30)];
    [contactview setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1]];
    checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect checkboxRect = CGRectMake(0,0,30,30);
    [checkbox setFrame:checkboxRect];
    [checkbox setTag:1];
    [checkbox setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [checkbox addTarget:self action:@selector(checkboxClick1) forControlEvents:UIControlEventTouchUpInside];
    [contactview addSubview:checkbox];
    
    _field1=[[UITextField alloc]initWithFrame:CGRectMake(35, 0, CGRectGetWidth(self.view.bounds)-48, 30)];
    _field1.placeholder=@"请输入你的QQ号码";
    _field1.text=@"114425126";
    _field1.textColor=[UIColor lightGrayColor];
    _field1.delegate=self;
    [_field1 setEnabled:NO];
    [contactview addSubview:_field1];
    [self.view addSubview:contactview];
    
    UIView *contactview2=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds)-360+35,CGRectGetWidth(self.view.bounds), 30)];
    [contactview2 setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1]];
    checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect checkboxRect2 = CGRectMake(0,0,30,30);
    [checkbox2 setFrame:checkboxRect2];
    [checkbox setTag:2];
    [checkbox2 setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [checkbox2 addTarget:self action:@selector(checkboxClick2) forControlEvents:UIControlEventTouchUpInside];
    [contactview2 addSubview:checkbox2];
    
    
    _field2=[[UITextField alloc]initWithFrame:CGRectMake(35,0, CGRectGetWidth(self.view.bounds)-48, 30)];
    _field2.placeholder=@"请输入你的联系电话";
    _field2.text=@"15757111111";
    _field2.textColor=[UIColor lightGrayColor];
    _field2.delegate=self;
    [_field2 setEnabled:NO];

    [contactview2 addSubview:_field2];
    [self.view addSubview:contactview2];

}

-(void)checkboxClick1{
    if (cb1isselected) {
        cb1isselected=NO;
        [checkbox setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _field1.textColor=[UIColor lightGrayColor];
        [_field1 setEnabled:NO];
    }else{
        cb1isselected=YES;
        [checkbox setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _field1.textColor=[UIColor blackColor];
        [_field1 setEnabled:YES];

    }
}
-(void)checkboxClick2{
    if (cb2isselected) {
        cb2isselected=NO;
        [checkbox2 setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _field2.textColor=[UIColor lightGrayColor];
        [_field2 setEnabled:NO];


    }else{
        cb2isselected=YES;
        [checkbox2 setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _field2.textColor=[UIColor blackColor];
        [_field2 setEnabled:YES];

    }
}

-(void)backbuttonclk{
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

-(void)pubbuttonclk{
    /*
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经上架咯~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    */
    
    PubchooseViewController *pubc=[[PubchooseViewController alloc]init];
    [self.navigationController pushViewController:pubc animated:YES];
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
    [_field1 setInputAccessoryView:topView];
    [_field2 setInputAccessoryView:topView];
}


//隐藏键盘的方法
-(void)hidenKeyboard
{
    [self.titleField resignFirstResponder];
    [self.txtMsg resignFirstResponder];
    [self.field1 resignFirstResponder];
    [self.field2 resignFirstResponder];
}


- (void)sharePhotoview
{
    if (!self.photoView)
    {
        NSLog(@"%f",CGRectGetWidth(self.view.frame));
        self.photoView = [[MessagePhotoView alloc]initWithFrame:CGRectMake(0.0f,CGRectGetHeight(self.view.bounds)-280,CGRectGetWidth(self.view.bounds), 216)];
        [self.view addSubview:self.photoView];
        self.photoView.delegate = self;
    }
}
//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{

    [self presentViewController:picker animated:YES completion:nil];
}
-(void)addUIImagePicker:(UIImagePickerController *)picker{
    [self presentViewController:picker animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"aa");
    [self.field1 resignFirstResponder];
    [self.field2 resignFirstResponder];
    return YES;
}
@end
