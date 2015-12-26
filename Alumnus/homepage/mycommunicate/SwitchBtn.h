//
//  SwitchBtn.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwitchBtnDelegate <NSObject>

@required
- (void)SwitchBtnDidClickBtnIndex:(NSUInteger)index;

@end

@interface SwitchBtn : UIView

- (instancetype)initWithTitle:(NSString *)title;

@property (nonatomic, weak)id<SwitchBtnDelegate> delegate;

@end
