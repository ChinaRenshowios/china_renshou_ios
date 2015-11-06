//
//  MyUnforgotModel.h
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@interface MyUnforgotModel : ALBaseModel
@property(copy,nonatomic)NSString *MEMO_ID;
@property(copy,nonatomic)NSString *MEMO_WRITE_TIME;
@property(copy,nonatomic)NSString *MEMO_TEXT;
@property(copy,nonatomic)NSString *MEMO_TITLE;
@end
