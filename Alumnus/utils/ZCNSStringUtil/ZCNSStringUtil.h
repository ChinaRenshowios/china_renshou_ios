//
//  ZCNSStringUtil.h
//  AntiquepPie
//
//  Created by 张超 on 15/6/2.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h> 

@interface ZCNSStringUtil : NSObject

+ (NSString *)md5:(NSString *)str;
+ (NSString *)base64:(NSString *)text;
+ (NSString *)base64StringFromText:(NSString *)text;
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)textIsEmpty:(NSString*)value;
+ (NSString *) sha1:(NSString *)input;
+ (NSString *)decoding:(NSString *)string;
+ (NSString *)addUrl:(NSString *)string1 url2:(NSString *)string2;
+ (NSString *)timeToString:(NSTimeInterval)time;
+(NSString *)filterHTML:(NSString *)html;
@end
