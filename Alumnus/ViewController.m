//
//  ViewController.m
//  Alumnus
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ViewController.h"
#import "Dock.h"
#import "WBNavigationController.h"
#import "HomepageMainViewController.h"
#import "MessageMainViewController.h"
#import "KnowledgeCenterViewController.h"
#import "SystemSetingViewController.h"
#import "UserMainViewController.h"

#define kDockHeight 44

@interface ViewController () <DockDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // 1.初始化所有的子控制器
    [self addAllChildControllers];
    
    // 2.初始化DockItems
    [self addDockItems];

}

#pragma mark 初始化所有的子控制器
- (void)addAllChildControllers
{
    // 1.工作平台
    HomepageMainViewController *homepage = [[HomepageMainViewController alloc] init];
    homepage.titleString = @"工作平台";
    WBNavigationController *nav1 = [[WBNavigationController alloc] initWithRootViewController:homepage];
    [self addChildViewController:nav1];
    
    // 2.信息中心
    MessageMainViewController *message = [[MessageMainViewController alloc] init];
    WBNavigationController *nav2 = [[WBNavigationController alloc] initWithRootViewController:message];
    [self addChildViewController:nav2];
    
    // 3.知识中心
    KnowledgeCenterViewController *knowledge = [[KnowledgeCenterViewController alloc] init];
    WBNavigationController *nav3 = [[WBNavigationController alloc] initWithRootViewController:knowledge];
    [self addChildViewController:nav3];
    
    // 4.系统设置
    SystemSetingViewController *systemSet = [[SystemSetingViewController alloc] init];
    WBNavigationController *nav4 = [[WBNavigationController alloc] initWithRootViewController:systemSet];
    systemSet.titleString = @"系统设置";
    [self addChildViewController:nav4];
    [self dock:nil itemSelectedFrom:2 to:0];
    
}


#pragma mark 添加Dock
- (void)addDockItems
{
    //往Dock里面填充内容
    [_dock addItemWithIcon:@"dock_1.png" selectedIcon:@"dock_1.png" title:@"工作平台"itemCategory:@"label"];
    
    [_dock addItemWithIcon:@"dock_2.png" selectedIcon:@"dock_2.png" title:@"信息中心" itemCategory:@"label"];
    
    [_dock addItemWithIcon:@"dock_3.png" selectedIcon:@"dock_3.png" title:@"知识中心" itemCategory:@"label"];
    
    
    [_dock addItemWithIcon:@"dock_4.png" selectedIcon:@"dock_4.png" title:@"系统设置" itemCategory:@"label"];
 
}

@end
