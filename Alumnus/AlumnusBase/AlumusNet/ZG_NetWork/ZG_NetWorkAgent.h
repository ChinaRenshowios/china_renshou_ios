//
//  ZG_NetWorkAgent.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//  请求方式实现的地方,隔离层的核心,更换三方库的请求方式

#import <Foundation/Foundation.h>
#import "ZG_NetWorkBaseApi.h"
#import "AFNetworking.h"
 
@interface ZG_NetWorkAgent : NSObject

+ (instancetype)sharedInstance;

- (void)addRequest:(ZG_NetWorkBaseApi *)request;

- (void)cancelRequest:(ZG_NetWorkBaseApi *)request;

- (void)cancelAllRequests;

//根据request和networkConfig构建url
- (NSString *)buildRequestUrl:(ZG_NetWorkBaseApi *)request;

@end
