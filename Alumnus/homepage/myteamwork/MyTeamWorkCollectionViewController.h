//
//  MyTeamWorkCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,KSYTeamWorkCollectionType){
    KSYTeamWorkCollectionTypeOfMyTeam,
    KSYTeamWorkCollectionTypeOfOtherTeam
};
@interface MyTeamWorkCollectionViewController : UICollectionViewController
@property(strong,nonatomic) NSMutableArray *dataSource;
@property(assign,nonatomic)KSYTeamWorkCollectionType type;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;
@end
