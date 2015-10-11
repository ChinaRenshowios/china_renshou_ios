//
//  ALBaseModel.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"
#import "NSObject+MJKeyValue.h"

@implementation ALBaseModel

+ (instancetype)getEntityFromDic:(NSDictionary *)dic
{
    id object = nil;
    @try {
        object = [self objectWithKeyValues:dic
                  ];
    }
    @catch (NSException *exception) {
        NSAssert1(object, @"Exception=%@", exception.reason);
    }
    return object;
}


- (NSDictionary *)getDicFromEntity
{
    NSDictionary *dic = nil;
    @try {
        dic = (NSDictionary *)[self keyValues];
    }
    @catch (NSException *exception) {
        NSAssert1(dic, @"Exception=%@", exception.reason);
    }
    @finally {
    }
    return dic;
}

@end
