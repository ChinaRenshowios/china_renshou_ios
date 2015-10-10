//
//  YLCheckToUnlockViewController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/28.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLCheckToUnlockViewController.h"
#import "YLSwipeLockView.h"
#import "ViewController.h"
@interface YLCheckToUnlockViewController ()<YLSwipeLockViewDelegate,UIAlertViewDelegate>
@property (nonatomic, weak) YLSwipeLockView *lockView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic) NSUInteger unmatchCounter;
@property (nonatomic, weak) UILabel *counterLabel;
@end

@implementation YLCheckToUnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"解锁";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(10, 60, self.view.bounds.size.width - 20, 20);
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.view.bounds.size.width - 20, 20)];
    counterLabel.textColor = [UIColor redColor];
    counterLabel.textAlignment = NSTextAlignmentCenter;
    counterLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:counterLabel];
    self.counterLabel = counterLabel;
    self.counterLabel.hidden = YES;
    
    
    CGFloat viewWidth = self.view.bounds.size.width - 40;
    CGFloat viewHeight = viewWidth;
    
    YLSwipeLockView *lockView = [[YLSwipeLockView alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - viewHeight - 40 - 100, viewWidth, viewHeight)];
    [self.view addSubview:lockView];
    
    self.lockView = lockView;
    self.lockView.delegate = self;
    
    self.unmatchCounter = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(YLSwipeLockViewState)swipeView:(YLSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password
{
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"];
    if ([savedPassword isEqualToString:password]) {
        ViewController *viewVC = [[ViewController alloc] init];
        [[[UIApplication sharedApplication] delegate] window].rootViewController = viewVC;
        return YLSwipeLockViewStateNormal;
    }else{
        self.unmatchCounter--;
        if (self.unmatchCounter == 0) {
            self.counterLabel.text = @"解锁失败";
            self.counterLabel.hidden = NO;
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"多次输入失败，是否重置密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertview show];
            
        }else {
            self.counterLabel.text = [NSString stringWithFormat:@"解锁失败, 还剩%lu次", (unsigned long)self.unmatchCounter];
            self.counterLabel.hidden = NO;
        }
        return YLSwipeLockViewStateWarning;
    }
}

-(void)dismiss{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        self.unmatchCounter = 5;
    }
}

@end
