//
//  MyCollectionIndexViewController.h
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYPresentCommonViewController.h"
#import "MyCollectCollectionViewController.h"
typedef NS_ENUM(NSInteger,KSYRequestCollectType){
    KSYRequestCollectTypeOfKnowCenter,
    KSYRequestCollectTypeOfInfor
};
@interface MyCollectionIndexViewController : KSYPresentCommonViewController
@property (strong,nonatomic)MyCollectCollectionViewController *collectionVC;
-(void)requestMyCollectOfType:(KSYRequestCollectType)type page:(NSString *)page;
@end
