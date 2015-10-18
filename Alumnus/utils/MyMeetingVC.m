//
//  MyMeetingVC.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyMeetingVC.h"
#import "topScrollView.h"
#import "MeetingBookVc.h"
#import "MeetingNoticeCellTableViewCell.h"
#import "MeetingManageCell.h"
#import "ALNetWorkApi.h"
#import "MyMeetingModel.h"
#import "MeetingAdd.h"

@interface MyMeetingVC()<topScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)topScrollView *top;
@property (nonatomic, strong)UITableView *noticeTabel;
@property (nonatomic, strong)UITableView *manageTabel;
@property (nonatomic, strong)MeetingBookVc *bookVc;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSArray *manageData;
@property (nonatomic, strong)UIView *bottom;
@property (nonatomic, strong)UIButton *search;
@end

@implementation MyMeetingVC

#pragma lazy
- (MeetingBookVc *)bookVc
{
    if (!_bookVc) {
        _bookVc = [[MeetingBookVc alloc]init];
    }
    
    return _bookVc;
}

- (topScrollView *)top
{
    if (!_top) {
        NSArray *arr = @[@"会议通知",@"会议管理",@"会议室预定"];
        _top = [[topScrollView alloc]initWithTitles:arr];
//        self.top = top;
        _top.delegate = self;

    }
    return _top;
}

- (UIView *)bottom
{
    if (!_bottom) {
        _bottom = [[UIView alloc]init];
        _bottom.backgroundColor = ALColor(19, 140, 80);
        UIButton *search = [UIButton buttonWithType:UIButtonTypeCustom];
        search.height = 50;
        search.width = SIZEWIDTH;
        [search setTitle:@"查看我预定的会议室" forState:UIControlStateNormal];
        [search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        search.backgroundColor = [UIColor clearColor];
        [search addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
        self.search = search;
        
        [_bottom addSubview:search];
        
        [self.view addSubview:_bottom];
    }
    return _bottom;
}

- (NSArray *)data
{
    NSArray *data = @[
                            @{@"type" : @"0",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"},
                            @{@"type" : @"1",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"},
                            @{@"type" : @"0",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"}
                            
                               ];
    

    return data;
}

- (NSArray *)manageData
{
    NSArray *manageData = @[
                      @{@"type" : @"0",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"},
                      @{@"type" : @"1",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"},
                      @{@"type" : @"0",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"},
                       @{@"type" : @"0",@"title":@"关于某业务总结会",@"subTitle":@"1015洽谈室  2015-02-01 16:00至2015-02-01 1"}
                      ];
    
    
    return manageData;
}




- (UITableView *)manageTabel
{
    if (!_manageTabel) {
        _manageTabel = [[UITableView alloc]init];
        _manageTabel.frame = CGRectMake(0, 0, SIZEWIDTH, SIZEHEIGHT - 64 -44);
        _manageTabel.delegate = self;
        _manageTabel.dataSource = self;
        _manageTabel.rowHeight = 80;
        _manageTabel.tableFooterView = [[UIView alloc]init];
    }
    return _manageTabel;
}

#pragma mark - lifeCycle
- (instancetype)initWithTitle:(NSString *)title
{
    MyMeetingVC *vc = [self init];
    vc.titleString = title;
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *addView = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH-50,20,40,40)];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addView addSubview:addButton];
    [addButton addTarget:self action:@selector(didClickAddData:) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:addView];

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
//    NSArray *arr = @[@"会议通知",@"会议管理",@"会议室预定"];
//    topScrollView *top = [[topScrollView alloc]initWithTitles:arr];
//    top.frame = CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64);
//    self.top = top;
//    top.delegate = self;
    self.top.frame = CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64 - 50);
    
    self.noticeTabel = [[UITableView alloc]init];
    self.noticeTabel.tableFooterView = [[UIView alloc]init];
    self.noticeTabel.delegate = self;
    self.noticeTabel.dataSource = self;
    self.noticeTabel.rowHeight = 70;
    [self.view addSubview:self.top];
    
    self.top.content = self.noticeTabel;

}

//获取数据
- (void)loadData
{
    //测试
    MyMeetingModel *model = [[MyMeetingModel alloc]init];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [ALNetWorkApi meetRemindWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
        if (success) {
            
        }else{
        
        }
    }];
    
}

//刷新视图
- (void)resetSubViews
{
    self.bottom.frame = CGRectMake(0, SIZEHEIGHT - 50, SIZEWIDTH, 50);
    self.noticeTabel.frame = CGRectMake(0, 44, SIZEWIDTH, SIZEHEIGHT - 64 -44 - 50);
    self.manageTabel.frame = CGRectMake(0, 44, SIZEWIDTH, SIZEHEIGHT - 64 -44 - 50);
    
//    self.bookVc.view.frame = CGRectMake(0, 44, SIZEWIDTH, SIZEHEIGHT - 64 -44);
}
#pragma mark - public api

#pragma mark - appleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.noticeTabel) {
        return 3;
    }else{
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.noticeTabel) {
       MeetingNoticeCellTableViewCell *cell = [MeetingNoticeCellTableViewCell cellWithTabelView:self.noticeTabel];
        cell.data = self.data[indexPath.row];
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
        MeetingManageCell *cell = [MeetingManageCell cellWithTabelView:self.manageTabel];
        cell.data = self.manageData[indexPath.row];
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - customDelegate
- (void)topScrollViewDidClickButtonIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
        {
            self.top.content = self.noticeTabel;
        }
            break;
        case 1:
        {
            self.top.content = self.manageTabel;
        }
            break;

        case 2:
        {
            self.top.contentVc = self.bookVc;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - action
- (void)search:(UIButton *)btn
{
    
}

- (void)didClickAddData:(UIButton *)btn
{
    MeetingAdd *vc = [[MeetingAdd alloc] init];
    vc.titleString = @"添加会议";
    [self presentViewController:vc animated:YES completion:nil];

}

#pragma mark - property



@end
