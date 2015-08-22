//
//  ZCImageButton.h
//  AntiquepPie
//
//  Created by 张超 on 15/7/23.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCImageButton : UIView

@property (strong, nonatomic) UIImageView *imageView_normal;
@property (strong, nonatomic) UIImageView *imageView_select;
@property (strong, nonatomic) UIButton *imageButton;

-(void) changeSelected:(BOOL) isselected;

@end
