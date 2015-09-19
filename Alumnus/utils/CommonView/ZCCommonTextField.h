//
//  ZCCommonTextField.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/26.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCTextField.h"

@interface ZCCommonTextField : ZCTextField

-(instancetype) initWithFrame:(CGRect)frame title:(NSString*)title width:(CGFloat)width;
-(instancetype) initWithFrame:(CGRect)frame pic:(NSString*)pic width:(CGFloat)width;
@property (strong, nonatomic) UILabel *leftInfoLabel;   //左侧提示内容标签
@property (strong, nonatomic) UIImageView *leftImageView;
@end
