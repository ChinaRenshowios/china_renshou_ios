//
//  KSYCommonButtonWithGreen.m
//  Alumnus
//
//  Created by ksy on 15/8/27.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KSYCommonButtonWithGreen.h"

@implementation KSYCommonButtonWithGreen

- (instancetype) initWithFrame:(CGRect)frame Color:(UIColor *)color Title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:color];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 5;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
