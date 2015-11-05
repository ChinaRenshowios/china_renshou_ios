//
//  MyWaitIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MyWaitIndexViewController.h"
#import "KSYWaitCollectionViewController.h"
#import "MyWaitModel.h"
#import "MyWaitReponseModel.h"
#import "ALBaseModel.h"

@interface MyWaitIndexViewController (){
    UIScrollView *chooseSegView;     //可滑动的选项卡view
    //  下选中边缘
    UIView *downEdgeView;
    UIScrollView *childrenSegView;   //子选项卡
    UIButton *waitButton;//待办按钮
    UIButton *waitReadButton;//待阅按钮
    UIButton *dataButton;//日程按钮
    
    //开关
    BOOL innerNetUsed;
    BOOL oaUsed;
    BOOL waitWorkUsed;
    BOOL waitReadUsed;
    BOOL dataUsed;
    //展示数据源
    NSMutableArray *dataSource;
    //show data
    //KSYWaitCollectionViewController *collectionVC;
    
    int currentPage;
    
}
@property (nonatomic, strong) MBProgressHUD *progress;
@end

@implementation MyWaitIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];     //添加子控件
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupSubviews{
#pragma mark 选项卡
    chooseSegView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,self.nav.frame.size.height, SIZEWIDTH,44)];
    chooseSegView.backgroundColor = VIEW_BG_COLOR_Light;
