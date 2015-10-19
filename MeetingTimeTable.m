//
//  MeetingTimeTable.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MeetingTimeTable.h"
#import "CalendarView.h"

@interface MeetingTimeTable()<UITableViewDelegate,UITableViewDataSource,CalendarDataSource,CalendarDelegate>
{
@private
    NSMutableArray *_dataList;
}

@property (nonatomic, strong) CalendarView * customCalendarView;
@property (nonatomic, strong) NSCalendar * gregorian;
@property (nonatomic, assign) NSInteger currentYear;
@end

@implementation MeetingTimeTable

#pragma lazy

#pragma mark - lifeCycle
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        _dataList = [NSMutableArray array];
        self.tableFooterView = [[UIView alloc]init];
        
    }
    
    return self;
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

//格式化会议时间
- (NSString *)timeForMeeting
{
    return @"2015年2月11日 周三 上午";
}

#pragma mark - public api
//刷新视图
- (void)resetSubViews
{
    
}

#pragma mark - dataSource
//- (NSInteger)numberOfRowsInSection:(NSInteger)section
//{
//    return _dataList.count + 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return _dataList.count + 1;
    return 3;
}

#pragma mark - tableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //    if (indexPath.row == 0) {
    //        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"timeCell"];
    //        cell.textLabel.text = @"时间";
    //        cell.detailTextLabel.text = [self timeForMeeting];
    //    }else if (indexPath.row == 2){
    //
    //    }else
    
    switch (indexPath.row) {
        case 0:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"timeCell"];
            cell.textLabel.text = @"会议室";
            cell.detailTextLabel.text = @"105会议室";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 1:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
            _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            
            _customCalendarView                             = [[CalendarView alloc]initWithFrame:CGRectMake(0,10,SIZEWIDTH, 360)];
            _customCalendarView.delegate                    = self;
            _customCalendarView.datasource                  = self;
            _customCalendarView.calendarDate                = [NSDate date];
            _customCalendarView.allowsChangeMonthByButtons  = YES;
            _customCalendarView.borderColor                 = DOCK_BG_COLOR;
            _customCalendarView.borderWidth                 = 2;
            _customCalendarView.monthAndDayTextColor        = DOCK_BG_COLOR;
            _customCalendarView.dayTxtColorWithData         = DOCK_BG_COLOR;
            _customCalendarView.dayBgColorSelected          = DOCK_SELECT_COLOR;
            _customCalendarView.dayTxtColorWithoutData      = [UIColor blackColor];
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell addSubview:_customCalendarView];
                _customCalendarView.centerX = cell.centerX;
            });
            
            NSDateComponents * yearComponent = [_gregorian components:NSCalendarUnitYear fromDate:[NSDate date]];
            _currentYear = yearComponent.year;        }
            break;
        case 2:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
            UILabel *mTitle = [[UILabel alloc]init];
            mTitle.textColor = [UIColor orangeColor];
            mTitle.text = @"上午";
            [mTitle sizeToFit];
            mTitle.x = 20;
            mTitle.y = 8;
            [cell addSubview:mTitle];
            
            UILabel *mName = [[UILabel alloc]init];
            mName.font = [UIFont systemFontOfSize:13];
            mName.text = @"10:00~15:00 张先生[协调会]关于业务总结会";
            [mName sizeToFit];
            mName.x = mTitle.x;
            mName.y = CGRectGetMaxY(mTitle.frame) + 5;
            [cell addSubview:mName];
            
        }
            break;
            
            
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    switch (indexPath.row) {
        case 0:
        {
            height = 44;
        }
            break;
        case 1:
        {
            height = _customCalendarView.height + 30;
        }
            break;
        case 2:
        {
            height = 60;
        }
            break;
            
        default:
            break;
    }
    
    return height;
}

#pragma mark - CalendarDelegate protocol conformance

-(void)dayChangedToDate:(NSDate *)selectedDate
{
    NSLog(@"dayChangedToDate %@(GMT)",selectedDate);
}

#pragma mark - CalendarDataSource protocol conformance

-(BOOL)isDataForDate:(NSDate *)date
{
    if ([date compare:[NSDate date]] == NSOrderedAscending)
        return YES;
    return NO;
}

-(BOOL)canSwipeToDate:(NSDate *)date
{
    NSDateComponents * yearComponent = [_gregorian components:NSYearCalendarUnit fromDate:date];
    return (yearComponent.year == _currentYear || yearComponent.year == _currentYear+1);
}

#pragma mark - property
//- (void)setDataList:(NSArray *)dataList
//{
//    _dataList = dataList.mutableCopy;
//
//    if (_dataList.count) {
//        [self reloadData];
//    }
//}

@end
