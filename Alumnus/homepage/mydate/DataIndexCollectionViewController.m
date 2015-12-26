//
//  DataIndexCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "DataIndexCollectionViewController.h"
#import "DataIndexCollectionViewCell.h"
#import "MyDataModel.h"
#import "KSYWebViewController.h"

@interface DataIndexCollectionViewController ()

@end

@implementation DataIndexCollectionViewController
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
    [self.collectionView registerClass:[DataIndexCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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
    DataIndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    MyDataModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    cell.startTimeLabel.text = [NSString stringWithFormat:@"%@~%@",model.START_TIME,model.END_TIME];
    cell.TitleLabel.text = model.CAL_TITLE;
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyDataModel *model = [_dataSource objectAtIndex:indexPath.row];
    KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
    if (model.CAL_USER_ID.length!=0) {
        webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=SY_COMM_CAL_REC_V%%26pkCode=%@",model.CAL_USER_ID]];
        NSLog(@"%@",webVC.url);
        [self presentViewController:webVC animated:NO completion:nil];
    }
    else{
        
    }
  
}


@end
