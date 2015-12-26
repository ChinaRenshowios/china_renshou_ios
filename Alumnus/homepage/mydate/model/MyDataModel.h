//
//  MyDataModel.h
//  Alumnus
//
//  Created by ksy on 15/11/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@interface MyDataModel : ALBaseModel

@property(copy,nonatomic)NSString *START_TIME;  //提交人
@property(copy,nonatomic)NSString *END_TIME;  //文件种类
@property(copy,nonatomic)NSString *CAL_USER_ID;  //交办时间
@property(copy,nonatomic)NSString *S_USER__NAME;       //待办来自哪种业务
@property(copy,nonatomic)NSString *CAL_TITLE;      //待办人

@end
