//
//  MyMissonIndexViewController.h
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KSYPresentCommonViewController.h"
#import "KSYMyMisCollectionViewController.h"
typedef NS_ENUM(NSInteger,KSYRequestMissionType){
    KSYRequestTypeMyRecieve,
    KSYRequestTypeMyApply
};
@interface MyMissonIndexViewController : KSYPresentCommonViewController

@property (strong,nonatomic)KSYMyMisCollectionViewController *collectionVC;
-(void)requestMyMissonOfType:(KSYRequestMissionType)type page:(NSString *)page;
@end
