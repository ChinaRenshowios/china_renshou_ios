//
//  ALNetWorkApi.m
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ALNetWorkApi.h"
#import "ALBaseApi.h"

@implementation ALNetWorkApi
+ (ALBaseApi *)buildBaseApi
{
    ALBaseApi *api = [[ALBaseApi alloc]init];
    //todo:配置api的一些默认配置默认的request是post
    api.requestMeth = ALRequestMethodPost;
    api.url = @"http://192.168.159.1:8081/mobileClient/";
    api.header = [self header];
    return api;
}

+ (NSDictionary *)header
{
    NSDictionary *dic = [[NSDictionary alloc]init];
    //    [dic setValue:@"1"                                  forKey:@"channelId"];//"channelId": "渠道号，业务分配",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"deviceId"];//"deviceId": "设备号",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"authCode"];//"authCode": "权限代码",
    //    [dic setValue:@"1.0"                       forKey:@"version"];//"version": "版本号",
    //    [dic setValue:@"1"                                  forKey:@"clientType"];//"clientType": "设备类型",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"osVersion"];//"osVersion": "客户端操作系统版本，如android_4.4.2",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"language"];//"language": "多预言支持",
    //    [dic setValue:@"abcascascasc"                       forKey:@"referer"];//"referer": "H5会用，来源页面",
    //    [dic setValue:@"1"                                  forKey:@"browser"];//"browser": "H5会用，浏览器",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"clientIP"];//"clientIP": "客户端IP",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"operators"];//"operators": "操作者",
    //    [dic setValue:@"abcascascasc"                       forKey:@"network"];//"network": "网络类型，如chn-unicom;wifi",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"phoneType"];//"phoneType": "手机类型，android细分",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"screenSize"];//"screenSize": "屏幕尺寸，android细分",
    //    [dic setValue:[ELPublicMethods GUIDString]          forKey:@"guid"];//"guid": "唯一标识",
    //    [dic setValue:@"1"                                  forKey:@"deviceType"];//"deviceType": "设备类型，不传时自己内部转换",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"sessionToken"];//"sessionToken": "会话id,当有会话状态时传",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"CheckCode"];//"CheckCode": "检查码",
    //    [dic setValue:@"abcascascasc"                       forKey:@"traceId"];//"traceId": "一次请求的跟踪id",
    //    [dic setValue:@"22.22.22.22"                        forKey:@"UserTraceId"];//"UserTraceId": "用户多次请求跟踪id",
    //    [dic setValue:@"GZIP"                               forKey:@"Compress"];//"Compress": "是否压缩,默认为GZIP压缩"
    return dic;
}

+ (void)loginWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_ORG_USER_MOBILE.mobileLogin.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 系统管理员
 */
+ (void)getOdeptConfWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"MOBILE_INFOS_CONF.getOdeptConf.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 待办
 */
+ (void)toDoWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_TODO.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 待阅接口
 */
+ (void)toReadWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_TODO_READ.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 日程接口
 */
+ (void)calendarWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_COMM_CAL_V.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 会议通知接口
 */
+ (void)meetRemindWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_MEET_REMIND_MYSELF.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 会议管理接口
 */
+ (void)meetingManageWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径

    api.appendUrl = @"PT_MEETING.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 查找空闲时间会议室接口
 */
+ (void)findMeetingTimeRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_MEETINGROOM_APPLY.finds.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 查找空闲会议室接口
 */
+ (void)findMeetingRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_MEETINGROOM_APPLY.finds.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 会议室查询接口
 */
+ (void)meetingRoomWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_MEETINGROOM.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 我的日程接口
 */
+ (void)myCalendarWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_CAL_REC_V.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 我接收的任务接口
 */
+ (void)myJobWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_RENWU_JOIN.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 我发起的任务接口
 */
+ (void)jobSendFromMeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_RENWU.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}


/*
 我的团队接口
 */
+ (void)myTeamWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_GROUP_INFO.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 其他团队接口
 */
+ (void)theOtherTeamWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_GROUP_INFO_OTHER.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 通讯录,当前机构及下属一级机构接口
 */
+ (void)mobileDeptWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"MOBILE_SY_ORG_DEPT.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 当前部门下的一级部门接口
 */
+ (void)mobileThisDeptWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"MOBILE_SY_ORG_DEPT.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 当前部门下的人员接口
 */
+ (void)mobileUsersWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"MOBILE_SY_ORG_USER.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 我的收藏
 A.知识中心接口
 */
+ (void)knowledgeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_FAVORITES_MARK_ZHISHI.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 B.信息中心
 */
+ (void)infoWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_FAVORITES_MARK_INFO.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 知识中心
 文档中心
 我上传的文档
 */
+ (void)myDocumentWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_WENKU_MYDOCUMENT.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 热门文档
 */
+ (void)hotWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_WENKU_READ_DOCUMENT.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 最新文档
 */
+ (void)followWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_WENKU_NEW_DOCUMENT.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 问答中心：
 我提出的问题
 */
+ (void)zhidaoUserWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_ZHIDAO_USER.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 我关注的问题：
 */
//+ (void)allQuestionsWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block;
/*
 全部问题：
 */
+ (void)allQuestionsWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_ZHIDAO_ALL_QUESTION.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 请我来回复的问题:：
 */
+ (void)inviteMeWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_ZHIDAO_INVITE_V.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 备忘录:
 */
+ (void)myUnforgetWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"SY_COMM_MEMO_PAD.finds.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

@end
