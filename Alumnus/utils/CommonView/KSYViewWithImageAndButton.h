//
//  KSYViewWithImageAndButton.h
//  Alumnus
//
//  Created by ksy on 15/8/25.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSYViewWithImageAndButton : UIView

- (instancetype) initWithFrame:(CGRect)frame title:(NSString *)title pic:(NSString *)pic;
- (instancetype) initWithFrame:(CGRect)frame title:(NSString *)title;
@property (strong,nonatomic) UIButton *goToButton;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UIImageView *arowImageview;
@property (strong,nonatomic) UIImageView *imageview;
@property (strong,nonatomic) UILabel *rightLabel;
@end
