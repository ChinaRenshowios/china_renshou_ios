//
//  ALUserDefault.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALUserDefault.h"

#define userDefault [NSUserDefaults standardUserDefaults]
@interface ALUserDefault()
@end

@implementation ALUserDefault

+ (void)setValue:(NSString *)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSString class]] && [key isKindOfClass:[NSString class]]) {
        [userDefault setObject:value forKey:key];
        [userDefault synchronize];
    }else{
        ALLog(@"userDefault存储字段不符合标准,不是字符串");
    }
}

+ (void)setSWitch:(BOOL)switchOn forKey:(NSString *)key
{
    if (switchOn == 0 || switchOn == 1) {
        if ([key isKindOfClass:[NSString class]]) {
            [userDefault setObject:@(switchOn) forKey:key];
            [userDefault synchronize];
        }else{
            ALLog(@"userDefault存储字段不符合标准,key不是字符串");
        }
    }else{
        ALLog(@"userDefault存储字段不符合标准,swich不是bool值");
    }
}

+ (BOOL)switchForKey:(NSString *)key
{
    return [userDefault boolForKey:key];
}

+ (NSString *)valueForKey:(NSString *)key
{
    return [userDefault stringForKey:key] ? [userDefault stringForKey:key]  : @"";
}

+ (void)clearUserDefault
{
    [NSUserDefaults resetStandardUserDefaults];
}

@end
