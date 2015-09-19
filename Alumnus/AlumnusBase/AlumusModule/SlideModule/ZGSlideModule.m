//
//  ZGSlideModule.m
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ZGSlideModule.h"

@interface ZGSlideModule ()

@end

@implementation ZGSlideModule


#pragma lazy

#pragma mark - lifeCycle
- (instancetype)initWithContents:(NSArray *)contennts
{
    self = [[ZGSlideModule alloc]init];
    NSMutableArray *temp = [NSMutableArray array];
    NSMutableArray *errorTemp = [NSMutableArray array];
    if (self) {
        for (id obj in contennts) {
            if ([obj isKindOfClass:[NSString class]] && [(NSString *) obj length] > 0) {
                [temp addObject:(NSString *)obj];
            }else{
                [errorTemp addObject:obj];
            }
        }
        ALLog(@"contenntsz中obj不是字符串类型:%@",errorTemp);
        _contentArray = temp.copy;
    }
    return self;
}

+ (instancetype)slideWithContents:(NSArray *)contennts
{
    return [[self alloc]initWithContents:contennts];
}

#pragma mark - private api
//初始化
- (void)setup
{
    
}

//获取数据
- (void)loadData
{
    
}

#pragma mark - public api
//刷新视图
- (void)resetSubViews
{
    
}

#pragma mark - property



@end
