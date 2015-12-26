//
//  MyCollectCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyCollectCollectionViewController.h"
#import "MyInforCollectModel.h"
#import "MyKnowCenterCollectModel.h"
#import "MyCollectCollectionViewCell.h"
#import "KSYWebViewController.h"

@interface MyCollectCollectionViewController ()

@end

@implementation MyCollectCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
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
    [self.collectionView registerClass:[MyCollectCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (_type == KSYCollectCollectionTypeOfKnowCenter) {
        MyKnowCenterCollectModel *model = [_dataSource objectAtIndex:indexPath.row];
        cell.stateLabel.text = model.SERV_ID__NAME;
        cell.titleLabel.text = model.DATA_DIS_NAME;
        cell.nameLabel.text = model.DATA_OWNER__NAME;        
    }
    if (_type == KSYCollectCollectionTypeOfInfor) {
        MyKnowCenterCollectModel *model = [_dataSource objectAtIndex:indexPath.row];
        cell.stateLabel.text = model.SERV_ID__NAME;
        cell.titleLabel.text = model.DATA_DIS_NAME;
        cell.nameLabel.text = model.DATA_OWNER__NAME;
    }
   
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == KSYCollectCollectionTypeOfKnowCenter) {
        MyKnowCenterCollectModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_ZHIDAO_QUESTION/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else{
        MyKnowCenterCollectModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_INFOS/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    
    
}


@end
