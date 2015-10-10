//
//  CommonWithHeadFootCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/10/2.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonWithHeadFootCollectionViewController : UICollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;

@property(strong, nonatomic) NSMutableArray *dataSource;
 //type 标示复用信息
/*
@type :－－－－－－ type为1为知识中心首页－－－－－ 
 
 
 
*/
@property (strong,nonatomic) NSString *type;
@end
