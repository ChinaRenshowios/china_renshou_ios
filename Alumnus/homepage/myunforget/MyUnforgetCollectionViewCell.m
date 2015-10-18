//
//  MyUnforgetCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/10/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyUnforgetCollectionViewCell.h"

@implementation MyUnforgetCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE,0,frame.size.width/2,frame.size.height)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.size.width+LEFTEDGE*2,0,frame.size.width/4,frame.size.height)];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    [self addSubview:_timeLabel];
    UIImage *arowImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rightarow" ofType:@"png"]];
    _arowImageview = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-LEFTEDGE/2-frame.size.height/6,frame.size.height/3, frame.size.height/6, frame.size.height/3)];
    _arowImageview.image = arowImage;
    [self addSubview:_arowImageview];

    
    
    return self;
}

@end
