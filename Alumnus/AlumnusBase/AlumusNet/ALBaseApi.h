//
//  ALBaseApi.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger , ALRequestMethod) {
    ALRequestMethodGet = 0,
    ALRequestMethodPost = 2
};

typedef void (^responseDataBlock)(BOOL success, id responseData, NSString *message);
typedef void (^responseSuccessBlock)(BOOL success, NSString *message);

@interface ALBaseApi : NSObject

@property (nonatomic, strong)NSString *url;
@property (nonatomic, strong)NSString *appendUrl;
@property (nonatomic, assign)ALRequestMethod requestMeth;
@property (nonatomic, strong)NSDictionary *header;
@property (nonatomic, strong)NSDictionary *bodyDic;
@property (nonatomic, strong)NSMutableDictionary *responseDic;

- (void)sendData:(responseDataBlock)block;


@end
