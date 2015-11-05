//
//  KSYMyMisCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/31.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYMyMisCollectionViewController.h"
#import "KSYMyMissonCollectionViewCell.h"
#import "MyMissonModel.h"
#import "MyApplyMissionModel.h"

@interface KSYMyMisCollectionViewController ()

@end

@implementation KSYMyMisCollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array
{
    self = [super initWithCollectionViewLayout:layout];
    _dataSource = array;
    return self;
}
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[KSYMyMissonCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KSYMyMissonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (_type == KSYMisListTypeOfRecieve) {
        MyMissonModel *model = _dataSource[indexPath.row];
        cell.stateLabel.text = model.REWUSTATE;
        cell.titleLabel.text = model.RENWUNAME;
        cell.nameLabel.text = model.CREATER__NAME;
        cell.timeLabel.text = model.DONETIME;
        cell.doneTimeLabel.text = model.RENWUTIME;
    }
    else if(_type == KSYMisListTypeOfApply){
        MyApplyMissionModel *model = _dataSource[indexPath.row];
        cell.stateLabel.text = model.RENWU_STATUS;
        cell.titleLabel.text = model.RENWU_TITLE;
        cell.timeLabel.text = model.RENWU_END;
        cell.nameLabel.text = model.RENWU_USERS__NAME;
        cell.doneTimeLabel.text = @"";
    }

    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
