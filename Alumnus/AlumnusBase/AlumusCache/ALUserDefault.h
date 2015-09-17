//
//  ALUserDefault.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALUserDefault :NSObject
/**
 *  存储字符串,比如账号密码
 */
+ (void)setValue:(NSString *)value forKey:(NSString *)key;
/**
 *  存储开关的状态
 */
+ (void)setSWitch:(BOOL)switchOn forKey:(NSString *)key;
/**
 *  开关的状态
 */
+ (BOOL)switchForKey:(NSString *)key;
/**
 *  字符串
 */
+ (NSString *)valueForKey:(NSString *)key;
/**
 *  清空userdefault
 */
+ (void)clearUserDefault;
@end
