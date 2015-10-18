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

#define timeTag 1
#define roomTag (timeTag + 1)
#define searchTag (timeTag + 2)

@interface MeetingBookVc ()
@property (nonatomic, strong)UIButton *selectBtn;
@property (nonatomic, strong)UIView *content;
@property (nonatomic, strong)MeetingTimeTable *timeTable;
@property (nonatomic, strong)MeetingRoomTable *roomTable;
@property (nonatomic, strong)UIView *seg;
@end

@implementation MeetingBookVc

#pragma lazy
- (UITableView *)timeTable
{
    if (!_timeTable) {
        _timeTable = [[MeetingTimeTable alloc]init];
    }
    return _timeTable;
}

- (UITableView *)roomTable
{
    if (!_roomTable) {
        _roomTable = [[MeetingRoomTable alloc]init];
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
            self.timeTable.dataList =
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

}

//获取数据
- (void)loadData
{
    
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
