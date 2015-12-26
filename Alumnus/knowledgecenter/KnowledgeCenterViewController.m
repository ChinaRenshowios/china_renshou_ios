//
//  KnowledgeCenterViewController.m
//  Alumnus
//
//  Created by ksy on 15/8/19.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KnowledgeCenterViewController.h"
#import "CommonWithHeadFootCollectionViewController.h"
#import "AskAndAnswerChooseSegView.h"
#import "TeamWorkResponseModel.h"
#import "AskAndAnswerModel.h"
#import "DocumentChooseSegView.h"
#import "MyUploadDocumentModel.h"
#import "MyAskModel.h"
#import "KSYWebViewController.h"

@interface KnowledgeCenterViewController ()<UISearchBarDelegate,AskAndAnswerChooseSegViewDelegate,DocumentChooseSegViewDelegate>{
    UIScrollView *mainScrollView;  //包装在scrollerview中
    UISearchBar *_searchBar;    //搜索
    UIView *downEdgeView;
    
    int currentPage;
    
    BOOL askAndAnswerUsed;
    BOOL documentUsed;
    BOOL personInforUsed;
    
    AskAndAnswerChooseSegView *askAndAnswerView;
    DocumentChooseSegView *documentSegView;
}
@property (nonatomic, strong) MBProgressHUD *progress;
@end

@implementation KnowledgeCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR;
    
#pragma mark 添加右上角提问按钮
    UIView *askView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40,40)];
    UIButton *askButton = [[UIButton alloc] initWithFrame:askView.frame];
    [askButton setTitle:@"提问" forState:UIControlStateNormal];
    [askButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [askView addSubview:askButton];
    [askButton addTarget:self action:@selector(didClickBeAsk) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:askView];
   // UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"提问" style:UIBarButtonItemStylePlain target:self action:@selector(ask)];
    self.navigationItem.rightBarButtonItem = rightButton;
#pragma mark 添加下方控件
    mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SIZEWIDTH,SIZEHEIGHT)];
    [self.view addSubview:mainScrollView];
    [self setupSubviews];
    // Do any additional setup after loading the view.
    
    currentPage = 1;
    [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfMyAsk page:@"1"];
    [self setupRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ask{
    
}
-(void)setupSubviews{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,64,SIZEWIDTH,40)];
    _searchBar.placeholder = @"搜索";
    _searchBar.delegate = self;
    //[self.view addSubview:_searchBar];
    UIView *chooseView = [[UIView alloc] initWithFrame:CGRectMake(0,0,SIZEWIDTH,SIZEHEIGHT/9)];
    chooseView = [self addTopView:chooseView];
    [mainScrollView addSubview:chooseView];
    
    askAndAnswerView = [[AskAndAnswerChooseSegView alloc] initWithFrame:CGRectMake(0,chooseView.frame.origin.y+chooseView.frame.size.height,SIZEWIDTH,120)];
    askAndAnswerView.delegate = self;
    [mainScrollView addSubview:askAndAnswerView];
    
    documentSegView = [[DocumentChooseSegView alloc] initWithFrame:CGRectMake(0,chooseView.frame.origin.y+chooseView.frame.size.height,SIZEWIDTH,40)];
    documentSegView.delegate = self;
    documentSegView.hidden = YES;
    [mainScrollView addSubview:documentSegView];
    
