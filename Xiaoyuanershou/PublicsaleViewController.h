//
//  ViewController.h
//  testKeywordDemo
//
//  Created by bluewave on 14-7-25.
//  Copyright (c) 2014年 Bluewave. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>
#import "MessagePhotoView.h"
#import "PubchooseViewController.h"

@interface PublicsaleViewController : UIViewController<MessagePhotoViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *txtMsg;

@property (nonatomic,strong) MessagePhotoView *photoView;


@property UITextField *field1;
@property UITextField *field2;

@end
