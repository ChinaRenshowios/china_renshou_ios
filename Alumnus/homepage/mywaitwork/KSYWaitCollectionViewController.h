//
//  KSYWaitCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/10/31.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
//枚举type复用
typedef NS_ENUM(NSInteger,KSYWaitListType){
    KSYWaitListTypeOfInnerAndWaitWork,
    KSYWaitListTypeOfInnerAndWaitRead,
    KSYWaitListTypeOfInnerAndData,
    KSYWaitListTypeOfOaAndWaitWork,
    KSYWaitListTypeOfOaAndWaitRead,
    KSYWaitListTypeOfOaAndData
};

@interface KSYWaitCollectionViewController : UICollectionViewController

@property(strong,nonatomic) NSMutableArray *dataSource;
@property(assign,nonatomic)KSYWaitListType type;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;
@end
