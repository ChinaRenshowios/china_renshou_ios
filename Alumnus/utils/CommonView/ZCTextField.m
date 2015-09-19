//
//  ZCTextField.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/19.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCTextField.h"

@implementation ZCTextField

- (id)initWithFrame:(CGRect)frame
{
    self.textColor = TITLE_FONT_COLOR;
    self = [super initWithFrame:frame];
    self.layer.borderWidth = 1;
    self.layer.borderColor = BORDERCOLORREF;
    self.layer.cornerRadius = 3;
    self.backgroundColor = COMMON_INNER_BG_COLOR;
    
    return self;
}

- (void)setPadding:(BOOL)enable top:(float)top right:(float)right bottom:(float)bottom left:(float)left {
    isEnablePadding = enable;
    paddingTop = top;
    paddingRight = right;
    paddingBottom = bottom;
    paddingLeft = left;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    if (isEnablePadding) {
        return CGRectMake(bounds.origin.x + paddingLeft,
                          bounds.origin.y + paddingTop,
                          bounds.size.width - paddingRight - paddingLeft, bounds.size.height - paddingBottom);
    } else {
        return CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    }
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
