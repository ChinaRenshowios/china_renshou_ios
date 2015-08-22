//
//  ZCCommonButton.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/24.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCCommonButton.h"

@implementation ZCCommonButton

- (instancetype) initWithFrame:(CGRect)frame backgroundColor:(UIColor*) color
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = color;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [color CGColor];
        self.layer.cornerRadius = 3;
        
        //[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
