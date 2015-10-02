//
//  KnowCenterHeadCollectionReusableView.m
//  Alumnus
//
//  Created by ksy on 15/10/2.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KnowCenterHeadCollectionReusableView.h"

@implementation KnowCenterHeadCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //firstTitleView.backgroundColor = [UIColor greenColor];
    UIView *upEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH, 1)];
    upEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:upEdgeView];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE,0, self.frame.size.width/2, self.frame.size.height)];
    [self addSubview:_label];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.font = [UIFont boldSystemFontOfSize:13];
    UIView *downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,frame.size.height-1, SIZEWIDTH, 1)];
    downEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:downEdgeView];
    return self;
    
}
@end
