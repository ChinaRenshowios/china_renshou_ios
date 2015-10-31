//
//  MyMissonIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MyMissonIndexViewController.h"
#import "KSYMyMisCollectionViewController.h"

@interface MyMissonIndexViewController (){
    UIScrollView *chooseSegView;     //可滑动的选项卡view
    //  下选中边缘
    UIView *downEdgeView;
    
    NSMutableArray *dataSource;
    KSYMyMisCollectionViewController *collectionVC;

}

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
    [dataSource addObject:@"da"];
    [dataSource addObject:@"da"];
    [dataSource addObject:@"da"];
    [dataSource addObject:@"da"];
    [dataSource addObject:@"da"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    collectionVC = [[KSYMyMisCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:dataSource];
    collectionVC.collectionView.scrollEnabled = YES;
    collectionVC.collectionView.frame = CGRectMake(0,chooseSegView.frame.origin.y+chooseSegView.frame.size.height,SIZEWIDTH,collectionVC.collectionView.frame.size.height-(chooseSegView.frame.origin.y+chooseSegView.frame.size.height));
    collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:collectionVC];
    [self.view addSubview:collectionVC.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 选项卡点击
-(void)didClickChooseButton:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            downEdgeView.frame = CGRectMake(0,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            //[self chooseChildrenSeg:1];
            break;
        case 2:
            downEdgeView.frame = CGRectMake(SIZEWIDTH/2,chooseSegView.frame.size.height-2, SIZEWIDTH/2, 2);
            //[self chooseChildrenSeg:1];
            break;
        default:
            break;
    }
}
@end
