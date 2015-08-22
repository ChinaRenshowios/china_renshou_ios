//
//  Dock.h
//  AntiquepPie
//
//  Created by ksy on 15/5/6.
//  Copyright (c) 2015年 ksy. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Dock;

@protocol DockDelegate <NSObject>
@optional
- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;
@end

@interface Dock : UIView
// 添加一个选项卡
- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *) title itemCategory:(NSString *) itemCategory;

// 代理
@property (nonatomic, weak) id<DockDelegate> delegate;
@end