//  展示数据
    _datasourse = [[NSMutableArray alloc] init];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 0;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    _collectionVC = [[KnowCenterCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:_datasourse];
    _collectionVC.type = KSYKnowCenterShowTypeOfMyAsk;
    _collectionVC.collectionView.frame = CGRectMake(0,askAndAnswerView.frame.origin.y+askAndAnswerView.frame.size.height,SIZEWIDTH,SIZEHEIGHT-(askAndAnswerView.frame.origin.y+askAndAnswerView.frame.size.height));
    _collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:_collectionVC];
    [mainScrollView addSubview:_collectionVC.collectionView];
}
#pragma mark  ----------------------------按钮点击 --------------------------
-(void)didClickAskCenter{
    askAndAnswerView.hidden = NO;
    documentSegView.hidden = YES;
    askAndAnswerUsed = YES;
    documentUsed = NO;
    personInforUsed = NO;
    downEdgeView.frame = CGRectMake(SIZEWIDTH/9,SIZEHEIGHT/9-2,SIZEWIDTH/9,2);
    _collectionVC.collectionView.frame = CGRectMake(0,askAndAnswerView.frame.origin.y+askAndAnswerView.frame.size.height,SIZEWIDTH,SIZEHEIGHT-(askAndAnswerView.frame.origin.y+askAndAnswerView.frame.size.height));
    [askAndAnswerView changeToIndex];
    
}
-(void)didClickDocumentCenter{
    askAndAnswerView.hidden = YES;
    documentSegView.hidden = NO;
    askAndAnswerUsed = NO;
    documentUsed = YES;
    personInforUsed = NO;
    downEdgeView.frame = CGRectMake(SIZEWIDTH/9+SIZEWIDTH/3,SIZEHEIGHT/9-2,SIZEWIDTH/9,2);
    _collectionVC.collectionView.frame = CGRectMake(0,documentSegView.frame.origin.y+documentSegView.frame.size.height,SIZEWIDTH,SIZEHEIGHT-(documentSegView.frame.origin.y+documentSegView.frame.size.height));
    [documentSegView changeToIndex];
    
}
-(void)didClickMyCenter{
    askAndAnswerView.hidden = YES;
    documentSegView.hidden = YES;
    askAndAnswerUsed = NO;
    documentUsed = NO;
    personInforUsed = YES;
    downEdgeView.frame = CGRectMake(SIZEWIDTH/9+SIZEWIDTH*2/3,SIZEHEIGHT/9-2,SIZEWIDTH/9,2);
}

