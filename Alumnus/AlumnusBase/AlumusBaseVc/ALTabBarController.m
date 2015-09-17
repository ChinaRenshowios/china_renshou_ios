//
//  ALTabBarController.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALTabBarController.h"
#import "HomepageMainViewController.h"
#import "MessageMainViewController.h"
#import "KnowledgeCenterViewController.h"
#import "SystemSetingViewController.h"
#import "ALNavViewController.h"
#import "MyConfig.h"

@interface ALTabBarController ()

@end

@implementation ALTabBarController
#pragma lazy

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //获取数据
    [self loadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //刷新视图
    [self resetSubViews];
}

#pragma mark - private api
//初始化
- (void)setup
{
    self.view.backgroundColor = DOCK_BG_COLOR;
    
    // 1.工作平台
    HomepageMainViewController *homepage = [[HomepageMainViewController alloc] init];
    [self addChildViewController:homepage Title:@"工作平台" ImageName:@"home_setting.png" SelectImageName:@"home_setting.png"];
    
    // 2.信息中心
    MessageMainViewController *message = [[MessageMainViewController alloc] init];
 [self addChildViewController:message Title:@"信息中心" ImageName:@"dock_2.png" SelectImageName:@"dock_2.png"];
    // 3.知识中心
    KnowledgeCenterViewController *knowledge = [[KnowledgeCenterViewController alloc] init];
    [self addChildViewController:knowledge Title:@"知识中心" ImageName:@"dock_3.png" SelectImageName:@"dock_3.png"];
    // 4.系统设置
    SystemSetingViewController *systemSet = [[SystemSetingViewController alloc] init];
    [self addChildViewController:systemSet Title:@"系统设置" ImageName:@"dock_4.png" SelectImageName:@"dock_4.png"];
}

//获取数据
- (void)loadData
{

}

//刷新视图
- (void)resetSubViews
{

}

//添加tabbar子视图
- (void)addChildViewController:(UIViewController *)childController Title:(NSString *)title ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName
{
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    if (iOS7) {
        childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    }
    
    ALNavViewController *nav = [[ALNavViewController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
}
#pragma mark - public api

#pragma mark - appleDelegate

#pragma mark - customDelegate

#pragma mark - property



@end
