//
//  ZG_NetWorkBaseApi.h
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
//#import "AFDownloadRequestOperation.h"

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
 *  <#Description#>
 */
//@property (nonatomic, strong)AFHTTPRequestOperxation.h *requestOperation;



@end
