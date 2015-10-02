//
//  CommonWithHeadFootCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/2.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "CommonWithHeadFootCollectionViewController.h"
#import "CommonWithHeadFootCollectionViewCell.h"
#import "KnowCenterFootCollectionReusableView.h"
#import "KnowCenterHeadCollectionReusableView.h"

@interface CommonWithHeadFootCollectionViewController ()

@end

@implementation CommonWithHeadFootCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
#pragma mark ---------------------------type == 1--------------------------------
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout source:(NSMutableArray *)array
{
    self = [super initWithCollectionViewLayout:layout];
    _dataSource = array;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CommonWithHeadFootCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[KnowCenterHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView registerClass:[KnowCenterFootCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    
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
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    //type为1的footer和header
    if ([_type isEqual:@"1"]) {
        if (kind == UICollectionElementKindSectionHeader) {
            KnowCenterHeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
            if (indexPath.section == 0) {
                headerView.label.text = @"教育信息";
            }
            else if (indexPath.section ==1){
                headerView.label.text = @"工作信息";
            }
            reusableView = headerView;
        }
        else if (kind == UICollectionElementKindSectionFooter){
            KnowCenterFootCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
            if (indexPath.section == 0) {
               footerView.label.text = @"更多动态";
            }
            else if (indexPath.section ==1){
               footerView.label.text = @"更多热门";
            }
            
            reusableView = footerView;
        }
    }

    
    return reusableView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([_type isEqual:@"1"]) {
        return _dataSource.count;
    }
    return _dataSource.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CommonWithHeadFootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
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
