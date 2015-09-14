//
//  ZG_NetWorkPrivate.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ZG_NetWorkPrivate.h"

void ZGNetLog(NSString *format, ...) {
#ifdef DEBUG
    va_list argptr;
    va_start(argptr, format);
    NSLogv(format, argptr);
    va_end(argptr);
#endif
}

@implementation ZG_NetWorkPrivate
+ (BOOL)checkJson:(id)json withValidator:(id)validatorJson
{
    if ([json isKindOfClass:[NSDictionary class]] &&
        [validatorJson isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dict = json;
        NSDictionary * validator = validatorJson;
        BOOL result = YES;
        NSEnumerator * enumerator = [validator keyEnumerator];
        NSString * key;
        while ((key = [enumerator nextObject]) != nil) {
            id value = dict[key];
            id format = validator[key];
            if ([value isKindOfClass:[NSDictionary class]]
                || [value isKindOfClass:[NSArray class]]) {
                result = [self checkJson:value withValidator:format];
                if (!result) {
                    break;
                }
            } else {
                if ([value isKindOfClass:format] == NO &&
                    [value isKindOfClass:[NSNull class]] == NO) {
                    result = NO;
                    break;
                }
            }
        }
        return result;
    } else if ([json isKindOfClass:[NSArray class]] &&
               [validatorJson isKindOfClass:[NSArray class]]) {
        NSArray * validatorArray = (NSArray *)validatorJson;
        if (validatorArray.count > 0) {
            NSArray * array = json;
            NSDictionary * validator = validatorJson[0];
            for (id item in array) {
                BOOL result = [self checkJson:item withValidator:validator];
                if (!result) {
                    return NO;
                }
            }
        }
        return YES;
    } else if ([json isKindOfClass:validatorJson]) {
        return YES;
    } else {
        return NO;
    }

}

@end

@implementation ZG_NetWorkBaseApi (RequestAccessory)

- (void)toggleAccessoriesWillStartCallBack
{
    for (id<ZG_NetWorkBaseApiAccessory> accessory in self.requestAccessories) {
        if ([accessory respondsToSelector:@selector(requestWillStart:)] ) {
            [accessory requestWillStart:self];
        }
    }
}

- (void)toggleAccessoriesWillStopCallBack
{
    for (id<ZG_NetWorkBaseApiAccessory> accessory in self.requestAccessories) {
        if ([accessory respondsToSelector:@selector(requestWillStop:)] ) {
            [accessory requestWillStop:self];
        }
    }
}

- (void)toggleAccessoriesDidStopCallBack
{
    for (id<ZG_NetWorkBaseApiAccessory> accessory in self.requestAccessories) {
        if ([accessory respondsToSelector:@selector(requestDidStop:)] ) {
            [accessory requestDidStop:self];
        }
    }
}

@end
