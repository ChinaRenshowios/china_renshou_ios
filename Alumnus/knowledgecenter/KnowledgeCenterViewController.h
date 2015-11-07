//
//  KnowledgeCenterViewController.h
//  Alumnus
//
//  Created by ksy on 15/8/19.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSYCommonNaviViewController.h"
#import "KnowCenterCollectionViewController.h"
typedef NS_ENUM(NSInteger,KSYRequestKnowCenterType){
    KSYRequestKnowCenterTypeOfMyAsk,
    KSYRequestKnowCenterTypeOfMyConcern,
    KSYRequestKnowCenterTypeOfAllQuestion,
    KSYRequestKnowCenterTypeOfWaitMeAnswer,
    KSYRequestKnowCenterTypeOfMyUploadDocument,
    KSYRequestKnowCenterTypeOfPopularDocument,
    KSYRequestKnowCenterTypeOfNewestDocument
};
@interface KnowledgeCenterViewController : KSYCommonNaviViewController
@property (strong,nonatomic) NSMutableArray *datasourse;
@property (strong,nonatomic) KnowCenterCollectionViewController *collectionVC;
@end
