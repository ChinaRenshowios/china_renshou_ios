//
//  AlumusAccount.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseManager.h"

@class AlumusAccount;
@interface AlumusAccountManger : ALBaseManager
ZGSingletonH(accountManager)
/**
 *  当前是否是登陆状态
 */
@property (nonatomic,assign,readonly)BOOL isLogin;
/**
 *  账户
 */
@property (nonatomic, strong)AlumusAccount *account;
/**
 *  自动记录账号密码
 */
@property (nonatomic, assign)BOOL autoRemeber;

/**
 *  注册
 */
+ (BOOL)registerAccountWithName:(NSString *)name passWord:(NSString *)password;




@end
