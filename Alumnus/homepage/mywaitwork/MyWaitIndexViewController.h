//
//  MyWaitIndexViewController.h
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,KSYRequestType){
    KSYRequestTypeOfWaitingWork,
    KSYRequestTypeOfWaitingRead,
};
@interface MyWaitIndexViewController : KSYPresentCommonViewController


-(void)requestType:(KSYRequestType)type WithPage:(NSString *)page;
@end