-(UIView *)addTopView:(UIView *)chooseView{
    CGFloat imagesize = chooseView.frame.size.height/2;
    //  问答中心按钮
    ZCImageButton *knowlightView = [[ZCImageButton alloc] initWithFrame:CGRectMake(0, 0, chooseView.frame.size.width/3, chooseView.frame.size.height)];
    knowlightView.imageView_normal.frame = CGRectMake((knowlightView.frame.size.width-imagesize*0.7)/2,knowlightView.frame.size.height/5, imagesize*0.7, imagesize);
    knowlightView.backgroundColor = VIEW_BG_COLOR_Light;
    UIImage *lightimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"know_light" ofType:@"png"]];
    knowlightView.imageView_normal.image = lightimage;
    [knowlightView.imageButton setTitle:@"问答中心" forState:UIControlStateNormal];
    [knowlightView.imageButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    [knowlightView.imageButton setTitleEdgeInsets:UIEdgeInsetsMake(chooseView.frame.size.height*2/3,0,0, 0)];
    [knowlightView.imageButton addTarget:self action:@selector(didClickAskCenter) forControlEvents:UIControlEventTouchUpInside];
    knowlightView.imageButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [chooseView addSubview:knowlightView];
    //  文档中心按钮
    ZCImageButton *knowWenView = [[ZCImageButton alloc] initWithFrame:CGRectMake(chooseView.frame.size.width/3,0, chooseView.frame.size.width/3, chooseView.frame.size.height)];
    knowWenView.imageView_normal.frame = CGRectMake((knowlightView.frame.size.width-imagesize*0.8)/2,knowlightView.frame.size.height/5, imagesize*0.8, imagesize);
    knowWenView.backgroundColor = VIEW_BG_COLOR_Light;
    UIImage *wenimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"know_wen" ofType:@"png"]];
    knowWenView.imageView_normal.image = wenimage;
    [knowWenView.imageButton setTitle:@"文档中心" forState:UIControlStateNormal];
    [knowWenView.imageButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    [knowWenView.imageButton setTitleEdgeInsets:UIEdgeInsetsMake(chooseView.frame.size.height*2/3,0,0, 0)];
    [knowWenView.imageButton addTarget:self action:@selector(didClickDocumentCenter) forControlEvents:UIControlEventTouchUpInside];
    knowWenView.imageButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [chooseView addSubview:knowWenView];
    
    //  个人中心按钮
    ZCImageButton *knowMyView = [[ZCImageButton alloc] initWithFrame:CGRectMake(chooseView.frame.size.width*2/3,0, chooseView.frame.size.width/3, chooseView.frame.size.height)];
    knowMyView.imageView_normal.frame = CGRectMake((knowlightView.frame.size.width-imagesize)/2,knowlightView.frame.size.height/5, imagesize, imagesize);
    knowMyView.backgroundColor = VIEW_BG_COLOR_Light;
    UIImage *setimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"know_set" ofType:@"png"]];
    knowMyView.imageView_normal.image = setimage;
    [knowMyView.imageButton setTitle:@"个人中心" forState:UIControlStateNormal];
    [knowMyView.imageButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    [knowMyView.imageButton setTitleEdgeInsets:UIEdgeInsetsMake(chooseView.frame.size.height*2/3,0,0, 0)];
    [knowMyView.imageButton addTarget:self action:@selector(didClickMyCenter) forControlEvents:UIControlEventTouchUpInside];
    knowMyView.imageButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [chooseView addSubview:knowMyView];
    downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(chooseView.frame.size.width/9,chooseView.frame.size.height-2,chooseView.frame.size.width/9,2)];
    downEdgeView.backgroundColor = [UIColor orangeColor];
    [chooseView addSubview:downEdgeView];
    askAndAnswerUsed = YES;

    return chooseView;
}
#pragma mark  ------------------------------askAndAnswerViewDelegate-------------------------
-(void)chooseIndex:(NSInteger)index{
    currentPage = 1;
    if (index==1) {
        [_datasourse removeAllObjects];
        currentPage = 1;
        _collectionVC.type = KSYRequestKnowCenterTypeOfMyAsk;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfMyAsk page:@"1"];
    }
    else if (index == 2){
        [_datasourse removeAllObjects];
        currentPage = 1;
        _collectionVC.type = KSYRequestKnowCenterTypeOfMyAsk;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfMyConcern page:@"1"];
    }
    else if (index == 3){
        [_datasourse removeAllObjects];
        currentPage = 1;
        _collectionVC.type = KSYRequestKnowCenterTypeOfAllQuestion;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfAllQuestion page:@"1"];
    }
    else if (index == 4){
        [_datasourse removeAllObjects];
        currentPage = 1;
        _collectionVC.type = KSYRequestKnowCenterTypeOfWaitMeAnswer;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfWaitMeAnswer page:@"1"];
    }
    
}
#pragma mark  ------------------------------DocumentSegViewDelegate-------------------
-(void)chooseDocumentIndex:(NSInteger)index{
    currentPage = 1;
    if (index==1) {
        [_datasourse removeAllObjects];
         _collectionVC.type = KSYRequestKnowCenterTypeOfMyUploadDocument;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfMyUploadDocument page:@"1"];
    }
    else if (index == 2){
        [_datasourse removeAllObjects];
        _collectionVC.type = KSYRequestKnowCenterTypeOfPopularDocument;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfPopularDocument page:@"1"];
    }
    else if (index == 3){
        [_datasourse removeAllObjects];
        _collectionVC.type = KSYRequestKnowCenterTypeOfNewestDocument;
        [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfNewestDocument page:@"1"];
    }

    
}
#pragma mark  ------------------------------网络请求-------------------------
-(void)requestKnowCenterOfType:(KSYRequestKnowCenterType)type page:(NSString *)page{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"s_mtime desc" forKey:@"_ORDER_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"deviceId"] forKey:@"mobileDeviceId"];
    [dict setValue:@"true" forKey:@"_IS_DES_"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [dict setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"USER_ID"];
    //[dict setValue:@"15" forKey:@"_ROWNUM_"];
    //[dict setValue:page forKey:@"NOWPAGE"];
    [self setupProgressHUD];
    if (type == KSYRequestKnowCenterTypeOfMyAsk) {
        [dict setValue:page forKey:@"NOWPAGE"];
        [dict setValue:@"15" forKey:@"_ROWNUM_"];
        [ALNetWorkApi zhidaoUserWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyAskModel *askModel = [MyAskModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:askModel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestKnowCenterTypeOfMyConcern){
        [ALNetWorkApi myConcernQuestionsWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                [dict setValue:page forKey:@"NOWPAGE"];
                [dict setValue:@"15" forKey:@"_ROWNUM_"];
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyAskModel *modeld = [MyAskModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:modeld];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestKnowCenterTypeOfAllQuestion){
        [ALNetWorkApi allQuestionsWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                [dict setValue:page forKey:@"NOWPAGE"];
                [dict setValue:@"15" forKey:@"_ROWNUM_"];
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyAskModel *modeld = [MyAskModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:modeld];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestKnowCenterTypeOfWaitMeAnswer){
        [ALNetWorkApi inviteMeWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                [dict setValue:page forKey:@"NOWPAGE"];
                [dict setValue:@"15" forKey:@"_ROWNUM_"];
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyAskModel *modeld = [MyAskModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:modeld];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }

    else if (type == KSYRequestKnowCenterTypeOfMyUploadDocument){
        [dict setValue:@"DOCUMENT_READ_COUNTER desc" forKey:@"_ORDER_"];
        [dict setValue:page forKey:@"NOWPAGE"];
        [dict setValue:@"15" forKey:@"_ROWNUM_"];
        [ALNetWorkApi myDocumentWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyUploadDocumentModel *myUploadModel = [MyUploadDocumentModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:myUploadModel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestKnowCenterTypeOfPopularDocument){
        [dict setValue:@"DOCUMENT_READ_COUNTER desc" forKey:@"_ORDER_"];
        [dict setValue:page forKey:@"NOWPAGE"];
        [dict setValue:@"15" forKey:@"_ROWNUM_"];
        [ALNetWorkApi hotWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyUploadDocumentModel *myUploadModel = [MyUploadDocumentModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:myUploadModel];
                }
                [_collectionVC.collectionView reloadData];
                
            }else{
                NSLog(@"responseData - %@ message%@",responseData,message);
                
            }
            [_progress hide:YES];
        }];
    }
    else if (type == KSYRequestKnowCenterTypeOfNewestDocument){
        [dict setValue:@"DOCUMENT_READ_COUNTER desc" forKey:@"_ORDER_"];
        [dict setValue:page forKey:@"NOWPAGE"];
        [dict setValue:@"15" forKey:@"_ROWNUM_"];
        [ALNetWorkApi followWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
            if (success) {
                //NSLog(@"array count = %@",responseData);
                NSMutableDictionary *dic = responseData;
                TeamWorkResponseModel *model = [TeamWorkResponseModel getEntityFromDic:dic];
                NSLog(@"%ld",model._DATA_.count);
                for (int i = 0;i<model._DATA_.count;i++) {
                    MyUploadDocumentModel *myUploadModel = [MyUploadDocumentModel getEntityFromDic:model._DATA_[i]];
                    [_datasourse addObject:myUploadModel];
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
    __weak KnowledgeCenterViewController *weakSelf = self;
    // 下拉刷新
/*    weakSelf.collectionVC.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [dataSource removeAllObjects];
        currentPage = 1;
        [weakSelf.collectionVC.collectionView reloadData];
        if (knowCenterUsed) {
            [self requestMyCollectOfType:KSYRequestCollectTypeOfKnowCenter page:@"1"];
        }
        else if (informationUsed){
            [self requestMyCollectOfType:KSYRequestCollectTypeOfInfor page:@"1"];
        }
        
        [weakSelf.collectionVC.collectionView.header endRefreshing];
        
        
    }];
 */
    weakSelf.collectionVC.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        currentPage++;
        NSString *pageStr = [NSString stringWithFormat:@"%d",currentPage];
        if (_collectionVC.type == KSYKnowCenterShowTypeOfMyUploadDocument) {
            [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfMyUploadDocument page:pageStr];
        }
        if (_collectionVC.type == KSYKnowCenterShowTypeOfPopularDocument) {
            [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfPopularDocument page:pageStr];
        }
        if (_collectionVC.type == KSYKnowCenterShowTypeOfNewestDocument) {
            [self requestKnowCenterOfType:KSYRequestKnowCenterTypeOfNewestDocument page:pageStr];
        }
        [weakSelf.collectionVC.collectionView.footer setState:MJRefreshStateIdle];
        
    }];
}
-(void)didClickBeAsk{
    KSYWebViewController *vc = [[KSYWebViewController alloc] init];
    vc.titleString = @"提问";
    vc.url = [ZCNSStringUtil getMainUrl:@"/sy/base/view/stdCardView.jsp?sId=SY_COMM_ZHIDAO_QUESTION_HTML"];
    [self presentViewController:vc animated:NO completion:nil];
}
@end
