//
//  ZGSlideModule.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGSlideModule : UIScrollView
/**
 *  内容数组
 */
@property (nonatomic, strong,readonly)NSArray *contentArray;
/**
 *  滑动条背景颜色
 */
@property (nonatomic, strong)UIColor *backgroundColor;
/**
 *  初始化
 *
 *  @param contennts 滑动条展示内容
 */
- (instancetype)initWithContents:(NSArray *)contennts;
/**
 *  初始化
 *
 *  @param contennts 滑动条展示内容
 */
+ (instancetype)slideWithContents:(NSArray *)contennts;

/**
 *  重新布局视图
 */
- (void)resetSubViews;

@end
