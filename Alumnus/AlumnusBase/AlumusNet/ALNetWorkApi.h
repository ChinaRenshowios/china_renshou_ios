//
//  ALNetWorkApi.h
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//  人寿Api:统一管理所有接口的网络请求

#import "ALBaseApi.h"

@interface ALNetWorkApi : NSObject

/*
 登陆接口
 */
+ (void)loginWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 系统管理员
 */
+ (void)getOdeptConfWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 待办
 */
+ (void)toDoWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 待阅接口
 */
+ (void)toReadWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 日程接口
 */
+ (void)calendarWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 会议通知接口
 */
+ (void)meetRemindWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 会议管理接口
 */
+ (void)meetingManageWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 查找空闲时间会议室接口
 */
+ (void)findMeetingTimeRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 查找空闲会议室接口
 */
+ (void)findMeetingRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 会议室查询接口
 */
+ (void)meetingRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 我的日程接口
 */
+ (void)myCalendarWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 我接收的任务接口
 */
+ (void)myJobWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 我发起的任务接口
 */
+ (void)jobSendFromMeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;

/*
 我的团队接口
 */
+ (void)myTeamWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 其他团队接口
 */
+ (void)theOtherTeamWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 通讯录,当前机构及下属一级机构接口
 */
+ (void)mobileDeptWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 当前部门下的一级部门接口
 */
+ (void)mobileThisDeptWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 当前部门下的人员接口
 */
+ (void)mobileUsersWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 我的收藏
 A.知识中心接口
 */
+ (void)knowledgeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 B.信息中心
 */
+ (void)infoWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 知识中心
 文档中心
 我上传的文档
 */
+ (void)myDocumentWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 热门文档
 */
+ (void)hotWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 最新文档
 */
+ (void)followWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 问答中心：
 我提出的问题
 */
+ (void)zhidaoUserWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
我关注的问题：
 */
//+ (void)allQuestionsWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 全部问题：
 */
+ (void)allQuestionsWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 请我来回复的问题:：
 */
+ (void)inviteMeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;




@end
