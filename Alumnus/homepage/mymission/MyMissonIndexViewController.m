//
//  MyMissonIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MyMissonIndexViewController.h"
#import "KSYMyMisCollectionViewController.h"
#import "MyMissionResponseModel.h"
#import "MyMissonModel.h"
#import "MyApplyMissionModel.h"

@interface MyMissonIndexViewController (){
    UIScrollView *chooseSegView;     //可滑动的选项卡view
    //  下选中边缘
    UIView *downEdgeView;
    
    NSMutableArray *dataSource;
    
    int currentPage;
    BOOL myRecieveUsed;
    BOOL myApplyUsed;

}
@property (nonatomic, strong) MBProgressHUD *progress;
@end

@implementation MyMissonIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark 选项卡
    chooseSegView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.nav.frame.size.height, SIZEWIDTH,44)];
    chooseSegView.backgroundColor = VIEW_BG_COLOR_Light;
    //  按钮
    //接收的任务按钮
    UIButton *reciveMisButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [reciveMisButton setTitle:@"我接收的任务" forState:UIControlStateNormal];
    [reciveMisButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    reciveMisButton.tag = 1;
    [reciveMisButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:reciveMisButton];
    //发起的任务按钮
    UIButton *applyMisButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [applyMisButton setTitle:@"我发起的任务" forState:UIControlStateNormal];
    [applyMisButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    applyMisButton.tag = 2;
    
    [applyMisButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:applyMisButton];
    //  下选中边缘
    downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,chooseSegView.frame.size.height-2,SIZEWIDTH/2, 2)];
    downEdgeView.backgroundColor = [UIColor orangeColor];
    [chooseSegView addSubview:downEdgeView];
    [self.view addSubview:chooseSegView];
    
    dataSource = [[NSMutableArray alloc] init];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    _collectionVC = [[KSYMyMisCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:dataSource];
    _collectionVC.collectionView.scrollEnabled = YES;
    _collectionVC.collectionView.frame = CGRectMake(0,chooseSegView.frame.origin.y+chooseSegView.frame.size.height,SIZEWIDTH,_collectionVC.collectionView.frame.size.height-(chooseSegView.frame.origin.y+chooseSegView.frame.size.height));
    _collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    _collectionVC.type = KSYMisListTypeOfRecieve;
    myRecieveUsed = YES;
    [self addChildViewController:_collectionVC];
    [self.view addSubview:_collectionVC.collectionView];
    currentPage = 1;
    [self requestMyMissonOfType:KSYRequestTypeMyRecieve page:@"1"];
    [self setupRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 选项卡点击
-(void)didClickChooseButton:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            myRecieveUsed = YES;
            myApplyUsed = NO;
            downEdgeView.frame = CGRectMake(0,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            currentPage = 1;
            [dataSource removeAllObjects];
            _collectionVC.type = KSYMisListTypeOfRecieve;
            [self requestMyMissonOfType:KSYRequestTypeMyRecieve page:@"1"];
            break;
        case 2:
            myApplyUsed = YES;
            myRecieveUsed = NO;
            downEdgeView.frame = CGRectMake(SIZEWIDTH/2,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            currentPage = 1;
            [dataSource removeAllObjects];
            _collectionVC.type = KSYMisListTypeOfApply;
            [self requestMyMissonOfType:KSYRequestTypeMyApply page:@"1"];
            break;
        default:
            break;
    }
}
#pragma mark ---------------------网络请求----------------------------------
-(void)requestMyMissonOfType:(KSYRequestMissionType)type page:(NSString *)page{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"s_mtime desc" forKey:@"_ORDER_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [dict setValue:@"true" forKey:@"_IS_DES_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [dict setValue:@"15" forKey:@"_ROWNUM_"];
    [dict setValue:page forKey:@"NOWPAGE"];
    [self setupProgressHUD];
    if (type == KSYRequestTypeMyRecieve) {
        [ALNetWorkApi myJobWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyMissonModel *responsemodel = [MyMissonModel getEntityFromDic:model._DATA_[i]];
                    [dataSource addObject:responsemodel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestTypeMyApply){
        [ALNetWorkApi jobSendFromMeWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                MyMissionResponseModel *model = [MyMissionResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyApplyMissionModel *responsemodel = [MyApplyMissionModel getEntityFromDic:model._DATA_[i]];
                    [dataSource addObject:responsemodel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }

}
//加载
- (void)setupProgressHUD
{
    _progress = [[MBProgressHUD alloc] initWithView:self.view];
    _progress.frame = self.view.bounds;
    _progress.minSize = CGSizeMake(100, 100);
    //    NSLog(@"view == %f%f",self.view.bounds.size.height,self.view.bounds.size.width);
    _progress.labelText = NSLocalizedString(@"加载中", nil);
    _progress.mode = MBProgressHUDModeIndeterminate;
    [self.view addSubview:_progress];
    [_progress hide:YES afterDelay:3.0];
    
    [_progress show:YES];
}

#pragma mark 上拉刷新
- (void)setupRefresh
{
    __weak MyMissonIndexViewController *weakSelf = self;
    // 下拉刷新
    weakSelf.collectionVC.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [dataSource removeAllObjects];
        currentPage = 1;
        [weakSelf.collectionVC.collectionView reloadData];
        if (myRecieveUsed) {
            [self requestMyMissonOfType:KSYRequestTypeMyRecieve page:@"1"];
        }
        else if (myApplyUsed){
            [self requestMyMissonOfType:KSYRequestTypeMyApply page:@"1"];
        }
        
        [weakSelf.collectionVC.collectionView.header endRefreshing];
        
        
    }];
    weakSelf.collectionVC.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        currentPage++;
        NSString *pageStr = [NSString stringWithFormat:@"%d",currentPage];
        
        if (myRecieveUsed) {
            [self requestMyMissonOfType:KSYRequestTypeMyRecieve page:pageStr];
        }
        else if (myApplyUsed){
            [self requestMyMissonOfType:KSYRequestTypeMyApply page:pageStr];
        }
        
        [weakSelf.collectionVC.collectionView.footer setState:MJRefreshStateIdle];
        
    }];
}

@end
