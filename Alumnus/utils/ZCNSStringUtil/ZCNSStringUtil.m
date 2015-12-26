//
//  ZCNSStringUtil.m
//  AntiquepPie
//
//  Created by 张超 on 15/6/2.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCNSStringUtil.h"

@implementation ZCNSStringUtil


#pragma mark MD5加密
+ (NSString *)md5:(NSString *)str

{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    // CC_MD5( cStr, strlen(cStr), digest ); 这里的用法明显是错误的，但是不知道为什么依然可以在网络上得以流传。当srcString中包含空字符（\0）时
    CC_MD5( cStr, str.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}
+ (NSString *) sha1:(NSString *)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}



#pragma mark base64加密
//空字符串
#define     LocalStr_None           @""

+ (NSString *)base64:(NSString *)text{

    if (text && ![text isEqualToString:LocalStr_None]) {
        
        //添加3位随机数字
        text = [NSString stringWithFormat:@"%@%d", text, [self getRandomNumber:100 to:1000]];
        //for (int i = 0; i < 3; i++)
        //    text = [NSString stringWithFormat:@"%@%d", text, [self getRandomNumber:0 to:10]];
        //NSLog(@"%@",text);
        
        //完成3次反转和base64加密
        for (int i = 0; i < 3; i++)
        {
            text = [self reverseString:text];
            //NSLog(@"%d  %@",i, text);
            text = [self base64StringFromText:text];
            //NSLog(@"%d  %@",i, text);
        }
        return text;
    }
    else {
        return LocalStr_None;
    }
    
}


+ (NSString *)base64StringFromText:(NSString *)text
{
    if (text && ![text isEqualToString:LocalStr_None]) {
        NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
        //IOS 自带DES加密 Begin  改动了此处
        //data = [self DESEncrypt:data WithKey:key];
        //IOS 自带DES加密 End
        return [self base64EncodedStringFrom:data];
    }
    else {
        return LocalStr_None;
    }
}

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
/******************************************************************************
 函数名称 : + (NSString *)base64EncodedStringFrom:(NSData *)data
 函数描述 : 文本数据转换为base64格式字符串
 输入参数 : (NSData *)data
 输出参数 : N/A
 返回参数 : (NSString *)
 备注信息 :
 ******************************************************************************/
+ (NSString *)base64EncodedStringFrom:(NSData *)data
{
    if ([data length] == 0)
        return @"";
    
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (i < [data length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length])
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

//将str反转
+(NSString *)reverseString:(NSString *) str {
    NSUInteger length = [str length];
    NSMutableString *reversedString;
    
    reversedString = [[NSMutableString alloc] initWithCapacity: length];
    while (length > 0) {
        [reversedString appendString:[NSString stringWithFormat:@"%C", [str characterAtIndex:--length]]];
    }
    
    return reversedString;
}

//获取一个随机整数，范围在[from,to），包括from，不包括to
+(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to-from + 1)));
}



#pragma mark 检查手机号
// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
              * 中国移动：China Mobile
              * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
              */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
              * 中国联通：China Unicom
              * 130,131,132,152,155,156,185,186
              */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
              * 中国电信：China Telecom
              * 133,1349,153,180,189
              */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
              * 大陆地区固话及小灵通
              * 区号：010,020,021,022,023,024,025,027,028,029
              * 号码：七位或八位
              */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark 邮箱验证
//检查邮箱是否合法
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark 判断是否为空
//判断是否为空
+(BOOL)textIsEmpty:(NSString*)value
{
    if ([value isKindOfClass:[NSNull class]] || value == nil || [value isEqualToString:@""]) {
        return YES;
    }return NO;
}
#pragma mark urldecode
+ (NSString *)decoding:(NSString *)string{
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                              (CFStringRef)string,
                                                                              CFSTR(""),
                                                                              kCFStringEncodingUTF8));
    return result;
}
#pragma mark 拼接url
+ (NSString *)addUrl:(NSString *)string1 url2:(NSString *)string2{
    NSString *result = [NSString stringWithFormat:@"%@%@",string1,string2];
    return result;
}
+ (NSString *)timeToString:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *result = [formatter stringFromDate:date];
    return result;
}

+(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    return html;
}

+(NSString *)getMainUrl:(NSString *)htmlurl{
   htmlurl = [NSString stringWithFormat:@"%@login_sso_mobile.jsp?USER_CODE=%@&IS_FROM_MOBILE=true&mobileDeviceId=%@&GOTO_URL=%@",API,[[NSUserDefaults standardUserDefaults] valueForKey:@"mobileUserCode"],[[NSUserDefaults standardUserDefaults] valueForKey:@"mobileDeviceId"],htmlurl];
    return htmlurl;
}
@end
