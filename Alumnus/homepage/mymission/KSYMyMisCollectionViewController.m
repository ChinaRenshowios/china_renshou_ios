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
#import "KSYWebViewController.h"

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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == KSYMisListTypeOfRecieve) {
        MyMissonModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=PT_RENWU_JOIN%%26pkCode=%@",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else{
        MyApplyMissionModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=PT_RENWU%%26pkCode=%@",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }

    
}

@end
