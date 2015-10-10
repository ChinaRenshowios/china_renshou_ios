//
//  YLInitSwipePasswordController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/27.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLInitSwipePasswordController.h"
#import "YLSwipeLockView.h"
#import "ViewController.h"

@interface YLInitSwipePasswordController ()<YLSwipeLockViewDelegate,UIAlertViewDelegate>
@property (nonatomic, weak) YLSwipeLockView *lockView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong) NSString *passwordString;
@property (nonatomic, weak) UIButton *resetButton;
@end

@implementation YLInitSwipePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"设置手势密码";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(40, 60, self.view.bounds.size.width - 80, 20);
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    CGFloat viewWidth = self.view.bounds.size.width - 40;
    CGFloat viewHeight = viewWidth;
    
    YLSwipeLockView *lockView = [[YLSwipeLockView alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - viewHeight - 40 - 100, viewWidth, viewHeight)];
    [self.view addSubview:lockView];
    
    self.lockView = lockView;
    self.lockView.delegate = self;
    
    UIButton *resetButton = [[UIButton alloc] initWithFrame:CGRectMake(20,lockView.frame.origin.y+lockView.frame.size.height+2*TOPEDGE,SIZEWIDTH/4, 20)];
    [resetButton setTitle:@"重新设置" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    self.resetButton = resetButton;
    self.resetButton.hidden = YES;
    UIButton *engoreButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH-20-SIZEWIDTH/4,lockView.frame.origin.y+lockView.frame.size.height+2*TOPEDGE,SIZEWIDTH/4, 20)];
    [engoreButton setTitle:@"跳过" forState:UIControlStateNormal];
    [engoreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [engoreButton addTarget:self action:@selector(engore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:engoreButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(YLSwipeLockViewState)swipeView:(YLSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password
{
    if (self.passwordString == nil) {
        self.passwordString = password;
        self.titleLabel.text = @"请再次输入密码";
        return YLSwipeLockViewStateNormal;
    }else if ([self.passwordString isEqualToString:password]){
        self.titleLabel.text = @"设置成功";
        self.passwordString = nil;
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:password forKey:@"gesturePassword"];
        
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
        return YLSwipeLockViewStateSelected;
    }else{
        self.titleLabel.text = @"两次密码输入不一致";
        self.resetButton.hidden = NO;
        return YLSwipeLockViewStateWarning;
    }
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)dismiss{
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setBool:YES forKey:@"gesturePasswordSet"];
        [userDefault synchronize];
        ViewController *viewVC = [[ViewController alloc] init];
        [[[UIApplication sharedApplication] delegate] window].rootViewController = viewVC;
    
}

-(void)reset
{
    self.passwordString = nil;
    self.titleLabel.text = @"设置手势密码";
    self.resetButton.hidden = YES;
}
-(void)engore{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定取消设置手势密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.tag = -1;
    [alertView show];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == -1) {
        if (buttonIndex==1) {
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setBool:YES forKey:@"engoreGesturePassword"];
            [userDefault synchronize];
            ViewController *viewVC = [[ViewController alloc] init];
            [[[UIApplication sharedApplication] delegate] window].rootViewController = viewVC;
        }
    }
}

@end
