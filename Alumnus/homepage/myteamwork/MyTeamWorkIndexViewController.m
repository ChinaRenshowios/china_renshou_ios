//
//  MyTeamWorkIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyTeamWorkIndexViewController.h"
#import "TeamWorkResponseModel.h"
#import "MyTeamWorkModel.h"



@interface MyTeamWorkIndexViewController (){
    UIScrollView *chooseSegView;     //可滑动的选项卡view
    //  下选中边缘
    UIView *downEdgeView;
    
    NSMutableArray *dataSource;
    
    int currentPage;
    BOOL myTeamUsed;
    BOOL otherTeamUsed;
}
@property (nonatomic, strong) MBProgressHUD *progress;
@end

@implementation MyTeamWorkIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark 选项卡
    chooseSegView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.nav.frame.size.height, SIZEWIDTH,44)];
    chooseSegView.backgroundColor = VIEW_BG_COLOR_Light;
    //  按钮
    //接收的任务按钮
    UIButton *reciveMisButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [reciveMisButton setTitle:@"我的团队" forState:UIControlStateNormal];
    [reciveMisButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    reciveMisButton.tag = 1;
    [reciveMisButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:reciveMisButton];
    //发起的任务按钮
    UIButton *applyMisButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [applyMisButton setTitle:@"其他团队" forState:UIControlStateNormal];
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
    _collectionVC = [[MyTeamWorkCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:dataSource];
    _collectionVC.collectionView.scrollEnabled = YES;
    _collectionVC.collectionView.frame = CGRectMake(0,chooseSegView.frame.origin.y+chooseSegView.frame.size.height,SIZEWIDTH,_collectionVC.collectionView.frame.size.height-(chooseSegView.frame.origin.y+chooseSegView.frame.size.height));
    _collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    _collectionVC.type = KSYTeamWorkCollectionTypeOfMyTeam;
    myTeamUsed = YES;
    [self addChildViewController:_collectionVC];
    [self.view addSubview:_collectionVC.collectionView];
    currentPage = 1;
    [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfMyTeam page:@"1"];
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
            myTeamUsed = YES;
            otherTeamUsed = NO;
            downEdgeView.frame = CGRectMake(0,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            currentPage = 1;
            [dataSource removeAllObjects];
            _collectionVC.type = KSYTeamWorkCollectionTypeOfMyTeam;
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfMyTeam page:@"1"];
            break;
        case 2:
            otherTeamUsed = YES;
            myTeamUsed = NO;
            downEdgeView.frame = CGRectMake(SIZEWIDTH/2,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            currentPage = 1;
            [dataSource removeAllObjects];
            _collectionVC.type = KSYTeamWorkCollectionTypeOfOtherTeam;
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfOtherTeam page:@"1"];
            break;
        default:
            break;
    }
}
#pragma mark ---------------------网络请求----------------------------------
-(void)requestMyTeamOfType:(KSYRequestTeamWorkType)type page:(NSString *)page{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"s_mtime desc" forKey:@"_ORDER_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [dict setValue:@"true" forKey:@"_IS_DES_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [dict setValue:@"15" forKey:@"_ROWNUM_"];
    [dict setValue:page forKey:@"NOWPAGE"];
    [self setupProgressHUD];
    if (type == KSYRequestTeamWorkTypeOfMyTeam) {
        [ALNetWorkApi myTeamWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyTeamWorkModel *teamModel = [MyTeamWorkModel getEntityFromDic:model._DATA_[i]];
                    [dataSource addObject:teamModel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestTeamWorkTypeOfOtherTeam){
        [ALNetWorkApi theOtherTeamWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyTeamWorkModel *teamModel = [MyTeamWorkModel getEntityFromDic:model._DATA_[i]];
                    [dataSource addObject:teamModel];
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
    __weak MyTeamWorkIndexViewController *weakSelf = self;
    // 下拉刷新
    weakSelf.collectionVC.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [dataSource removeAllObjects];
        currentPage = 1;
        [weakSelf.collectionVC.collectionView reloadData];
        if (myTeamUsed) {
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfMyTeam page:@"1"];
        }
        else if (otherTeamUsed){
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfOtherTeam page:@"1"];
        }
        
        [weakSelf.collectionVC.collectionView.header endRefreshing];
        
        
    }];
    weakSelf.collectionVC.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        currentPage++;
        NSString *pageStr = [NSString stringWithFormat:@"%d",currentPage];
        
        if (myTeamUsed) {
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfMyTeam page:pageStr];
        }
        else if (otherTeamUsed){
            [self requestMyTeamOfType:KSYRequestTeamWorkTypeOfOtherTeam page:pageStr];
        }
        
        [weakSelf.collectionVC.collectionView.footer setState:MJRefreshStateIdle];
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
