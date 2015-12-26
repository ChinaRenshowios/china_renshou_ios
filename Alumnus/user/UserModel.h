//
//  UserModel.h
//  Alumnus
//
//  Created by ksy on 15/11/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@interface UserModel : ALBaseModel
@property(copy,nonatomic)NSString *ODEPT_CODE;
@property (copy,nonatomic)NSString *USER_CODE;
@property(copy,nonatomic)NSString *OWNER_CODE;
@property (copy,nonatomic)NSString *mobileDeviceId;
@end
