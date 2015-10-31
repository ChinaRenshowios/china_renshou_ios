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
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width*2/3,frame.size.height/2)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/2,frame.size.width/3, frame.size.height/2)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/3,frame.size.height/2,frame.size.width/2,frame.size.height/2)];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_timeLabel];
    
    
    
    
    return self;
}

@end
