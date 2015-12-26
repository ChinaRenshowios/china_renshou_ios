//
//  ALNetWorkApi.m
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ALNetWorkApi.h"
#import "ALBaseApi.h"
#import "MyMissionResponseModel.h"

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
        NSDictionary *resdic = responseData;
        MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:resdic];
        block(success,model._DATA_,message);
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
        NSDictionary *resdic = responseData;
        MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:resdic];
        block(success,model._DATA_,message);
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
        NSDictionary *resdic = responseData;
        MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:resdic];
        block(success,model._DATA_,message);
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
        NSDictionary *resdic = responseData;
        MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:resdic];
        block(success,model._DATA_,message);
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
        NSDictionary *resdic = responseData;
        MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:resdic];
        NSLog(@"%@",model._MSG_);
        if ([model._MOBILE_RES_CODE_ isEqual:@"_SUCC_"]) {
            NSLog(@"%d",model._DATA_.count);
            block(success,model._DATA_,message);
        }
        else{
            NSLog(@"%@",model._MSG_);
        }

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
    api.appendUrl = @"SY_COMM_ZHIDAO_MYASK.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

/*
 我关注的问题：
 */
+ (void)myConcernQuestionsWithDict:(NSDictionary *)dic withResponse:(responseDataBlock)block{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"PT_ZHIDAO_MY_QUESTION_FOLLOW.query.do";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}
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
