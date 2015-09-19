//
//  ZCTextFieldOnlyNum.m
//  AntiquepPie
//
//  Created by 张超 on 15/5/29.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCTextFieldOnlyNum.h"

@interface ZCTextFieldOnlyNum()<UITextFieldDelegate>

@end

@implementation ZCTextFieldOnlyNum

-(instancetype) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self){
        self.textColor = COMMON_FONT_COLOR;
        self.keyboardType = UIKeyboardTypeNumberPad;
        self.delegate = self;
    }
    return self;
}


#pragma mark <UITextFiledDelegate>
//仅允许数字写入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *cs;
  
#define NUMBERS @"0123456789.\n"
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest)
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入数字"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            
            [alert show];
            return NO;
        }
    
    //其他的类型不需要检测，直接写入
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
