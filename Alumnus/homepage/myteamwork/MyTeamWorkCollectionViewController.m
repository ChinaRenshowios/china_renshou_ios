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
#import "KSYWebViewController.h"

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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == KSYTeamWorkCollectionTypeOfMyTeam) {
        MyTeamWorkModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=PT_GROUP_INFO%%26pkCode=%@",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else{
        MyTeamWorkModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=PT_GROUP_INFO_OTHER%%26pkCode=%@",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }

    
}
@end
