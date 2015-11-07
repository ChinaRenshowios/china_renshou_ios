//
//  MyUnforgetIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyUnforgetIndexViewController.h"
#import "MyUnforgotCollectionViewController.h"
#import "MyUnforgotModel.h"
#import "MyUnforgotResponseModel.h"

#define IsUpdateUnforgot @"is_Updata_Service_Of_MyUnforgot"
#define My_UnforgotData @"My_UnforgotData"
@interface MyUnforgetIndexViewController (){
    UISearchBar *searchBar;    //搜索
    
    
    int currentPage;
}
@property (nonatomic, strong) MBProgressHUD *progress;
@end

@implementation MyUnforgetIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark 右上添加按钮
    UIView *addView = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH-50,20,40,40)];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addView addSubview:addButton];
    [addButton addTarget:self action:@selector(didClickAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:addView];
    //搜索
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,64,SIZEWIDTH,40)];
    searchBar.placeholder = @"搜索";
    [self.view addSubview:searchBar];
    ////  展示数据
    _datasource = [[NSMutableArray alloc] init];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    _collectionVC = [[MyUnforgotCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:_datasource];
    _collectionVC.collectionView.scrollEnabled = YES;
    _collectionVC.collectionView.frame = CGRectMake(0,searchBar.frame.origin.y+searchBar.frame.size.height,SIZEWIDTH,SIZEHEIGHT-(searchBar.frame.origin.y+searchBar.frame.size.height));
    _collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:_collectionVC];
    [self.view addSubview:_collectionVC.collectionView];
    currentPage = 1;
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:IsUpdateUnforgot]){
        [self requestUnforgotOfpage:@"1"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:IsUpdateUnforgot];
    }
    else{
        NSMutableArray *array = [[NSUserDefaults standardUserDefaults] valueForKey:My_UnforgotData];
        for (int i = 0;i<array.count;i++) {
            MyUnforgotModel *teamModel = [MyUnforgotModel getEntityFromDic:array[i]];
            [_datasource addObject:teamModel];
        }
        [_collectionVC.collectionView reloadData];
        
    }
    [self setupRefresh];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickAdd{
    
}
-(void)requestUnforgotOfpage:(NSString *)page{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [dict setValue:@"true" forKey:@"_IS_DES_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [self setupProgressHUD];
    [ALNetWorkApi myUnforgetWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
        if (success) {
            //NSLog(@"array count = %@",responseData);
            NSMutableDictionary *dic = responseData;
            MyUnforgotResponseModel *model = [MyUnforgotResponseModel getEntityFromDic:dic];
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:model._DATA_ forKey:My_UnforgotData];
            NSLog(@"%ld",model._DATA_.count);
            for (int i = 0;i<model._DATA_.count;i++) {
                MyUnforgotModel *teamModel = [MyUnforgotModel getEntityFromDic:model._DATA_[i]];
                [_datasource addObject:teamModel];
            }
            [_collectionVC.collectionView reloadData];
            
        }else{
            NSLog(@"responseData - %@ message%@",responseData,message);
            
        }
        [_progress hide:YES];
    }];

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
    __weak MyUnforgetIndexViewController *weakSelf = self;
    // 下拉刷新
    weakSelf.collectionVC.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [_datasource removeAllObjects];
        currentPage = 1;
        [weakSelf.collectionVC.collectionView reloadData];
        [self requestUnforgotOfpage:@"1"];
        
        [weakSelf.collectionVC.collectionView.header endRefreshing];
        
        
    }];
}


@end
