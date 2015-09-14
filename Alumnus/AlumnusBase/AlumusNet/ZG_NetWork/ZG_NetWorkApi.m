//
//  ZG_NetWorkApi.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkApi.h"

@implementation ZG_NetWorkApi

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - overWrite
- (NSString *)requestUrl
{
    return self.requestUrl;
}

- (NSString *)requestBaseUrl
{
    return self.requestBaseUrl;
}

@end
