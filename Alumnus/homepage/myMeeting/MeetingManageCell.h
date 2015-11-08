//
//  MeetingManageCell.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMeetingManagerModel.h"

@interface MeetingManageCell : UITableViewCell
@property (nonatomic, strong)MyMeetingManagerModel *model;
+ (instancetype)cellWithTabelView:(UITableView *)tableView;

@end
