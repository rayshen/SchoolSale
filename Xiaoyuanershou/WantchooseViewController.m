//
//  WantchooseViewController.m
//  Xiaoyuanershou
//
//  Created by shen on 15/5/3.
//  Copyright (c) 2015年 Shen. All rights reserved.
//

#import "WantchooseViewController.h"

@interface WantchooseViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    UIPickerView *pickerView;
    NSArray *pickerData;
}


@end

@implementation WantchooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"选择类别";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addpickerview];
    
    UIButton *pubbutton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    [pubbutton setTintColor:[UIColor whiteColor]];
    [pubbutton setImage:[UIImage imageNamed:@"arrow-forward-outline"] forState:UIControlStateNormal];
    [pubbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pubbutton addTarget:self action:@selector(pubbuttonclk) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:pubbutton];
    self.navigationItem.rightBarButtonItem=rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addpickerview{
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    //    指定Delegate
    pickerView.delegate=self;
    //    显示选中框
    pickerView.showsSelectionIndicator=YES;
    [self.view addSubview:pickerView];
    
    NSArray *dataArray = [[NSArray alloc] initWithObjects:@"--请选择东西的类别--",@"校园代步",@"手机数码",@"电脑办公",@"数码配件",@"电器",@"运动健身",@"衣物伞帽",@"图书教材",@"出租",@"其他", nil];
    pickerData=dataArray;
    
}

-(void)pubbuttonclk{
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经发粗去咯~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [self.navigationController popToRootViewControllerAnimated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
