//
//  KSYWaitCollectionViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/31.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "KSYWaitCollectionViewController.h"
#import "KSYWaitCollectionViewCell.h"
#import "MyWaitModel.h"
#import "KSYWebViewController.h"

@interface KSYWaitCollectionViewController ()

@end

@implementation KSYWaitCollectionViewController

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
    [self.collectionView registerClass:[KSYWaitCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



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
    KSYWaitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    MyWaitModel *model = [_dataSource objectAtIndex:indexPath.row];
    cell.titleLabel.text =model.TODO_TITLE;
    cell.nameLabel.text = model.SEND_USER_CODE__NAME;
    cell.timeLabel.text = model.TODO_SEND_TIME;
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        MyWaitModel *model = [_dataSource objectAtIndex:indexPath.row];
        KSYWebViewController *webVC =[[KSYWebViewController alloc] init];
        if ([model.TODO_URL containsString:@".byid.do"]) {
            webVC.url = [ZCNSStringUtil getMainUrl:[NSString stringWithFormat:@"/sy/base/view/stdCardView.jsp?sId=%@%%26pkCode=%@",model.SERV_ID,model.TODO_OBJECT_ID1]];
            NSLog(@"%@",webVC.url);
            [self presentViewController:webVC animated:NO completion:nil];
        }
        else{
            webVC.url = [ZCNSStringUtil getMainUrl:model.TODO_URL];
            [self presentViewController:webVC animated:NO completion:nil];
        }
}


@end
