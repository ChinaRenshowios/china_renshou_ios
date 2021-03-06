//
//  KSYCommonViewController.m
//  Alumnus
//
//  Created by ksy on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KSYCommonViewController.h"

@interface KSYCommonViewController ()

@end

@implementation KSYCommonViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR;
#pragma mark 导航栏
    _nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 64)];
    _nav.backgroundColor = DOCK_BG_COLOR;
    
    
    //设置导航栏左侧“返回”按钮
    ZCImageButton *returnBtn = [[ZCImageButton alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
    [returnBtn.imageButton addTarget:self action:@selector(didClickReturnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"return" ofType:@"png"]];
    //image = [ZCUIImageUtil reSizeImage:image toSize:CGSizeMake(13.0f, 25.0f)];
    returnBtn.imageView_normal.frame = CGRectMake(18, 29,20,20);
    returnBtn.imageView_normal.image = image;
    
    // [returnBtn.imageButton setTitle:@"返回" forState:UIControlStateNormal];
    // returnBtn.imageButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    // returnBtn.imageButton.titleEdgeInsets = UIEdgeInsetsMake(26.5, 20, 5, 13);
    
    [_nav addSubview:returnBtn];
    
    //设置导航条文字
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100,17, SIZEWIDTH-200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font            = [UIFont boldSystemFontOfSize:15];  //设置文本字体与大小
    titleLabel.textColor       = TITLE_FONT_COLOR;  //设置文本颜色
    titleLabel.textAlignment   = NSTextAlignmentCenter;
    titleLabel.text = _titleString;
    
    [_nav addSubview:titleLabel];
    [self.view addSubview:_nav];
    
    

    // Do any additional setup after loading the view.
}
- (void)didClickReturnButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
