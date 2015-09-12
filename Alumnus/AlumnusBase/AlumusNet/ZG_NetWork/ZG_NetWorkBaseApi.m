//
//  ZG_NetWorkBaseApi.m
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkBaseApi.h"

@interface ZG_NetWorkBaseApi ()

@end

@implementation ZG_NetWorkBaseApi


#pragma mark - privat method


#pragma mark - public method
- (void)start
{
    
}

- (void)stop
{
    
}

//- (BOOL)isExecuting
//{
//
//}

- (void)startWithCompletionBlockWithSuccess:(ZG_responseDataBlock)success
{
    
}

- (void)startWithCompleteBlock:(ZG_responseDataBlock)completeBlock
{
    
}

- (void)clearRequestBlocks
{
    
}

/// for subclasses to overwrite
- (void)requestSuccessedHandler{}

- (void)requestCompeleteHandler{}

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
