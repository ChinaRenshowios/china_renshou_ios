//
//  KnowledgeCenterViewController.m
//  Alumnus
//
//  Created by ksy on 15/8/19.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "KnowledgeCenterViewController.h"
#import "CommonWithHeadFootCollectionViewController.h"

@interface KnowledgeCenterViewController ()<UISearchBarDelegate>{
    UISearchBar *_searchBar;    //搜索
    CommonWithHeadFootCollectionViewController *collectionVC;  //数据
}

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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:askView];
   // UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"提问" style:UIBarButtonItemStylePlain target:self action:@selector(ask)];
    self.navigationItem.rightBarButtonItem = rightButton;
#pragma mark 添加下方控件
    [self setupSubviews];
    // Do any additional setup after loading the view.
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
    [self.view addSubview:_searchBar];
    UIView *chooseView = [[UIView alloc] initWithFrame:CGRectMake(0,_searchBar.frame.origin.y+_searchBar.frame.size.height,SIZEWIDTH,SIZEHEIGHT/9)];
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
    [self.view addSubview:chooseView];
    
//  展示数据
    _datasourse = [[NSMutableArray alloc] init];
    [_datasourse addObject:@"da"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    flowLayout.headerReferenceSize = CGSizeMake(SIZEWIDTH,35);
    flowLayout.footerReferenceSize = CGSizeMake(SIZEWIDTH,35);
    CGFloat paddingY = 0;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    collectionVC = [[CommonWithHeadFootCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:_datasourse];
    collectionVC.type = @"1";
    collectionVC.collectionView.frame = CGRectMake(0,chooseView.frame.origin.y+chooseView.frame.size.height,SIZEWIDTH,collectionVC.collectionView.frame.size.height);
    collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:collectionVC];
    [self.view addSubview:collectionVC.collectionView];
}
#pragma mark  ----------------------------按钮点击 --------------------------
-(void)didClickAskCenter{
    
}
-(void)didClickDocumentCenter{
    
}
-(void)didClickMyCenter{
    
}
#pragma mark  ----------------------------searchbar delegate --------------------------
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    
}

@end
