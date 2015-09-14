//
//  ZG_NetWorkPrivate.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZG_NetWorkBaseApi.h"

FOUNDATION_EXPORT void ZGNetLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

@interface ZG_NetWorkPrivate : NSObject
//拓展network的一些常用功能:加密,校验json...
+ (BOOL)checkJson:(id)json withValidator:(id)validatorJson;
@end

//切面请求
@interface ZG_NetWorkBaseApi (RequestAccessory)
- (void)toggleAccessoriesWillStartCallBack;
- (void)toggleAccessoriesWillStopCallBack;
- (void)toggleAccessoriesDidStopCallBack;

@end
