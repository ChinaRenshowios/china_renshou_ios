//
//  ALBaseApi.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseApi.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "ALHttpTool.h"

@implementation ALBaseApi

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)baseUrl {
    return self.url;
}

- (NSString *)requestUrl {
    return self.appendUrl;
}

- (ALRequestMethod)requestMethod {
    return (int)self.requestMeth;
}

- (NSDictionary *)body {
    return self.bodyDic;
}


- (void)sendData:(responseDataBlock)block {
    
    if (![AFNetworkReachabilityManager sharedManager].reachable) {//网络不畅通状态
        [MBProgressHUD showError:@"网络异常,请检查网络设置"];
    }

    NSString *serveUrl = [NSString stringWithFormat:@"%@%@",[self baseUrl],[self requestUrl]];
    NSDictionary *param = [self body];
    [self setupHeadForRequest];
    
    switch (self.requestMeth) {
        case ALRequestMethodGet:
        {
            [ALHttpTool get:serveUrl params:param success:^(id json) {
                NSDictionary *responseJson = (NSDictionary *)json;
                NSLog(@"responseObject %@  [self requestUrl] %@",(NSDictionary *)responseJson,[self requestUrl]);
                if ([[responseJson valueForKey:@"errorCode"]integerValue] == 0 && [[responseJson valueForKey:@"ErrorCode"]integerValue] == 0) {
                    block(YES,json,[responseJson valueForKey:@"errorMessage"]);
                }else{
                    block(NO,json,[responseJson valueForKey:@"errorMessage"]?[responseJson valueForKey:@"errorMessage"]:[responseJson valueForKey:@"ErrorMessage"]);
                }
            } failure:^(NSError *error) {
                block(NO,nil,@"网络连接失败");
            }];
        }
            break;
        case ALRequestMethodPost:
        {
            [ALHttpTool post:serveUrl params:param success:^(id json) {
                NSDictionary *responseJson = (NSDictionary *)json;
                NSLog(@"responseObject %@  [self requestUrl] %@",(NSDictionary *)responseJson,[self requestUrl]);
                block(YES,json,[responseJson valueForKey:@"errorMessage"]);
            } failure:^(NSError *error) {
                block(NO,nil,@"网络连接失败");
            }];

        }
            break;
            
        default:
            break;
    }
}

//设置头内容
- (void)setupHeadForRequest
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    for (id headField in [self header].allKeys) {
        id value = [self header][headField];
        if ([headField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
            [mgr.requestSerializer setValue:value forHTTPHeaderField:headField];
        }else{
            ALLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
        }
    }

}

@end
