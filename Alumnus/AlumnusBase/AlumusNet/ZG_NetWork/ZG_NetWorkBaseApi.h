//
//  ZG_NetWorkBaseApi.h
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//  网络层的抽象层,抽离基础属性和基类方法(部分基类方法是抽象方法,需实现累重写)

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ZG_NetWorkHttpRequestOperation.h"

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

/**
 *  失败处理的block,除非需要做失败处理,一般不会用,扩展功能
 *  @param success         请求是否成功
 *  @param responseMessage 服务器返回信息(例如:errorMessage)
 */
typedef void(^ZG_responseFailBlock)(NSString *responseMessage);

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
//请求过程监听,aop的意义
@protocol ZG_NetWorkBaseApiAccessory <NSObject>
- (void)requestWillStart:(ZG_NetWorkBaseApi *)request;
- (void)requestWillStop:(ZG_NetWorkBaseApi *)request;
- (void)requestDidStop:(ZG_NetWorkBaseApi *)request;

@end

@interface ZG_NetWorkBaseApi : NSObject

/**
 *  扩展功能使用,区分标记某条请求...
 */
@property (nonatomic ,assign)NSInteger tag;

@property (nonatomic, strong) ZG_NetWorkHttpRequestOperation *requestOperation;
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
/**
 *  完成回调
 */
@property (nonatomic, copy)ZG_responseDataBlock completeBlock;
/**
 *  成功回调
 */
@property (nonatomic, copy)ZG_responseSuccessBlock successBlock;
/**
 *  失败回调
 */
@property (nonatomic, copy)ZG_responseFailBlock failBlock;
/**
 *  需切面处理请求数组
 */
@property (nonatomic, strong) NSMutableArray *requestAccessories;

/// append self to request queue
- (void)start;
/// remove self from request queue
- (void)stop;

/**
 *  是否正在请求,todo:需要request中的operation中的详细配置
 */
//- (BOOL)isExecuting;

/**
 *  有返回数据的请求回调
 */
- (void)startWithCompletionBlockWithSuccess:(ZG_responseDataBlock)success;
/**
 *  返回结果的请求回调
 */
- (void)startWithCompleteBlock:(ZG_responseDataBlock)completeBlock;
/**
 *  清除网络回调,避免强引用控制器
 */
- (void)clearRequestBlocks;
/**
 * 监听请求切面:start,stop
 */
- (void)addAccessory:(id<ZG_NetWorkBaseApiAccessory>)accessory;

/*
 todo:暂时没有必要专门处理失败回调,扩展处理
 */

/// 以下方法由子类继承来覆盖默认值
/**
 *  请求成功回调
 */
- (void)requestSuccessedHandler;
/**
 *  请求失败回调
 */
- (void)requestCompeleteHandler;
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
/**
 *  请求解析方式
 */
- (ZG_RequsetSerializerType)requestSerializerType;
/**
 *  http头添加自定义参数
 */
- (NSDictionary *)requestHeaderFieldValueDictionary;
/**
 *  请求的Server用户名和密码
 */
- (NSArray *)requestAuthorizationHeaderFieldArray;

//todo:cache相关的一些

//todo:自定义urlRequest



@end
