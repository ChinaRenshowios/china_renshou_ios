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

- (NSString *)buildRequestUrl:(ZG_NetWorkBaseApi *)request
{
    NSString *defaultUrl = [request requestUrl];
    
    if ([defaultUrl hasPrefix:@"http"]) {
        return defaultUrl;
    }
    
    NSArray *filters = [_config urlFilters];
    for (id<ZG_NetWorkUrlFilterProtocol> filter in filters) {
        defaultUrl = [filter filterUrl:defaultUrl withRequest:request];
    }
    
    NSString *baseUrl;
    
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            baseUrl = [request cdnUrl];
        } else {
            baseUrl = [_config cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            baseUrl = [request baseUrl];
        } else {
            baseUrl = [_config baseUrl];
        }
    }
    
    return [NSString stringWithFormat:@"%@%@",baseUrl,defaultUrl];
}

- (void)addRequest:(ZG_NetWorkBaseApi *)request
{
    ZG_RequsetMethod method = [request requestMethod];
    NSString *url = [self buildRequestUrl:request];
    
    id param = [request requestArgument];
    
    if(request.requestSerializerType == ZG_RequsetSerializerTypeHTTP){
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else if(request.requestSerializerType == ZG_RequsetSerializerTypeJson){
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    //todo:断点续传需要设置AFConstructingBlock
    
    // api需要服务器用户名和密码
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    
    NSArray *authorizationHeaderFieldArray = [request requestArgument];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject password:(NSString *)authorizationHeaderFieldArray.lastObject]
    }
    
    //需要配置http头内的信息
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if (httpHeaderField isKindOfClass:[NSString class] && && [va isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }else{
                ZGNetLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    //自定义urlrequest
    NSURLRequest *customUrlRequest= [request buildCustomUrlRequest];
    if (customUrlRequest) {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:customUrlRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self handleRequestResult:operation];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self handleRequestResult:operation];
        }];
        request.requestOperation = operation;
        operation.responseSerializer = _manager.responseSerializer;
        [_manager.operationQueue addOperation:operation];
    }else{
    
    }
    
    [self addOperation:request];
}

- (void)cancelRequest:(ZG_NetWorkBaseApi *)request
{
    [request.requestOperation cancel];
    [self removeOperation:request.requestOperation];
    [request clearRequestBlocks];
}

- (void)cancelAllRequests
{
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        ZG_NetWorkBaseApi *api = copyRecord[i];
        [api stop]
        ;
    }
}

#pragma mark - private method
- (void)addOperation:(ZG_NetWorkBaseApi *)request
{
    if (request.requestOperation != nil) {
        NSString *key = [self requestHashKey:request.requestOperation];
        @synchronized(self) {
            _requestsRecord[key] = request;
        }
    }
}

- (void)handleRequestResult:(AFHTTPRequestOperation *)operation
{
    NSString *key = [self  requestHashKey:operation];
    ZG_NetWorkBaseApi *request = _requestsRecord[key];
    ZGNetLog(@"Finished Request: %@", NSStringFromClass([request class]));
    if (request) {
        BOOL success = [self checkResult:request];
        if (success) {
            [request toggleAccessoriesWillStopCallBack];
            [request requestCompleteFilter];
            if (request.delegate != nil) {
                if ([request.delegate respondsToSelector:@selector(reuqestFinished:)]) {
                    [request.delegate reuqestFinished:request];
                }
                
                if (request.completeBlock) {
                    request.completeBlock(success,request.responseJSONObject,request.responseMessage);
                }
                
                if (request.successBlock) {
                    request.successBlock(success,request.responseMessage);
                }
                
                if (request.allInfoBlock) {
                    request.allInfoBlock(request);
                }
                
            }
            [request toggleAccessoriesDidStopCallBack];
        } else {
            ZGNetLog(@"Request %@ failed, status code = %ld",
                     NSStringFromClass([request class]), (long)request.responseStatusCode);
            [request toggleAccessoriesWillStopCallBack];
            [request requestFailedFilter];
            if (request.failBlock) {
                request.failBlock(request);
            }
            [request toggleAccessoriesDidStopCallBack];
        }
    }
    
    [self removeOperation:operation];
    [request clearRequestBlocks];
}

- (BOOL)checkResult:(ZG_NetWorkBaseApi *)request
{
    BOOL result = [request statusCodeValidator];
    if (!result) {
        return result;
    }
    id validator = [request jsonValidator];
    if (validator != nil) {
        id json = [request responseJSONObject];
        result = [ZG_NetWorkPrivate checkJson:json withValidator:validator];
    }
    return result;
}

- (NSString *)requestHashKey:(ZG_NetWorkHttpRequestOperation *)operation
{
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
