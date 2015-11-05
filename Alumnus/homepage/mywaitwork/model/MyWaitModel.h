//
//  MyWaitModel.h
//  Alumnus
//
//  Created by ksy on 15/11/5.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyWaitModel : NSObject
@property(copy,nonatomic)NSString *SEND_USER_CODE;  //提交人
@property(copy,nonatomic)NSString *TODO_CODE_NAME;  //文件种类
@property(copy,nonatomic)NSString *TODO_SEND_TIME;  //交办时间
@property(copy,nonatomic)NSString *TODO_FROM;       //待办来自哪种业务
@property(copy,nonatomic)NSString *OWNER_CODE;      //待办人
@property(copy,nonatomic)NSString *TODO_CODE;       //类型
@property(copy,nonatomic)NSString *TODO_DEADLINE1;  //办理期限
@property(copy,nonatomic)NSString *TODO_URL;       //待办链接
@property(copy,nonatomic)NSString *TODO_ID;       //待办表主键
@property(copy,nonatomic)NSString *OWNER_CODE__NAME;      //文件种类
@property(copy,nonatomic)NSString *SERV_ID;       //服务id
@property(copy,nonatomic)NSString *TODO_TITLE;  //标题
@property(copy,nonatomic)NSString *SEND_USER_CODE__NAME;       //发送者名字

@end
