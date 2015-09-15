//
//  ZCImageButton.m
//  AntiquepPie
//
//  Created by 张超 on 15/7/23.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCImageButton.h"

@implementation ZCImageButton

-(id) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self){
    
        _imageView_normal = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView_select = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:_imageView_normal];
        [self addSubview:_imageView_select];
        [self addSubview:_imageButton];
        [self changeSelected:NO];
        
    }
    return self;
}

-(void) changeSelected:(BOOL) isselected{

    if (isselected){
        self.backgroundColor = DOCK_SELECT_COLOR;
        _imageView_select.hidden = NO;
        _imageView_normal.hidden = YES;
    }else{
        self.backgroundColor = DOCK_BG_COLOR;
        _imageView_select.hidden = YES;
        _imageView_normal.hidden = NO;
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
