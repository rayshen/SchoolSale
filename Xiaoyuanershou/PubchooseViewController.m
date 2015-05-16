//
//  PubchooseViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/3.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "PubchooseViewController.h"

@interface PubchooseViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    UIPickerView *pickerView;
    NSArray *pickerData;
    UITextField *pricefield;
}

@end

@implementation PubchooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"价格和类别";
    self.view.backgroundColor=[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    [self addpickerview];
    [self addtextfield];
    
    UIButton *pubbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [pubbutton setTintColor:[UIColor whiteColor]];
    [pubbutton setImage:[UIImage imageNamed:@"arrow-forward-outline"] forState:UIControlStateNormal];
    [pubbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pubbutton addTarget:self action:@selector(pubbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:pubbutton];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}

-(void)addpickerview{
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), 300)];
    //    指定Delegate
    pickerView.delegate=self;
    //    显示选中框
    pickerView.showsSelectionIndicator=YES;
    [self.view addSubview:pickerView];
    
    NSArray *dataArray = [[NSArray alloc] initWithObjects:@"--请选择东西的类别--",@"校园代步",@"手机数码",@"电脑办公",@"数码配件",@"电器",@"运动健身",@"衣物伞帽",@"图书教材",@"出租",@"其他", nil];
    pickerData=dataArray;

}

-(void)addtextfield{
    pricefield=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 40)];
    pricefield.backgroundColor=[UIColor whiteColor];
    pricefield.placeholder=@"给宝贝个合理的价格吧";
    pricefield.textAlignment=NSTextAlignmentCenter;
    pricefield.borderStyle = UITextBorderStyleNone;
    pricefield.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    pricefield.delegate=self;
    [self.view addSubview:pricefield];
    [pricefield becomeFirstResponder];
}

-(void)pubbuttonclk{
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经上架咯~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Date Source Methods

//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [pickerData objectAtIndex:row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


BOOL isHaveDian;
//textField.text 输入之前的值         string 输入的字符
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([pricefield.text rangeOfString:@"."].location==NSNotFound) {
        isHaveDian=NO;
    }
    if ([string length]>0)
    {
        unichar single=[string characterAtIndex:0];//当前输入的字符
        if ((single >='0' && single<='9') || single=='.')//数据格式正确
        {
            //首字母不能为0和小数点
            if([pricefield.text length]==0){
                if(single == '.'){
                    [self alertView:@"亲，第一个数字不能为小数点"];
                    [pricefield.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                    
                }
                if (single == '0') {
                    [self alertView:@"亲，第一个数字不能为0"];
                    [pricefield.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                    
                }
            }
            if (single=='.')
            {
                if(!isHaveDian)//text中还没有小数点
                {
                    isHaveDian=YES;
                    return YES;
                }else
                {
                    [self alertView:@"亲，您已经输入过小数点了"];
                    [pricefield.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            else
            {
                if (isHaveDian)//存在小数点
                {
                    //判断小数点的位数
                    NSRange ran=[pricefield.text rangeOfString:@"."];
                    int tt=range.location-ran.location;
                    if (tt <= 2){
                        return YES;
                    }else{
                        [self alertView:@"亲，您最多输入两位小数"];
                        return NO;
                    }
                }
                else
                {
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [self alertView:@"亲，您输入的格式不正确"];
            [pricefield.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    else
    {
        return YES;
    }
    
}

-(void)alertView:(NSString *)string{
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
@end
