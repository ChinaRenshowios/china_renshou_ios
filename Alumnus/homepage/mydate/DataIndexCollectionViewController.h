//
//  DataIndexCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataIndexCollectionViewController : UICollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;

@property(strong, nonatomic) NSMutableArray *dataSource;
//type 标示复用信息
/*
 @type :－－－－－－本人日程－－－－－
 
 
 
 */
@property (strong,nonatomic) NSString *type;
@end
