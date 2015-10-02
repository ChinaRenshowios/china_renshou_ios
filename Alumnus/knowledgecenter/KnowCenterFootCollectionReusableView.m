//
//  KnowCenterFootCollectionReusableView.m
//  Alumnus
//
//  Created by ksy on 15/10/2.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KnowCenterFootCollectionReusableView.h"

@implementation KnowCenterFootCollectionReusableView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //firstTitleView.backgroundColor = [UIColor greenColor];
    CGFloat size = SIZEWIDTH-1.8*LEFTEDGE;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,size, self.frame.size.height)];
    [self addSubview:_label];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentRight;
    _label.font = [UIFont boldSystemFontOfSize:13];
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(size+3,self.frame.size.height/3,self.frame.size.height/3,self.frame.size.height/3)];
    UIImage *arrowimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rightarow" ofType:@"png"]];
    arrowImageView.image = arrowimage;
    [self addSubview:arrowImageView];
    return self;
    
}
@end
