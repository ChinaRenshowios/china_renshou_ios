//
//  topScrollView.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol topScrollViewDelegate <NSObject>

@optional
- (void)topScrollViewDidClickButtonIndex:(NSUInteger)index;

@end

@interface topScrollView : UIView
/**
 *  title数组
 */
@property (nonatomic, strong)NSArray *titleArray;
/**
 *  title对应视图数组
 */
@property (nonatomic, strong,readonly)NSArray *titleVcArray;
/**
 *  内容vc
 */
@property (nonatomic, strong)UIViewController *contentVc;
/**
 *  内容视图
 */
@property (nonatomic, strong)UIView *content;

@property (nonatomic, weak)id<topScrollViewDelegate> delegate;

/**
 *  根据title数组和对应视图初始化顶部滚动条视图
 *
 *  @param dict title和对应的视图
 */
- (instancetype)initWithTitlesDict:(NSDictionary *)dict;

/**
 *  根据title数组初始化顶部滚动条视图
 *
 *  @param titles数组
 */
- (instancetype)initWithTitles:(NSArray *)titles;

@end
