//
//  MyTeamWorkCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyTeamWorkCollectionViewController.h"
#import "MyTeamWorkCollectionViewCell.h"
#import "MyTeamWorkModel.h"

@interface MyTeamWorkCollectionViewController ()

@end

@implementation MyTeamWorkCollectionViewController
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
    [self.collectionView registerClass:[MyTeamWorkCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyTeamWorkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (_type == KSYTeamWorkCollectionTypeOfMyTeam) {
        MyTeamWorkModel *model = [_dataSource objectAtIndex:indexPath.row];
        cell.titleLabel.text = model.INFO_TITLE;
        cell.nameLabel.text = model.INFO_CREATER__NAME;
        cell.isUsedLabel.text = [NSString stringWithFormat:@"启用:%@",model.INFO_STATE__NAME];
    }
    else if(_type == KSYTeamWorkCollectionTypeOfOtherTeam){
        MyTeamWorkModel *model = [_dataSource objectAtIndex:indexPath.row];
        cell.titleLabel.text = model.INFO_TITLE;
        cell.nameLabel.text = model.INFO_CREATER__NAME;
        cell.isUsedLabel.text = [NSString stringWithFormat:@"启用:%@",model.INFO_STATE__NAME];
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
