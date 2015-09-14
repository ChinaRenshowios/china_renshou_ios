//
//  ZG_NetWorkBaseApi.m
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkBaseApi.h"
#import "ZG_NetWorkPrivate.h"
#import "ZG_NetWorkAgent.h"

@interface ZG_NetWorkBaseApi ()

@end

@implementation ZG_NetWorkBaseApi


#pragma mark - privat method


#pragma mark - public method
- (void)start
{
    [self toggleAccessoriesWillStartCallBack];
    [[ZG_NetWorkAgent sharedInstance] addRequest:self];

}

- (void)stop
{
    [self toggleAccessoriesWillStopCallBack];
    self.delegate = nil;
    [[ZG_NetWorkAgent sharedInstance] cancelRequest:self];
    [self toggleAccessoriesDidStopCallBack];
}

- (BOOL)isExecuting
{
    return self.requestOperation.isExecuting;
}

- (void)startWithSuccessBlock:(ZG_responseDataBlock)success
{
    self.successBlock = success;
    [self start];
}

- (void)startWithCompleteBlock:(ZG_responseDataBlock)completeBlock
{
    self.completeBlock = completeBlock;
    [self start];
}

- (void)clearRequestBlocks
{
    self.completeBlock = nil;
    self.successBlock = nil;
    self.allInfoBlock = nil;
}

- (id)responseJSONObject {
    return self.requestOperation.responseObject;
}

- (NSString *)responseString {
    return self.requestOperation.responseString;
}

- (NSInteger)responseStatusCode {
    return self.requestOperation.response.statusCode;
}

- (NSDictionary *)responseHeaders {
    return self.requestOperation.response.allHeaderFields;
}

/// for subclasses to overwrite
- (void)requestCompleteFilter{}

- (void)requestFailedFilter{}

- (BOOL)useCDN {
    return NO;
}

- (ZG_RequsetMethod)requestMethod
{
    return 0;
}

- (NSString *)requestBaseUrl
{
    return @"";
}

- (NSString *)requestUrl
{
    return @"";
}

- (NSString *)cdnUrl
{
    return @"";
}

- (id)requestArgument
{
    return nil;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60;
}

- (ZG_RequsetSerializerType)requestSerializerType
{
    return 0;
}


- (NSDictionary *)requestHeaderFieldValueDictionary
{
    return nil;
}

- (NSArray *)requestAuthorizationHeaderFieldArray
{
    return nil;
}

- (NSURLRequest *)buildCustomUrlRequest {
    return nil;
}

- (BOOL)statusCodeValidator
{
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)useCDN {
    return NO;
}

- (id)jsonValidator
{
    return nil;
}

#pragma mark - request accessory
- (void)addAccessory:(id<ZG_NetWorkBaseApiAccessory>)accessory
{
    if (!self.requestAccessories) {
        self.requestAccessories = [NSMutableArray array];
    }
    
    if (accessory) {
        [self.requestAccessories addObject:accessory];
    }
    
    //todo:考虑做容错acc数组记录未成功添加的acc,原因必是nil,输出一个记录:accAddFailArray
}

@end
