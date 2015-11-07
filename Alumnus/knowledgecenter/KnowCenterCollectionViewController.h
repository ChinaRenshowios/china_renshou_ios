//
//  KnowCenterCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,KSYKnowCenterShowType){
    KSYKnowCenterShowTypeOfMyAsk,
    KSYKnowCenterShowTypeOfMyConsern,
    KSYKnowCenterShowTypeOfAllQuestion,
    KSYKnowCenterShowTypeOfWaitMeAnswer,
    KSYKnowCenterShowTypeOfMyUploadDocument,
    KSYKnowCenterShowTypeOfPopularDocument,
    KSYKnowCenterShowTypeOfNewestDocument
};
@interface KnowCenterCollectionViewController : UICollectionViewController


@property(strong,nonatomic) NSMutableArray *dataSource;
@property(assign,nonatomic)KSYKnowCenterShowType type;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;
@end
