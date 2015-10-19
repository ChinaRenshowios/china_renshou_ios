//
//  MeetingRoomTable.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MeetingRoomTable.h"

@interface MeetingRoomTable()
{
    @private
    NSMutableArray *_dataList;
}

@end

@implementation MeetingRoomTable
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
            cell.textLabel.text = @"时间";
            cell.detailTextLabel.text = [self timeForMeeting];
             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 1:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
            UILabel *mTitle = [[UILabel alloc]init];
            mTitle.textColor = [UIColor orangeColor];
            mTitle.text = @"完全空闲会议室";
            [mTitle sizeToFit];
            mTitle.x = 20;
            mTitle.y = 8;
            [cell addSubview:mTitle];
            
            UILabel *mName = [[UILabel alloc]init];
            mName.font = [UIFont systemFontOfSize:13];
            mName.text = @"1620洽谈室  1670VIP会议室";
            [mName sizeToFit];
            mName.x = mTitle.x;
            mName.y = CGRectGetMaxY(mTitle.frame) + 5;
            [cell addSubview:mName];
        }
            break;
        case 2:
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
            UILabel *mTitle = [[UILabel alloc]init];
            mTitle.textColor = [UIColor orangeColor];
            mTitle.text = @"部分空闲会议室";
            [mTitle sizeToFit];
            mTitle.x = 20;
            mTitle.y = 8;
            [cell addSubview:mTitle];
            
            UILabel *mName = [[UILabel alloc]init];
            mName.font = [UIFont systemFontOfSize:13];
            mName.text = @"1620洽谈室";
            [mName sizeToFit];
            mName.x = mTitle.x;
            mName.y = CGRectGetMaxY(mTitle.frame) + 5;
            [cell addSubview:mName];
            
            UILabel *time = [[UILabel alloc]init];
            time.font = [UIFont systemFontOfSize:11];
            time.text = @"2015年2月11日 周三 上午";
            time.textColor = [UIColor grayColor];
            [time sizeToFit];
            time.x = mTitle.x;
            time.y = CGRectGetMaxY(mName.frame) + 5;
            [cell addSubview:time];
            
            UILabel *people = [[UILabel alloc]init];
            people.font = [UIFont systemFontOfSize:13];
            people.text = @"张先生[协调会]关于某合作洽谈";
            [people sizeToFit];
            people.x = mTitle.x;
            people.y = CGRectGetMaxY(time.frame) + 2;
            [cell addSubview:people];
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
            height = 60;
        }
            break;
        case 2:
        {
            height = 95;
        }
            break;
            
        default:
            break;
    }
    
    return height;
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
