//
//  MyUnforgetIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/16.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyUnforgetIndexViewController.h"
#import "MyUnforgotCollectionViewController.h"

@interface MyUnforgetIndexViewController (){
     UISearchBar *searchBar;    //搜索
    MyUnforgotCollectionViewController *collectionVC;
}

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
    [_datasource addObject:@"da"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    collectionVC = [[MyUnforgotCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:_datasource];
    collectionVC.collectionView.scrollEnabled = YES;
    collectionVC.collectionView.frame = CGRectMake(0,searchBar.frame.origin.y+searchBar.frame.size.height,SIZEWIDTH,collectionVC.collectionView.frame.size.height);
    collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:collectionVC];
    [self.view addSubview:collectionVC.collectionView];
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickAdd{
    
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
