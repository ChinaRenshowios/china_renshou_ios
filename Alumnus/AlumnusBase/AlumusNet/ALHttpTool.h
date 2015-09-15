//
//  ALHttpTool.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALHttpTool : NSObject

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


@end
