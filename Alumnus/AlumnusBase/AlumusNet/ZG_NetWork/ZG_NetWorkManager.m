//
//  ZG_NetWorkManager.m
//  Alumnus
//
//  Created by user on 15/8/31.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkManager.h"

@interface ZG_NetWorkManager ()
@property (nonatomic, strong)ZG_NetWorkBaseApi *baseApi;
@end

@implementation ZG_NetWorkManager
#pragma mark - public method
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)sendTicketApiWithBlock:(ZG_responseDataBlock)compelete
{

}

#pragma mark - property
- (ZG_NetWorkBaseApi *)baseApi
{
    
}
@end

