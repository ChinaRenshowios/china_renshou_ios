//
//  MessageMainViewController.m
//  Alumnus
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MessageMainViewController.h"
#import "topScrollView.h"
#import "MBProgressHUD+MJ.h"

@interface MessageMainViewController ()<topScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)topScrollView *top;
@property (nonatomic, strong)UITableView *table;

@end

@implementation MessageMainViewController

#pragma lazy

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
    self.table = [[UITableView alloc]init];
    self.table.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.table];
    self.table.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
}

//获取数据
- (void)loadData
{
    
}

//刷新视图
- (void)resetSubViews
{
    NSArray *arr = @[@"公司动态",@"公司通知"];
    self.top = [[topScrollView alloc]initWithTitles:arr];
    self.top.frame = CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64 - 50);
    self.top.delegate = self;
    self.top.content = self.table;

    [self.view addSubview:self.top];
}
#pragma mark - public api

#pragma mark - appleDelegate

#pragma mark - customDelegate
- (void)topScrollViewDidClickButtonIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
        }
            break;
            
        case 2:
        {
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - property


@end
