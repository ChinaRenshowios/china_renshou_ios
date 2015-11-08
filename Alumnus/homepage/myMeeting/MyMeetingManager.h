//
//  MyMeetingManager.h
//  Alumnus
//
//  Created by 王智刚 on 15/11/8.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseManager.h"
#import "ALSingleston.h"
#import "MyMeetingModel.h"
#import "MyMeetingManagerModel.h"
#import "MyMeetingFinddingModel.h"

@interface MyMeetingManager : ALBaseManager
ZGSingletonH(MyMeeting);

@property (nonatomic, strong)NSMutableArray *noticeModels;
@property (nonatomic, strong)NSMutableArray *manageModels;
@property (nonatomic, strong)NSMutableArray *findModels;

@end
