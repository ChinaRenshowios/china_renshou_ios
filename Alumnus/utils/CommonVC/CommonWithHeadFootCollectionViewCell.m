//
//  CommonWithHeadFootCollectionViewCell.m
//  Alumnus
//
//  Created by ksy on 15/10/2.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "CommonWithHeadFootCollectionViewCell.h"

@implementation CommonWithHeadFootCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(LEFTEDGE,frame.size.height/5,15,15)];
    _imageView.backgroundColor = [UIColor grayColor];
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"know_pdf" ofType:@"png"]];
    _imageView.image = image;
    [self addSubview:_imageView];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.size.height+1.5*LEFTEDGE,frame.size.height/5,frame.size.width*21/32,15)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:13];
    _titleLabel.text = @"ios 中关于苹果cell复用的问题";
    [self addSubview:_titleLabel];
    _timeAndPersonLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.size.height+1.5*LEFTEDGE, _titleLabel.frame.origin.y+_titleLabel.frame.size.height+5,frame.size.width*3/4,15)];
    _timeAndPersonLabel.font = [UIFont systemFontOfSize:12];
    _timeAndPersonLabel.textColor = LOGIN_EDGE_COLOR;
    _timeAndPersonLabel.text = @"2015-10-01 11:21 李先生提问";
    [self addSubview:_timeAndPersonLabel];
    CGFloat resposeLabelSize = SIZEWIDTH-_titleLabel.frame.size.width-_titleLabel.frame.origin.x-LEFTEDGE;
    _responseLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.size.width+_titleLabel.frame.origin.x,_titleLabel.frame.origin.y,resposeLabelSize,15)];
    _responseLabel.backgroundColor = DOCK_SELECT_COLOR;
    _responseLabel.textColor = [UIColor whiteColor];
    _responseLabel.layer.cornerRadius = 7.5;
    _responseLabel.layer.masksToBounds = YES;
    _responseLabel.textAlignment = NSTextAlignmentCenter;
    _responseLabel.font = [UIFont systemFontOfSize:10];
    _responseLabel.text = @"0 回复";
    [self addSubview:_responseLabel];
    
    _attentionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.size.width+_titleLabel.frame.origin.x,_responseLabel.frame.origin.y+_responseLabel.frame.size.height+2,resposeLabelSize,15)];
    _attentionLabel.backgroundColor = ATTENTION_LABEL_COLOR;
    _attentionLabel.textColor = [UIColor whiteColor];
    _attentionLabel.layer.cornerRadius = 7.5;
    _attentionLabel.layer.masksToBounds = YES;
    _attentionLabel.textAlignment = NSTextAlignmentCenter;
    _attentionLabel.font = [UIFont systemFontOfSize:10];
    _attentionLabel.text = @"0 关注";
    [self addSubview:_attentionLabel];
    
    UIView *downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(LEFTEDGE,frame.size.height-1, SIZEWIDTH-2*LEFTEDGE,1)];
    downEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:downEdgeView];
    
    return self;
}

@end
