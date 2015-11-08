//
//  MyMeetingModel.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "ALBaseModel.h"

@interface MyMeetingPagesModel : ALBaseModel
@property (nonatomic, copy)NSString *NOWPAGE;
@property (nonatomic, copy)NSString *PAGES;
@property (nonatomic, copy)NSString *ALLNUM;
@property (nonatomic, copy)NSString *SHOWNUM;

@end






@interface MyMeetingModel : ALBaseModel
@property (nonatomic, copy)NSString *REM_CONTENT;
@property (nonatomic, copy)NSString *REM_TITLE;
@property (nonatomic, copy)NSString *_PK_;
@property (nonatomic, copy)NSString *USER_ID;
@property (nonatomic, copy)NSString *TYPE__NAME;
@property (nonatomic, copy)NSString *ROWNUM_;
@property (nonatomic, copy)NSString *S_EMERGENCY;
@property (nonatomic, copy)NSString *STATUS;
@property (nonatomic, copy)NSString *S_USER;
@property (nonatomic, copy)NSString *EXECUTE_TIME;
@property (nonatomic, copy)NSString *S_USER__NAME;
@property (nonatomic, copy)NSString *REMOTE_URL;
@property (nonatomic, copy)NSString *_ROWNUM_;
@property (nonatomic, copy)NSString *USER_ID__NAME;
@property (nonatomic, copy)NSString *TYPE;
@property (nonatomic, copy)NSString *REM_GROUP;
@property (nonatomic, copy)NSString *S_EMERGENCY__NAME;
@property (nonatomic, copy)NSString *REM_ID;
@property (nonatomic, copy)NSString *S_ATIME;
@property (nonatomic, copy)NSString *STATUS__NAME;

//@property (nonatomic, copy)NSString *_OKCOUNT_;
//@property (nonatomic, copy)NSString *_MSG_;
//@property (nonatomic, copy)NSString *_MOBILE_RES_CODE_;
//@property (nonatomic, copy)NSString *_TIME_;
//@property (nonatomic, copy)NSString *_COLS_;
//@property (nonatomic, strong)NSMutableArray *_DATA_;
//@property (nonatomic, strong)MyMeetingPagesModel *_PAGE_;
@end


@interface MyMeetingDataModel : ALBaseModel

@end