//  按钮
    //内网按钮
    UIButton *innerNetButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [innerNetButton setTitle:@"内网" forState:UIControlStateNormal];
    [innerNetButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    innerNetButton.tag = 1;
    [innerNetButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:innerNetButton];
    //OA按钮
    UIButton *oaButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2,0, SIZEWIDTH/2,chooseSegView.frame.size.height)];
    [oaButton setTitle:@"OA" forState:UIControlStateNormal];
    [oaButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    oaButton.tag = 2;
    
    [oaButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:oaButton];
    //  下选中边缘
    downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,chooseSegView.frame.size.height-2,SIZEWIDTH/2, 2)];
    downEdgeView.backgroundColor = [UIColor orangeColor];
    [chooseSegView addSubview:downEdgeView];
    [self.view addSubview:chooseSegView];
    
    childrenSegView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,chooseSegView.frame.size.height+chooseSegView.frame.origin.y,SIZEWIDTH,44)];
    childrenSegView.backgroundColor = VIEW_BG_COLOR_Light;
    [self.view addSubview:childrenSegView];

    waitButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH/3,44)];
    [waitButton setBackgroundColor:[UIColor whiteColor]];
    [waitButton setTitle:@"待办" forState:UIControlStateNormal];
    [waitButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    waitButton.tag = 3;
    [waitButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [childrenSegView addSubview:waitButton];
    waitReadButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/3,0,SIZEWIDTH/3, 44)];
    waitReadButton.backgroundColor = VIEW_BG_COLOR_Light;
    waitReadButton.tag = 4;
    [waitReadButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [waitReadButton setTitle:@"待阅" forState:UIControlStateNormal];
    [waitReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [childrenSegView addSubview:waitReadButton];
    dataButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH*2/3,0,SIZEWIDTH/3, 44)];
    dataButton.backgroundColor = VIEW_BG_COLOR_Light;
    [dataButton setTitle:@"日程" forState:UIControlStateNormal];
    [dataButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    dataButton.tag = 5;
    [dataButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [childrenSegView addSubview:dataButton];
    UIView *upEdgeInView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIZEWIDTH,1)];
    upEdgeInView.backgroundColor = [UIColor grayColor];
    [childrenSegView addSubview:upEdgeInView];
    UIView *downEdgeInView = [[UIView alloc] initWithFrame:CGRectMake(0,43,SIZEWIDTH,1)];
    downEdgeInView.backgroundColor = [UIColor grayColor];
    [childrenSegView addSubview:downEdgeInView];
    innerNetUsed = YES;
    waitWorkUsed = YES;
    
    dataSource = [[NSMutableArray alloc] init];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    _collectionVC = [[KSYWaitCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:dataSource];
    _collectionVC.collectionView.scrollEnabled = YES;
    _collectionVC.collectionView.frame = CGRectMake(0,childrenSegView.frame.origin.y+childrenSegView.frame.size.height,SIZEWIDTH,_collectionVC.collectionView.frame.size.height-(childrenSegView.frame.origin.y+childrenSegView.frame.size.height));
    _collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:_collectionVC];
    [self.view addSubview:_collectionVC.collectionView];
    currentPage = 1;
    [self requestType:KSYRequestTypeOfWaitingWork WithPage:@"1"];
    
}
#pragma mark 选项卡点击
-(void)didClickChooseButton:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            downEdgeView.frame = CGRectMake(0,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            innerNetUsed = YES;
            oaUsed = NO;
            [self chooseChildrenSeg:1];
            break;
        case 2:
            downEdgeView.frame = CGRectMake(SIZEWIDTH/2,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            oaUsed = YES;
            innerNetUsed = NO;
            [self chooseChildrenSeg:1];
            break;
        case 3:
             [self chooseChildrenSeg:1];
             break;
        case 4:
         [self chooseChildrenSeg:2];
        break;
        case 5:
         [self chooseChildrenSeg:3];
            break;
        default:
            break;
    }
}
-(void)chooseChildrenSeg:(NSInteger)index{
    if (index == 1) {
        waitWorkUsed = YES;
        waitReadUsed = NO;
        dataUsed = NO;
        waitButton.backgroundColor = [UIColor whiteColor];
        [waitButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        waitReadButton.backgroundColor = VIEW_BG_COLOR_Light;
        [waitReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        dataButton.backgroundColor = VIEW_BG_COLOR_Light;
        [dataButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //切换到第一栏
        if (innerNetUsed) {
            [dataSource removeAllObjects];
            currentPage = 1;
            [self requestType:KSYRequestTypeOfWaitingWork WithPage:@"1"];
        }
        if (oaUsed) {
            [dataSource removeAllObjects];
            currentPage = 1;
            [_collectionVC.collectionView reloadData];
        }
        
    }
    else if (index == 2){
        waitWorkUsed = NO;
        waitReadUsed = YES;
        dataUsed = NO;
        waitButton.backgroundColor = VIEW_BG_COLOR_Light;
        [waitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        waitReadButton.backgroundColor = [UIColor whiteColor];
        [waitReadButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        dataButton.backgroundColor = VIEW_BG_COLOR_Light;
        [dataButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        if (innerNetUsed) {
            [dataSource removeAllObjects];
            currentPage = 1;
            [self requestType:KSYRequestTypeOfWaitingRead WithPage:@"1"];
        }
        if (oaUsed) {
            [dataSource removeAllObjects];
            currentPage = 1;
            [_collectionVC.collectionView reloadData];
        }
    }
    else if (index == 3){
        waitWorkUsed = NO;
        waitReadUsed = NO;
        dataUsed = YES;
        waitButton.backgroundColor = VIEW_BG_COLOR_Light;
        [waitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        waitReadButton.backgroundColor = VIEW_BG_COLOR_Light;
        [waitReadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        dataButton.backgroundColor = [UIColor whiteColor];
        [dataButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
}
#pragma mark 网络请求
-(void)requestType:(KSYRequestType)type WithPage:(NSString *)page{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"s_mtime desc" forKey:@"_ORDER_"];
    [dict setValue:@"AND owner_code like '1Xvd5e5X50O8J0Ir-0zlwd'" forKey:@"_WHERE_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [dict setValue:@"1" forKey:@"TODO_CATALOG"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [dict setValue:@"15" forKey:@"_ROWNUM_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"OWNER_CODE"] forKey:@"OWNER_CODE"];
    [dict setValue:page forKey:@"NOWPAGE"];
    [self setupProgressHUD];
    if (type == KSYRequestTypeOfWaitingWork) {
        [ALNetWorkApi toDoWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                MyWaitReponseModel *model = [MyWaitReponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyWaitModel *responsemodel = [MyWaitModel getEntityFromDic:model._DATA_[i]];
                    [dataSource addObject:responsemodel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestTypeOfWaitingRead){
        [ALNetWorkApi toReadWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                MyWaitReponseModel *model = [MyWaitReponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyWaitModel *responsemodel = [MyWaitModel getEntityFromDic:model._DATA_[i]];
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
#pragma mark 上拉刷新
- (void)setupRefresh
{
    __weak MyWaitIndexViewController *weakSelf = self;
    
    // 下拉刷新
/*    [[weakSelf.collectionVC.collectionView addH]:^{
        currentPage = 1;
        [dataSource removeAllObjects];
        [weakSelf requestType:KSYRequestTypeOfWaitingWork WithPage:@"1"];
        //[weakSelf.tableView.header endRefreshing];
        
    }];
    
    // 上拉刷新
    [weakSelf.tableView addLegendFooterWithRefreshingBlock:^{
        currentPage++;
        NSString *page = [[NSString alloc] initWithFormat:@"%d",currentPage];
        [weakSelf requestList:page WithType:_type];
        // [weakSelf startRequestAllActive:page category:requestAll];
        [weakSelf.tableView.footer setTitle:@"点击或上拉加载数据" forState:MJRefreshFooterStateIdle];
        
        [weakSelf.tableView.footer endRefreshing];
    }];
    [weakSelf.tableView.footer setTitle:@"" forState:MJRefreshFooterStateIdle];
    //self.collectionVC.collectionView.footer.hidden = YES;
 */
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
@end
