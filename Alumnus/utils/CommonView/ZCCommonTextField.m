//
//  ZCCommonTextField.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/26.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCCommonTextField.h"

@implementation ZCCommonTextField

-(instancetype) initWithFrame:(CGRect)frame title:(NSString*)title width:(CGFloat)width{

    self = [super initWithFrame:frame];
    if (self){
    
        self.backgroundColor = COMMON_INNER_BG_COLOR;
        self.textColor = COMMON_FONT_COLOR;
        self.layer.borderColor = [COMMON_INNER_BG_COLOR CGColor];
        _leftInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, frame.size.height)];
        _leftInfoLabel.text = title;
        _leftInfoLabel.textAlignment = NSTextAlignmentCenter;
        _leftInfoLabel.textColor = COMMON_FONT_COLOR;
        _leftInfoLabel.font = [UIFont systemFontOfSize:18];
        
        UIView *edge = [[UIView alloc] initWithFrame:CGRectMake(width-1, 3, 1, frame.size.height-6)];
        edge.backgroundColor = EDGE_BG_COLOR;
        
        [self addSubview:_leftInfoLabel];
        //[self addSubview:edge];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame pic:(NSString*)pic width:(CGFloat)width{
    
    self = [super initWithFrame:frame];
    if (self){
        
        self.backgroundColor = COMMON_INNER_BG_COLOR;
        self.textColor = COMMON_FONT_COLOR;
        self.layer.borderColor = [LOGIN_EDGE_COLOR CGColor];
        self.layer.borderWidth = 0.5;
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width/6,frame.size.height/5 , width*2/3, frame.size.height*3/5)];
        UIImage *Image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:pic ofType:@"png"]];
        _leftImageView.image = Image;
        [self addSubview:_leftImageView];
        UIView *edge = [[UIView alloc] initWithFrame:CGRectMake(width-1, 5, 1, frame.size.height-10)];
        edge.backgroundColor = LOGIN_EDGE_COLOR;
        
        self.userInteractionEnabled = YES;
        [self addSubview:edge];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    
    CGFloat left = _leftInfoLabel.frame.size.width;
    if (isEnablePadding) {
        return CGRectMake(bounds.origin.x + left + paddingLeft,
                          bounds.origin.y + paddingTop,
                          bounds.size.width - left - paddingRight - paddingLeft, bounds.size.height - paddingBottom);
    } else {
        return CGRectMake(bounds.origin.x+left, bounds.origin.y, bounds.size.width-left, bounds.size.height);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
