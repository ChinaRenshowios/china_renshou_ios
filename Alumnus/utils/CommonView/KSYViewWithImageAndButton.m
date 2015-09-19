//
//  KSYViewWithImageAndButton.m
//  Alumnus
//
//  Created by ksy on 15/8/25.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KSYViewWithImageAndButton.h"

@implementation KSYViewWithImageAndButton

- (instancetype) initWithFrame:(CGRect)frame title:(NSString *)title pic:(NSString *)pic{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = COMMON_INNER_BG_COLOR;
        UIImage *Image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:pic ofType:@"png"]];
        _imageview = [[UIImageView alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/4, frame.size.height/2, frame.size.height/2)];
        _imageview.image = Image;
        [self addSubview:_imageview];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageview.frame.origin.x+_imageview.frame.size.width+LEFTEDGE/2,self.frame.size.height/3, self.frame.size.width/2, self.frame.size.height/3)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = title;
        _goToButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_titleLabel];
        [self addSubview:_goToButton];
        UIImage *arowImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rightarow" ofType:@"png"]];
        _arowImageview = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-LEFTEDGE/2-frame.size.height/6,frame.size.height/3, frame.size.height/6, frame.size.height/3)];
        _arowImageview.image = arowImage;
        [self addSubview:_arowImageview];
        
        
        //[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    return self;
}
- (instancetype) initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = COMMON_INNER_BG_COLOR;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,self.frame.size.height/3, self.frame.size.width/6, self.frame.size.height/3)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = title;
        _goToButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_titleLabel];
        [self addSubview:_goToButton];
        UIImage *arowImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rightarow" ofType:@"png"]];
        _arowImageview = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-LEFTEDGE/2-frame.size.height/6,frame.size.height/3, frame.size.height/6, frame.size.height/3)];
        _arowImageview.image = arowImage;
        [self addSubview:_arowImageview];
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/6+LEFTEDGE, self.frame.size.height/3,self.frame.size.width*5/6-LEFTEDGE-frame.size.height/6-LEFTEDGE,self.frame.size.height/3)];
        _rightLabel.textAlignment = NSTextAlignmentRight;
        _rightLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_rightLabel];
        
        //[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    return self;
}

@end
