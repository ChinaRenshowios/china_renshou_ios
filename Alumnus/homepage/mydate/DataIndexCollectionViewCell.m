//
//  DataIndexCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "DataIndexCollectionViewCell.h"

@implementation DataIndexCollectionViewCell
/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/4, frame.size.height/2)];
    _startTimeLabel.textAlignment = NSTextAlignmentCenter;
    _startTimeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_startTimeLabel];
    _endTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,frame.size.height/2,frame.size.width/4, frame.size.height/2)];
    _endTimeLabel.textAlignment = NSTextAlignmentCenter;
    _endTimeLabel.font = [UIFont systemFontOfSize:12];
    _endTimeLabel.textColor = [UIColor grayColor];
    [self addSubview:_endTimeLabel];
    _edgeView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/4,0,2,frame.size.height)];
    [self addSubview:_edgeView];
    _TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_edgeView.frame.origin.x+LEFTEDGE,0,frame.size.width/2,frame.size.height)];
    _TitleLabel.font = [UIFont systemFontOfSize:15];
    _TitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_TitleLabel];
    
    
    return self;
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    _TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width, frame.size.height/2)];
    _TitleLabel.font = [UIFont systemFontOfSize:15];
    _TitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_TitleLabel];
    _startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,frame.size.height/2,frame.size.width, frame.size.height/2)];
    _startTimeLabel.textAlignment = NSTextAlignmentLeft;
    _startTimeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_startTimeLabel];
    

    return self;
}

@end
