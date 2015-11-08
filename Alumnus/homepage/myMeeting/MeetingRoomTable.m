//
//  MeetingRoomTable.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//



#import "MeetingRoomTable.h"
#import "MyMeetingManager.h"

@interface MeetingRoomTable()
@property (nonatomic, strong)MyMeetingManager *manager;


@end

@implementation MeetingRoomTable
- (MyMeetingManager *)manager
{
    if (!_manager) {
        _manager = [MyMeetingManager sharedMyMeeting];
    }
    
    return _manager;
}


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.dataSource = self;
        self.delegate = self;
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
    return self.manager.findModels.count;
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
    MyMeetingFinddingModel *model = self.manager.findModels[indexPath.row];
//    switch (indexPath.row) {
//        case 0:
//        {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"timeCell"];
//            cell.textLabel.text = @"时间";
//            cell.detailTextLabel.text = model.S_MTIME;
//             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        }
//            break;
//        case 1:
//        {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
//            UILabel *mTitle = [[UILabel alloc]init];
//            mTitle.textColor = [UIColor orangeColor];
//            [mTitle sizeToFit];
//            mTitle.x = 20;
//            mTitle.y = 8;
//            [cell addSubview:mTitle];
//            
//            UILabel *mName = [[UILabel alloc]init];
//            mName.font = [UIFont systemFontOfSize:13];
//            [mName sizeToFit];
//            mName.x = mTitle.x;
//            mName.y = CGRectGetMaxY(mTitle.frame) + 5;
//            [cell addSubview:mName];
//        }
//            break;
//        case 2:
//        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"meetingCell1"];
            UILabel *mTitle = [[UILabel alloc]init];
            mTitle.textColor = [UIColor orangeColor];
            mTitle.text = model.APY_DEPT;
            [mTitle sizeToFit];
            mTitle.x = 20;
            mTitle.y = 8;
            [cell addSubview:mTitle];
            
            UILabel *mName = [[UILabel alloc]init];
            mName.font = [UIFont systemFontOfSize:13];
            mName.text = model.APY_MEETING_ROOM;
            [mName sizeToFit];
            mName.x = mTitle.x;
            mName.y = CGRectGetMaxY(mTitle.frame) + 5;
            [cell addSubview:mName];
            
            UILabel *time = [[UILabel alloc]init];
            time.font = [UIFont systemFontOfSize:11];
            time.text =  model.S_MTIME;
            time.textColor = [UIColor grayColor];
            [time sizeToFit];
            time.x = mTitle.x;
            time.y = CGRectGetMaxY(mName.frame) + 5;
            [cell addSubview:time];
            
            UILabel *people = [[UILabel alloc]init];
            people.font = [UIFont systemFontOfSize:13];
            people.text = model.REMARK;
            [people sizeToFit];
            people.x = mTitle.x;
            people.y = CGRectGetMaxY(time.frame) + 2;
            [cell addSubview:people];
//        }
//            break;
//            
//            
//            
//        default:
//            break;
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
//    switch (indexPath.row) {
//        case 0:
//        {
//            height = 44;
//        }
//            break;
//        case 1:
//        {
//            height = 60;
//        }
//            break;
//        case 2:
//        {
            height = 95;
//        }
//            break;
//            
//        default:
//            break;
//    }
    
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
