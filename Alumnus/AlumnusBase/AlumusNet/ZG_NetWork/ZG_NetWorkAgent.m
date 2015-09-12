//
//  ZG_NetWorkAgent.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkAgent.h"
#import "ZG_NetWorkConfig.h"
#import "ZG_NetWorkPrivate.h"

@implementation ZG_NetWorkAgent
{
    AFHTTPRequestOperationManager *_manager;
    ZG_NetWorkConfig *_config;
    NSMutableDictionary *_requestsRecord;
}

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
        _config = [ZG_NetWorkConfig sharedInstance];
        _requestsRecord = [NSMutableDictionary dictionary];
        //请求队列最多数量,暂时不准备暴露,考虑到性能和交互体验,手机端线程应该少于5条
        _manager.operationQueue.maxConcurrentOperationCount = 4;
    }
    return self;
}

- (void)addRequest:(ZG_NetWorkBaseApi *)request
{
    ZG_RequsetMethod method = [request requestMethod];
    
    
}

- (void)cancelRequest:(ZG_NetWorkBaseApi *)request
{
    [request.requestOperation cancel];
    
}

- (void)cancelAllRequests
{

}

- (NSString *)buildRequestUrl:(ZG_NetWorkBaseApi *)request
{
    return nil;
}

#pragma mark - private method
- (NSString *)requestHashKey:(ZG_NetWorkHttpRequestOperation *)operation {
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
    return key;
}

- (void)removeOperation:(ZG_NetWorkHttpRequestOperation *)operation
{
    NSString *key = [self requestHashKey:operation];
    [_requestsRecord removeObjectForKey:key];
    ZGNetLog(@"Request queue size = %lu",(unsigned long)[_requestsRecord count]);
}
@end
