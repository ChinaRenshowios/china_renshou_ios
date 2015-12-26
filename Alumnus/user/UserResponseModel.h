//
//  UserResponseModel.h
//  Alumnus
//
//  Created by ksy on 15/11/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@interface UserResponseModel : ALBaseModel

@property(copy,nonatomic)NSString *_MOBILE_RES_CODE_;
@property(copy,nonatomic)NSString *_MSG_;
@property (copy,nonatomic)NSDictionary *USER_BEAN;

@end
