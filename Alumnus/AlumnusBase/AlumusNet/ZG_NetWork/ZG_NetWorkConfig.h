//
//  ZG_NetWorkConfig.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/13.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

//todo:文件,缓存地址配置

@interface ZG_NetWorkConfig : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic) NSString *cdnUrl;
/**
 *  自定url拼接
 */
@property (strong, nonatomic, readonly) NSArray *urlFilters;

@end
