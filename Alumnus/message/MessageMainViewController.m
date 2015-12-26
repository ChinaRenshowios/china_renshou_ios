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
#import "ALNetWorkApi.h"
#import "MessageModel.h"

@interface MessageMainViewController ()<topScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)topScrollView *top;
@property (nonatomic, strong)UITableView *table;
@property (nonatomic, strong)NSMutableArray *dataList;
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
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.top.content = self.table;
}

//获取数据
- (void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"866769021414134" forKey:@"mobileDeviceId"];
    [params setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [params setValue:@"1" forKey:@"1"];
    [params setValue:@"15" forKey:@"_ROWNUM_"];
    [params setValue:@"1" forKey:@"NOWPAGE"];
    [MBProgressHUD showMessage:@"正在加载"];
    [ALNetWorkApi infoWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
        self.dataList = [NSMutableArray array];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in (NSArray *)responseData) {
            MessageModel *model = [MessageModel getEntityFromDic:dict];
            [temp addObject:model];
        }
        self.dataList = temp;
        [self.table reloadData];
        [self.table.header endRefreshing];
        [MBProgressHUD hideHUD];
    }];
}

//刷新视图
- (void)resetSubViews
{
    NSArray *arr = @[@"公司动态",@"公司通知"];
    self.top = [[topScrollView alloc]initWithTitles:arr];
    self.top.frame = CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64 - 50);
    self.top.delegate = self;
    self.top.content = self.table;
    
    self.table.frame = CGRectMake(0, -13, SIZEWIDTH, SIZEHEIGHT - 64 -44 - 50);

    [self.view addSubview:self.top];
}
#pragma mark - public api

#pragma mark - appleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    MessageModel *model = self.dataList[indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"messageCell"];
    }
    cell.textLabel.text = model.SERV_ID__NAME;
    cell.detailTextLabel.text = model.DATA_OWNER__NAME;
    
    return cell;
}

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
