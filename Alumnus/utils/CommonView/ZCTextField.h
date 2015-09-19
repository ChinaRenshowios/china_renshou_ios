//
//  ZCTextField.h
//  AntiquepPie
//
//  Created by 张超 on 15/5/19.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTextField : UITextField {
    
    BOOL isEnablePadding;
    float paddingLeft;
    float paddingRight;
    float paddingTop;
    float paddingBottom;
    
}

- (void)setPadding:(BOOL)enable top:(float)top right:(float)right bottom:(float)bottom left:(float)left;

@end
