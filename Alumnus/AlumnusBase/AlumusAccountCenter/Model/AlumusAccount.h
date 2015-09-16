//
//  AlumusAccount.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@class ALAddressBook;
@interface AlumusAccount : ALBaseModel
/**
 *  账号名称
 */
@property (nonatomic, copy)NSString *name;

/**
 *  账号密码
 */
@property (nonatomic, copy,readonly)NSString *password;
/**
 *  通讯录
 */
@property (nonatomic, strong,readonly)ALAddressBook *addressBook;

/**
 *  设置账户密码
 */
- (void)setPassword:(NSString *)password forAccount:(AlumusAccount *)account;

@end
