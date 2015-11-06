//
//  MyUnforgetIndexViewController.h
//  Alumnus
//
//  Created by ksy on 15/10/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYPresentCommonViewController.h"
#import "MyUnforgotCollectionViewController.h"

@interface MyUnforgetIndexViewController : KSYPresentCommonViewController
@property (strong,nonatomic) NSMutableArray *datasource;
@property (strong,nonatomic) MyUnforgotCollectionViewController *collectionVC;
@end
