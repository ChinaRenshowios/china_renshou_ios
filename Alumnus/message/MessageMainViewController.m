//
//  MessageMainViewController.m
//  Alumnus
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MessageMainViewController.h"
#import "topScrollView.h"

@interface MessageMainViewController ()<topScrollViewDelegate>
@property (nonatomic, strong)topScrollView *top;


@end

@implementation MessageMainViewController

#pragma lazy
- (topScrollView *)top
{
    if (!_top) {
        NSArray *arr = @[@"信息首页",@"电子刊物",@"IT首页",@"团重门户"];
        _top = [[topScrollView alloc]initWithTitles:arr];
        _top.delegate = self;
        
        [self.view addSubview:_top];
    }
    return _top;
}


#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
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
    
}

//获取数据
- (void)loadData
{
    
}

//刷新视图
- (void)resetSubViews
{
    self.top.frame = CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64 - 50);
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
