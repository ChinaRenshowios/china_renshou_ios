//
//  MeetingBookVc.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MeetingBookVc.h"
#import "MeetingRoomTable.h"
#import "MeetingTimeTable.h"
#import "ALNetWorkApi.h"
#import "MyMeetingManager.h"
#import "MBProgressHUD+MJ.h"
#import "MJRefresh.h"


#define timeTag 1
#define roomTag (timeTag + 1)
#define searchTag (timeTag + 2)

@interface MeetingBookVc ()<UITableViewDataSource
,UITableViewDelegate>
@property (nonatomic, strong)UIButton *selectBtn;
@property (nonatomic, strong)ALBaseTable *content;
@property (nonatomic, strong)MeetingTimeTable *timeTable;
@property (nonatomic, strong)MeetingRoomTable *roomTable;
@property (nonatomic, strong)MyMeetingManager *manager;

@property (nonatomic, strong)UIView *seg;
@end

@implementation MeetingBookVc

#pragma lazy

- (MyMeetingManager *)manager
{
    if (!_manager) {
        _manager = [MyMeetingManager sharedMyMeeting];
    }
    return _manager;
}

- (UITableView *)timeTable
{
    if (!_timeTable) {
        _timeTable = [[MeetingTimeTable alloc]init];
        _timeTable.header =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadData];
            NSLog(@"刷新数据");
        }];
        
        _timeTable.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadData];
        }];
    }
    return _timeTable;
}

- (UITableView *)roomTable
{
    if (!_roomTable) {
        _roomTable = [[MeetingRoomTable alloc]init];
        _roomTable.header =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            NSLog(@"刷新数据");
        }];
        
        _roomTable.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadData];
        }];


    }
    return _roomTable;
}

#pragma mark - lifeCycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.frame = CGRectMake(0, 44, SIZEWIDTH, SIZEHEIGHT - 64 -44 -50);
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

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
    UIView *seg = [[UIView alloc]init];
    seg.frame = CGRectMake(0, 10, self.view.width,44);
    seg.backgroundColor = ALColor(19, 140, 80);
    [self.view addSubview:seg];
    
    UIButton *time = [self segButtonWithName:@"找空闲时间"];
    time.x = 0;
    time.tag = timeTag;
    [seg addSubview:time];
    [self btnClick:time];
    
    UIButton *room = [self segButtonWithName:@"找空闲会议室"];
    room.x = time.width;
    room.tag = roomTag;
    [seg addSubview:room];
    self.seg = seg;
    
    UIButton *searchMyMeeting = [UIButton buttonWithType:UIButtonTypeCustom];
    searchMyMeeting.frame = CGRectMake(0, self.view.height - 44, SIZEWIDTH, 44);
    searchMyMeeting.tag = searchTag;
    [searchMyMeeting addTarget:searchMyMeeting action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchMyMeeting];
    
}

- (UIButton *)segButtonWithName:(NSString *)name
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
    [btn setBackgroundImage:nil forState:UIControlStateNormal];
    btn.height = 44;
    btn.width = SIZEWIDTH * 0.5;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnClick:(UIButton *)btn
{
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    switch (btn.tag) {
        case timeTag:
        {
            self.content = self.timeTable;
        }
            break;
        case roomTag:
        {
            self.content = self.roomTable;
        }
            break;

        case searchTag:
        {
            
        }
            break;

            
        default:
            break;
    }
    
    [self loadData];
    [self.content reloadData];

}

//获取数据
- (void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [params setValue:@"true" forKey:@"_IS_DES_"];
    [params setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [params setValue:@"15" forKey:@"_ROWNUM_"];
    [params setValue:@"1" forKey:@"NOWPAGE"];
    [params setValue:@"AND S_FLAG = 1 and S_ODEPT like '3rin6giCR9vUIv6kHIO3ex' and （apy_starttime like '2015-09-16%' or apy_endtime like '2015-09-16%' or (apy_starttime < '2015-09-16' and apy_endtime > '2015-09-16'))" forKey:@"_WHERE_"];
    
    if (self.content == self.timeTable) {
        [MBProgressHUD showMessage:@"正在加载"];

        [ALNetWorkApi findMeetingTimeRoomWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
            self.manager.findModels = [NSMutableArray array];
            for (id value in (NSArray *)responseData) {
                [self.manager.findModels addObject:[MyMeetingFinddingModel getEntityFromDic:value]];
            }
            [self.timeTable reloadData];
            [self.timeTable.footer endRefreshing];
            [self.timeTable.header endRefreshing];
            
            [MBProgressHUD hideHUD];

        }];

    }else if (self.content == self.roomTable){
        [MBProgressHUD showMessage:@"正在加载"];

        [ALNetWorkApi findMeetingRoomWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
            self.manager.findModels = [NSMutableArray array];
            for (id value in (NSArray *)responseData) {
                [self.manager.findModels addObject:[MyMeetingFinddingModel getEntityFromDic:value]];
            }
            
            [self.roomTable reloadData];
            [self.roomTable.footer endRefreshing];
            [self.roomTable.header endRefreshing];
            
            [MBProgressHUD hideHUD];

        }];


    }
}

//刷新视图
- (void)resetSubViews
{
    self.content.frame = CGRectMake(0, CGRectGetMaxY(self.seg.frame) + 3, SIZEWIDTH, self.view.height - CGRectGetMaxY(self.seg.frame) - 3);
}

#pragma mark - public api

#pragma mark - appleDelegate

#pragma mark - customDelegate

#pragma mark - property
- (void)setContent:(UIView *)content
{
    if (_content == content) {
        [_content removeFromSuperview];
    }
    _content = content;
    [self.view addSubview:_content];
    
   }
@end
