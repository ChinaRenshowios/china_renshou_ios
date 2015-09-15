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
 事例接口
 */
+ (void)startPlaceList:(NSDictionary *)dic withResponse:(responseDataBlock)block;


@end
