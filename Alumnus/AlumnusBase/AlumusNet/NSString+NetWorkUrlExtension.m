//
//  NSString+NetWorkUrlExtension.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/11.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "NSString+NetWorkUrlExtension.h"
#import "ALEncrypt.h"

@implementation NSString (NetWorkUrlExtension)

+ (NSString *)urlEncoding:(NSString *)url
{
    return [self encoding:url];
}

+ (NSString *)encryptString:(NSString *)plainSourceStringToEncrypt byKey:(NSString *)customKey
{
    return [ALEncrypt AESEncodingString:plainSourceStringToEncrypt byKey:customKey];
}

+ (NSString *)randomId
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *guid = (__bridge NSString *)string;
    NSString *guidCopy = [guid copy];
    CFRelease(string);
    return guidCopy;
}

+ (NSString *)md5:(NSString *)string
{
    const char *str = [string UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return filename;

}

+ (NSString *)encoding:(NSString *)string{
    CFStringRef cfResult = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                   (CFStringRef)string,
                                                                   NULL,
                                                                   CFSTR("&=@;!'*#%-,:/()<>[]{}?+ "),
                                                                   kCFStringEncodingUTF8);
    
    if (cfResult) {
        NSString *result = [NSString stringWithString:(__bridge NSString *)cfResult];
        CFRelease(cfResult);
        return result;
    }
    return @"";
}

+ (NSString *)decoding:(NSString *)string{
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                              (CFStringRef)string,
                                                                              CFSTR(""),
                                                                              kCFStringEncodingUTF8));
    return result;
}


@end
