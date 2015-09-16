//
//  UIColor+Extension.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
// 转换16进制数为rgb色值的方法
+ (UIColor *)colorWithHexStr:(NSString *)stringToConvert;
@end
