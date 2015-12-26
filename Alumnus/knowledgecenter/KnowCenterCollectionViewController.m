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
#import "MyAskModel.h"
#import "KSYWebViewController.h"

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
            MyAskModel *model = _dataSource[indexPath.row];
            cell.titleLabel.text = model.Q_TITLE;
            cell.timeLabel.text = model.S_ATIME;
        }
        else if (_type == KSYKnowCenterShowTypeOfMyConsern){
            MyAskModel *model = _dataSource[indexPath.row];
            cell.titleLabel.text = model.Q_TITLE;
            cell.timeLabel.text = model.S_ATIME;
        }
        else if (_type == KSYKnowCenterShowTypeOfAllQuestion){
            MyAskModel *model = _dataSource[indexPath.row];
            cell.titleLabel.text = model.Q_TITLE;
            cell.timeLabel.text = model.S_ATIME;
        }
        else if (_type == KSYKnowCenterShowTypeOfWaitMeAnswer){
            MyAskModel *model = _dataSource[indexPath.row];
            cell.titleLabel.text = model.Q_TITLE;
            cell.timeLabel.text = model.S_ATIME;
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == KSYKnowCenterShowTypeOfMyUploadDocument) {
        MyUploadDocumentModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_WENKU_DOCUMENT/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else if(_type == KSYKnowCenterShowTypeOfPopularDocument){
        MyUploadDocumentModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_WENKU_DOCUMENT/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else if (_type == KSYKnowCenterShowTypeOfNewestDocument){
        MyUploadDocumentModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_WENKU_DOCUMENT/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    else if (_type == KSYKnowCenterShowTypeOfMyAsk||_type == KSYKnowCenterShowTypeOfMyConsern||_type == KSYKnowCenterShowTypeOfAllQuestion||_type == KSYKnowCenterShowTypeOfWaitMeAnswer){
        MyAskModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if (model._PK_.length!=0) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/cms/SY_COMM_ZHIDAO_QUESTION/%@.html",model._PK_]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            
        }
    }
    
    
}
@end
