//
//  ZBShareMenuView.m
//  MessageDisplay
//
//  Created by zhoubin@moshi on 14-5-13.
//  Copyright (c) 2014年 Crius_ZB. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "MessagePhotoView.h"
#import "ZYQAssetPickerController.h"
// 每行有4个
#define kZBMessageShareMenuPerRowItemCount 4
#define kZBMessageShareMenuPerColum 2

#define kZBShareMenuItemIconSize 60
#define KZBShareMenuItemHeight 80

#define MaxItemCount 5
#define ItemWidth 84
#define ItemHeight 124


@interface MessagePhotoView (){
    UILabel *lblNum;
}


/**
 *  这是背景滚动视图
 */
@property(nonatomic,strong) UIScrollView *photoScrollView;
@property (nonatomic, weak) UIScrollView *shareMenuScrollView;
@property (nonatomic, weak) UIPageControl *shareMenuPageControl;
@property(nonatomic,weak)UIButton *btnviewphoto;
@end

@implementation MessagePhotoView
@synthesize photoMenuItems;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)photoItemButtonClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didSelecteShareMenuItem:atIndex:)]) {
        NSInteger index = sender.tag;
        NSLog(@"self.photoMenuItems.count is %d",self.photoMenuItems.count);
        if (index < self.photoMenuItems.count) {
            [self.delegate didSelectePhotoMenuItem:[self.photoMenuItems objectAtIndex:index] atIndex:index];
        }
    }
}

- (void)setup{
   
    self.backgroundColor=[UIColor colorWithRed:230 green:230 blue:230 alpha:1.0f];
    //self.backgroundColor=[UIColor lightGrayColor];
    _photoScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 124)];
    _photoScrollView.contentSize = CGSizeMake(1024, 124);
   
    photoMenuItems = [[NSMutableArray alloc]init];
    _itemArray = [[NSMutableArray alloc]init];
    [self addSubview:_photoScrollView];
    lblNum = [[UILabel alloc]initWithFrame:CGRectMake(0, 170,[[UIScreen mainScreen] bounds].size.width, 30)];
    lblNum.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lblNum];
    [self initlizerScrollView:self.photoMenuItems];

}

-(void)reloadDataWithImage:(UIImage *)image{
    [self.photoMenuItems addObject:image];
    //NSLog(@"目前照片数目：%d",[self.photoMenuItems count]);
    [self initlizerScrollView:self.photoMenuItems];
}

-(void)initlizerScrollView:(NSMutableArray *)imgList{
    [self.photoScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //NSLog(@"目前照片数目：%d",imgList.count);

    for(int i=0;i<imgList.count;i++){
        
        UIImage *tempImg = [imgList objectAtIndex:i];
        
        MessagePhotoMenuItem *photoItem = [[MessagePhotoMenuItem alloc]initWithFrame:CGRectMake(10+ i * (ItemWidth + 5 ), 20, ItemWidth, ItemHeight)];
        photoItem.delegate = self;
        photoItem.index = i;
        photoItem.contentImage = tempImg;
        [self.photoScrollView addSubview:photoItem];
        [self.itemArray addObject:photoItem];
    }
    
    if(imgList.count<MaxItemCount){
        UIButton *btnphoto=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnphoto setFrame:CGRectMake(20 + (ItemWidth + 5) * imgList.count, 0, 84, 124)];//
        [btnphoto setImage:[UIImage imageNamed:@"btn_add_photo_n.png"] forState:UIControlStateNormal];
        [btnphoto setImage:[UIImage imageNamed:@"btn_add_photo_s.png"] forState:UIControlStateSelected];
        //给添加按钮加点击事件
        [btnphoto addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
        [self.photoScrollView addSubview:btnphoto];
    }
    
    NSInteger count = MIN(imgList.count +1, MaxItemCount);
     lblNum.text = [NSString stringWithFormat:@"已选%d张，共可选5张",self.photoMenuItems.count];
    lblNum.backgroundColor = [UIColor clearColor];
    [self.photoScrollView setContentSize:CGSizeMake(20 + (ItemWidth + 5)*count, 0)];
}

-(void)openMenu{
    //在这里呼出下方菜单按钮项
    myActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles:@"照相机",@"从相册选取", nil];
    //刚才少写了这一句
    [myActionSheet showInView:self.window];
    
    
}
//下拉菜单的点击响应事件
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == myActionSheet.cancelButtonIndex){
        NSLog(@"取消");
    }
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self localPhoto];
            break;
        default:
            break;
    }
}

//开始拍照
-(void)takePhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.modalPresentationStyle = UIModalPresentationCustom;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    [self.delegate addUIImagePicker:picker];
}


/*
    新加的另外的方法
 */
////////////////////////////////////////////////////////////
//打开相册，可以多选
-(void)localPhoto{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc]init];
    
    picker.maximumNumberOfSelection = 10;
    //picker.assetsFilter = [ALAssetsFilter allPhotos];
    //picker.showEmptyGroups = NO;
    picker.delegate = self;
    
    /*
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject,NSDictionary *bindings){
        if ([[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyType]isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyDuration]doubleValue];
            return duration >= 5;
        }else{
            return  YES;
        }
    }];
    */
    [self.delegate addPicker:picker];
}

#pragma  mark   -ZYQAssetPickerController Delegate

/*
 得到选中的图片
 */
#pragma mark - ZYQAssetPickerController Delegate

-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    [self.scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
   
    NSLog(@"self.itemArray is %d",self.photoMenuItems.count);
    NSLog(@"assets is %d",assets.count);
    
    //跳转到显示大图的页面
    ShowBigViewController *big = [[ShowBigViewController alloc]init];
    big.arrayOK = [NSMutableArray arrayWithArray:assets];
    
    
    
    for(int i=0;i<assets.count;i++){
        
        ALAsset *asset=assets[i];
        
        UIImage *tempImg=[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
        
        [self.photoMenuItems addObject:tempImg];
    }
    [self initlizerScrollView:self.photoMenuItems];
    
    
    
    NSLog(@"arraryOk is %d",big.arrayOK.count);
    [picker pushViewController:big animated:YES];
  
}
/////////////////////////////////////////////////////////


//选择某张照片之后
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"回调被执行");
    //关闭相册界面
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self reloadDataWithImage:image];
    NSLog(@"%f,%f",image.size.width,image.size.height);
    //创建一个选择后图片的图片放在scrollview中
    //加载scrollview中
    [picker dismissViewControllerAnimated:YES completion:nil];
}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)reloadData {
    
}
- (void)dealloc {
    //self.shareMenuItems = nil;
    self.photoScrollView.delegate = self;
    self.shareMenuScrollView.delegate = self;
    self.shareMenuScrollView = nil;
    self.shareMenuPageControl = nil;
}

#pragma mark - MessagePhotoItemDelegate

-(void)messagePhotoItemView:(MessagePhotoMenuItem *)messagePhotoItemView didSelectDeleteButtonAtIndex:(NSInteger)index{
    [self.photoMenuItems removeObjectAtIndex:index];
    [self initlizerScrollView:self.photoMenuItems];
}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //每页宽度
    CGFloat pageWidth = scrollView.frame.size.width;
    //根据当前的坐标与页宽计算当前页码
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    [self.shareMenuPageControl setCurrentPage:currentPage];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
