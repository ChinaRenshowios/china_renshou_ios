//
//  MyUnforgotCollectionViewController.h
//  Alumnus
//
//  Created by ksy on 15/10/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUnforgotCollectionViewController : UICollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array;

@property(strong, nonatomic) NSMutableArray *dataSource;

@end
