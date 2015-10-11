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
    //@"http://192.168.159.1:8081/mobileClient/PT_ORG_USER_MOBILE.mobileLogin.do"
    ALBaseApi *api = [[ALBaseApi alloc]init];
    //todo:配置api的一些默认配置默认的request是post
    api.requestMeth = ALRequestMethodPost;
    api.url = @"http://101.200.178.170/case_wwp/api";
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

+ (void)startPlaceList:(NSDictionary *)dic withResponse:(responseDataBlock)block
{
    ALBaseApi *api = [self buildBaseApi];
    api.bodyDic = dic;
    //根据确定请求方式
    api.requestMeth = ALRequestMethodPost;
    //确定每个接口的详细路径
    api.appendUrl = @"/user_refund_do.php";
    [api sendData:^(BOOL success, id responseData, NSString *message) {
        block(success,responseData,message);
    }];
}

@end
