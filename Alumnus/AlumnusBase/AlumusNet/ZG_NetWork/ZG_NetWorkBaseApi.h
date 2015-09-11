//
//  ZG_NetWorkBaseApi.h
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//  网络层的抽象层,抽离基础属性和基类方法(部分基类方法是抽象方法,需实现累重写)

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, ZG_RequsetMethod) {
    ZG_RequsetMethodGet = 0,
    ZG_RequsetMethodPost,
    ZG_RequsetMethodPut,
    ZG_RequsetMethodHead,
    ZG_RequsetMethodPatch,
    ZG_RequsetMethodDelete
};//网络请求方式

typedef NS_ENUM(NSInteger, ZG_RequsetSerializerType) {
    ZG_RequsetSerializerTypeHTTP = 0,
    ZG_RequsetSerializerTypeJson
};//回包解析方式

/**
 *  主要用在post请求,有数据返回
 *  @param success         请求是否成功
 *  @param responseData    响应体(返回的数据)
 *  @param responseMessage 服务器返回信息(例如:errorMessage)
 */
typedef void(^ZG_responseDataBlock)(BOOL success,id responseData,NSString *responseMessage);

/**
 *  主要用在get请求,无数据返回
 *  @param success         请求是否成功
 *  @param responseMessage 服务器返回信息(例如:errorMessage)
 */
typedef void(^ZG_responseSuccessBlock)(BOOL success,NSString *responseMessage);

/*
 todo:后面根据请求可以扩充回包处理的block,比如需要监听进度的请求和富文本的请求
 */

#pragma mark 代理相关

@class ZG_NetWorkBaseApi;
//请求结果的处理
@protocol ZG_NetWorkBaseApiDelegate <NSObject>
- (void)reuqestFinished:(ZG_NetWorkBaseApi *)request;
- (void)reuqestFailed:(ZG_NetWorkBaseApi *)request;

@optional
//清除请求
- (void)clearRequest;
@end
//请求过程监听
@protocol ZG_NetWorkBaseApiAccessory <NSObject>
- (void)reuqestWillStart:(ZG_NetWorkBaseApi *)request;
- (void)reuqestWillStop:(ZG_NetWorkBaseApi *)request;
- (void)reuqestDidStop:(ZG_NetWorkBaseApi *)request;

@end

@interface ZG_NetWorkBaseApi : NSObject

/**
 *  扩展功能使用,区分标记某条请求...
 */
@property (nonatomic ,assign)NSInteger tag;
/**
 *  数据传递容器
 */
@property (nonatomic, strong)NSDictionary *usrInfo;
/**
 *  服务器返回状态码
 */
@property (nonatomic, readonly) NSInteger responseStatusCode;
/**
 *  服务器返回信息
 */
@property (nonatomic , copy,readonly)NSString *responseMessage;
/**
 *  服务器返回数据
 */
@property (nonatomic, strong,readonly)id responseJSONObject;
/**
 *  服务器返回响应头
 */
@property (nonatomic, strong, readonly)NSDictionary *responseHeaders;

/// 以下方法由子类继承来覆盖默认值
/**
 *  请求成功回调
 */
- (void)requestSuccessedHandler;
/**
 *  请求失败回调
 */
- (void)requestFailedHandler;
/**
 *  请求方法:post,get...
 */
- (ZG_RequsetMethod)requestMethod;
/**
 *  请求的baseUrl
 */
- (NSString *)requestBaseUrl;
/**
 *  请求的url
 */
- (NSString *)requestUrl;
/**
 *  请求的CdnURL:资源加载优化可能使用到..
 */
- (NSString *)cdnUrl;
/**
 *  请求参数
 */
- (id)requestArgument;




@end
