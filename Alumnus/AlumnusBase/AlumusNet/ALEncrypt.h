//
//  ALEncrypt.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/11.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALEncrypt : NSObject
/**
 *  AES加密
 *
 *  @param string 原始字符串
 *  @param key    加密用key
 *
 *  @return 加密后字符串
 */
+ (NSString *)AESEncodingString:(NSString *)string byKey:(NSString *)key;

/**
 *  数据编码为数据
 *
 *  @param data 原始数据
 *
 *  @return 编码后的字符串
 */
+ (NSString *) encodingData:(NSData *)data;

/**
 *  字符串编码为数据
 *
 *  @param string 原始字符串
 *
 *  @return 编码后的数据
 */
+ (NSData *) encoding:(NSString *)string;
@end
