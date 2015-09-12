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
