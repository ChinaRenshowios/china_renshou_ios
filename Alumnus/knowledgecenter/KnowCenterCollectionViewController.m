//
//  KnowCenterCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KnowCenterCollectionViewController.h"
#import "KnowCenterCollectionViewCell.h"
#import "AskAndAnswerModel.h"
#import "CommonWithHeadFootCollectionViewCell.h"
#import "MyUploadDocumentModel.h"

@interface KnowCenterCollectionViewController ()

@end

@implementation KnowCenterCollectionViewController

static NSString * const askCenterIdentifier = @"askCenterCell";
static NSString * const documentCenterIdentifier = @"documentCenterCell";
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
    [self.collectionView registerClass:[KnowCenterCollectionViewCell class] forCellWithReuseIdentifier:askCenterIdentifier];
    [self.collectionView registerClass:[CommonWithHeadFootCollectionViewCell class] forCellWithReuseIdentifier:documentCenterIdentifier];
    
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
    if (_type == KSYKnowCenterShowTypeOfMyAsk||_type==KSYKnowCenterShowTypeOfMyConsern||_type == KSYKnowCenterShowTypeOfAllQuestion||_type == KSYKnowCenterShowTypeOfWaitMeAnswer) {
        
        NSLog(@"问答中心");
        KnowCenterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:askCenterIdentifier forIndexPath:indexPath];
        if (_type == KSYKnowCenterShowTypeOfMyAsk) {
            AskAndAnswerModel *model = _dataSource[indexPath.row];
            cell.titleLabel.text = model.USER_DESC;
            cell.timeLabel.text = model.USER_ID__NAME;
        }
        
        return cell;
    }
    else if (_type == KSYKnowCenterShowTypeOfMyUploadDocument||_type==KSYKnowCenterShowTypeOfPopularDocument||_type==KSYKnowCenterShowTypeOfNewestDocument){
        CommonWithHeadFootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:documentCenterIdentifier forIndexPath:indexPath];
        NSLog(@"文档中心");
        MyUploadDocumentModel *model = _dataSource[indexPath.row];
        cell.titleLabel.text = model.DOCUMENT_TITLE;
        cell.timeAndPersonLabel.text = [NSString stringWithFormat:@"%@ %@提问",model.S_CTIME,model.S_UNAME];
        cell.attentionLabel.text = [NSString stringWithFormat:@"%@ 关注",model.DOCUMENT_READ_COUNTER];
        cell.responseLabel.text = [NSString stringWithFormat:@"%@ 回复",model.DOCUMENT_SCORER_COUNTER];
            
        

        return cell;
    }
    return nil;

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
