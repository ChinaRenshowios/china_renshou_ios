//
//  MyCollectCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyCollectCollectionViewCell.h"

@implementation MyCollectCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width/3,frame.size.height/2)];
    _stateLabel.font = [UIFont boldSystemFontOfSize:15];
    _stateLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_stateLabel];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_stateLabel.frame.origin.x+_stateLabel.frame.size.width+LEFTEDGE/2,0,frame.size.width/2,frame.size.height/2)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/2,frame.size.width/4, frame.size.height/2)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    
    return self;
}

@end
