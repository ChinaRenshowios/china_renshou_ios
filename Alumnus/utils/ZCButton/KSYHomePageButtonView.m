//
//  KSYHomePageButtonView.m
//  Alumnus
//
//  Created by ksy on 15/9/15.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KSYHomePageButtonView.h"

@implementation KSYHomePageButtonView

-(id) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/3,frame.size.height/4, frame.size.width/3, frame.size.width/3)];
        _imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height+frame.size.height/10,frame.size.width, 20)];
        _imageLabel.font = [UIFont boldSystemFontOfSize:13];
        _imageLabel.textColor = [UIColor whiteColor];
        _imageLabel.textAlignment = NSTextAlignmentCenter;
        _imageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_imageView];
        [self addSubview:_imageLabel];
        [self addSubview:_imageButton];
        
        
    }
    return self;
}


@end
