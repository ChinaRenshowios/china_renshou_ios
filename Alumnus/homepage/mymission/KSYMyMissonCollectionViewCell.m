//
//  KSYMyMissonCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/10/31.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYMyMissonCollectionViewCell.h"

@implementation KSYMyMissonCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width/5,frame.size.height/2)];
    _stateLabel.textAlignment = NSTextAlignmentLeft;
    _stateLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_stateLabel];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_stateLabel.frame.origin.x+_stateLabel.frame.size.width+LEFTEDGE/2,0,frame.size.width/3,frame.size.height/2)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    

    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/2,frame.size.width/4,frame.size.height/2)];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_timeLabel];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_timeLabel.frame.origin.x+_timeLabel.frame.size.width+LEFTEDGE/2,frame.size.height/2,frame.size.width/4, frame.size.height/2)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    
    _doneTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.frame.origin.x+_nameLabel.frame.size.width+LEFTEDGE/2,frame.size.height/2,frame.size.width/4,frame.size.height/2)];
    _doneTimeLabel.textColor = [UIColor grayColor];
    _doneTimeLabel.font = [UIFont systemFontOfSize:10];
    _doneTimeLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_doneTimeLabel];
    
    
    
    
    
    
    return self;
}

@end
