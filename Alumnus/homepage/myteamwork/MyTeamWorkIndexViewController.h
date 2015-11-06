//
//  MyTeamWorkIndexViewController.h
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYPresentCommonViewController.h"
#import "MyTeamWorkCollectionViewController.h"
typedef NS_ENUM(NSInteger,KSYRequestTeamWorkType){
    KSYRequestTeamWorkTypeOfMyTeam,
    KSYRequestTeamWorkTypeOfOtherTeam
};
@interface MyTeamWorkIndexViewController : KSYPresentCommonViewController
@property (strong,nonatomic)MyTeamWorkCollectionViewController *collectionVC;
-(void)requestMyTeamOfType:(KSYRequestTeamWorkType)type page:(NSString *)page;
@end
