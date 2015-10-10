//
//  MyConfig.h
//  AntiquepPie
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#ifndef Alumnus_MyConfig_h
#define Alumnus_MyConfig_h

//域名
#define API @"101.200.178.170/case_wwp/api/"

//版本号
#define VERSION @"1.0"

//来源--表示来源为苹果
#define SOURCE @"3"

#pragma mark ----------登录接口-----------

//全局字段
#define   SIZEWIDTH  [[UIScreen mainScreen] bounds].size.width  //宽
#define   SIZEHEIGHT  [[UIScreen mainScreen] bounds].size.height  //高

#define VIEW_BG_COLOR [UIColor whiteColor]
#define VIEW_BG_COLOR_Light [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]

#define BUTTON_BG_COLOR [UIColor colorWithRed:242.0/255.0 green:98.0/255.0 blue:2.0/255.0 alpha:1.0]
#define EDGE_BG_COLOR [UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0]
#define BORDERCOLORREF [[UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0] CGColor]
#define COMMON_INNER_BG_COLOR [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]
#define TITLE_FONT_COLOR [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0]
#define DOCK_BG_COLOR [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1.0]
#define DOCK_SELECT_COLOR [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1.0]

#define LOGIN_EDGE_COLOR [UIColor colorWithRed:156.0/255.0 green:156.0/255.0 blue:156.0/255.0 alpha:1.0]
#define COMMON_FONT_COLOR [UIColor blackColor]
#define ATTENTION_LABEL_COLOR [UIColor orangeColor]

#define LEFTEDGE SIZEWIDTH/15
#define TOPEDGE SIZEHEIGHT/26.6


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//适配
#define IPHONE5 ([[UIScreen mainScreen] bounds].size.height>520&&[UIScreen mainScreen] bounds].size.height<650)?YES:NO
#define IPHONE6 ([[UIScreen mainScreen] bounds].size.height>650&&[UIScreen mainScreen] bounds].size.height<730)?YES:NO
#define IPHONE6P [[UIScreen mainScreen] bounds].size.height>730?YES:NO
#define IPHONE4 [[UIScreen mainScreen] bounds].size.height<520?YES:NO

#endif
