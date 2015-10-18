//
//  SwitchBtn.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "SwitchBtn.h"

@interface SwitchBtn()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *left;
@property (nonatomic, strong)UIButton *right;
@end

@implementation SwitchBtn

#pragma lazy

#pragma mark - lifeCycle
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.left.frame = CGRectMake(0, 0, 60, 40);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.left.frame), 0, self.width - 120, self.height);
    self.right.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame), 0, 60, self.height);
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [self init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UILabel *title1 = [[UILabel alloc]init];
        title1.text = title;
        title1.textColor = [UIColor whiteColor];
        title1.font = [UIFont systemFontOfSize:14];
        title1.textAlignment = NSTextAlignmentCenter;
        self.titleLabel = title1;
        [self addSubview:title1];
        
        UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
        [left setBackgroundColor:[UIColor greenColor]];
        left.tag = 0;
        [left addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        self.left =left;
        [self addSubview:left];
        
        UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
        right.tag = 1;
        [right setBackgroundColor:[UIColor greenColor]];
        [right addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        self.right =right;
        [self addSubview:right];
    }
    return self;
}

#pragma mark - private api
- (void)btnclick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(SwitchBtnDidClickBtnIndex:)]) {
        [self.delegate SwitchBtnDidClickBtnIndex:btn.tag];
    }
}

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
