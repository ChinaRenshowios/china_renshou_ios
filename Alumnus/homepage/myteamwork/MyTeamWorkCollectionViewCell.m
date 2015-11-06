//
//  MyTeamWorkCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyTeamWorkCollectionViewCell.h"

@implementation MyTeamWorkCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width*2/3,frame.size.height/2)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/2,frame.size.width/4, frame.size.height/2)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    
    _isUsedLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.frame.origin.x+_nameLabel.frame.size.width+LEFTEDGE/2,frame.size.height/2,frame.size.width/4,frame.size.height/2)];
    _isUsedLabel.textColor = [UIColor grayColor];
    _isUsedLabel.font = [UIFont systemFontOfSize:12];
    _isUsedLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_isUsedLabel];
    return self;
}

@end
