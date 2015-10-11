//
//  NSString+NetWorkUrlExtension.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/11.
//  Copyright © 2015年 wiipu. All rights reserved.
//  url加密

#import <Foundation/Foundation.h>

@interface NSString (NetWorkUrlExtension)

/**
 *  URL编码
 *
 *  @param url 原始URL
 *
 *  @return 编码后的URL
 */
+ (NSString *) urlEncoding:(NSString *)url;

/**
*  AES加密
*
*  @param plainSourceStringToEncrypt 加密前数据
*  @param customKey                  AES key
*
*  @return 加密后数据
*/
+ (NSString *)encryptString:(NSString *)plainSourceStringToEncrypt byKey:(NSString *)customKey;

/**
*  GUID
*
*  @return GUID
*/
+ (NSString *) randomId;
/**
 *  MD5
 *
 *  @return MD5
 */
+ (NSString *)md5:(NSString *)string;

/**
 *  encoding
 */
+ (NSString *) encoding:(NSString *)string;
/**
 *  decoding
 */
+ (NSString *) decoding:(NSString *)string;


@end
