//
//  HomepageMainViewController.m
//  Alumnus
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "HomepageMainViewController.h"
#import "KSYHomePageButtonView.h"
#import "MyWaitIndexViewController.h"
#import "MyMissonIndexViewController.h"
#define modelMargin (LEFTEDGE/2)

@interface HomepageMainViewController ()<UIScrollViewDelegate>
{
    UIScrollView *fuctionModelScrollView;        //可配置模块滑动view
    UIPageControl *fuctionChangeControl;         //控制模块分页
    NSInteger userModelNum;                      //用户模块数量
    UIView *modelView_one;                       //第一模块
    UIView *modelView_two;                       //第二模块
    MyWaitIndexViewController *myWaitVC;         //待办页面
    MyMissonIndexViewController *myMissonVC;     //任务页面
}

@end

@implementation HomepageMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _userModleArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    [self addAllSubViews];
    [self changeModelByUserInfo];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 初始化控件
-(void)addAllSubViews{
#pragma mark ------------------------------工作平台模块------------------------------------------
    fuctionModelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SIZEHEIGHT/5, SIZEWIDTH, SIZEWIDTH)];
 // 隐藏滚动条
    fuctionModelScrollView.showsVerticalScrollIndicator = FALSE;
    fuctionModelScrollView.showsHorizontalScrollIndicator = FALSE;

    fuctionModelScrollView.pagingEnabled = YES;
    
 //代理
    fuctionModelScrollView.delegate = self;
//添加模块
    modelView_one = [[UIView alloc] initWithFrame:CGRectMake(0, -64, SIZEWIDTH,SIZEWIDTH)];
    modelView_two = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH,-64, SIZEWIDTH,SIZEWIDTH)];
    modelView_two.backgroundColor = [UIColor blueColor];
    [fuctionModelScrollView addSubview:modelView_one];
    [fuctionModelScrollView addSubview:modelView_two];
    [self.view addSubview:fuctionModelScrollView];
#pragma mark ------------------------------分页控制------------------------------------------
    fuctionChangeControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,fuctionModelScrollView.frame.origin.y+fuctionModelScrollView.frame.size.height+TOPEDGE, SIZEWIDTH, 20)];
    fuctionChangeControl.pageIndicatorTintColor = [UIColor grayColor];  //未选中圆点颜色
    fuctionChangeControl.currentPageIndicatorTintColor = [UIColor colorWithRed:235.0/255.0 green:97.0/255.0 blue:0.0/255.0 alpha:1.0];   //选中圆点颜色
    [self.view addSubview:fuctionChangeControl];
    
}
#pragma mark ------------------------------根据用户信息配置模块------------------------------------------
-(void)changeModelByUserInfo{
#warning 数据先写死。后期根据接口内容改变
    userModelNum = _userModleArray.count;
    NSInteger page = (userModelNum%9!=0)?userModelNum/9+1:userModelNum/9;   //计算布局
    fuctionChangeControl.currentPage = 1;
    fuctionChangeControl.numberOfPages = page;
    fuctionModelScrollView.contentSize = CGSizeMake(SIZEWIDTH*fuctionChangeControl.numberOfPages,0);
    [self addModel];

    
    
    
}
#pragma mark ------------------------------配置模块(可能需要传参)------------------------------------------
-(void)addModel{
    CGFloat modelSize = (SIZEWIDTH-8*modelMargin)/3;
    if (userModelNum<=9) {
        for (int i = 0;i<_userModleArray.count;i++) {
            NSString *modelId = [_userModleArray objectAtIndex:i];
            KSYHomePageButtonView *btnView = [[KSYHomePageButtonView alloc] initWithFrame:CGRectMake(modelMargin*2+i%3*((2*modelMargin)+modelSize),i/3*((2*modelMargin)+modelSize),modelSize,modelSize)];
            btnView.imageButton.tag = [modelId integerValue];
            btnView.backgroundColor = DOCK_SELECT_COLOR;
            [btnView.imageButton addTarget:self action:@selector(didClickModelButton:) forControlEvents:UIControlEventTouchUpInside];
            [self buildOneModel:btnView WithId:modelId];
            [modelView_one addSubview:btnView];
        }
    }
    
}
#pragma mark ------------------------------构建每一个模块------------------------------------------
-(void)buildOneModel:(KSYHomePageButtonView*)btn WithId:(NSString *)btnid{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"i%@",btnid] ofType:@"png"]];
    btn.imageView.image = image;
    switch ([btnid intValue]) {
        case 1:
            btn.imageLabel.text = @"我的待办";
            break;
        case 2:
            btn.imageLabel.text = @"我的会议";
            break;
        case 3:
            btn.imageLabel.text = @"我的日程";
            break;
        case 4:
            btn.imageLabel.text = @"我的任务";
            break;
        case 5:
            btn.imageLabel.text = @"团队协作";
            break;
        case 6:
            btn.imageLabel.text = @"我的邮件";
            break;
        case 7:
            btn.imageLabel.text = @"备忘录";
            break;
        case 8:
            btn.imageLabel.text = @"通讯录";
            break;
        case 9:
            btn.imageLabel.text = @"我的收藏";
            break;
        default:
            break;
    }
    
    
}
#pragma mark ------------------------------scroll delegate------------------------------------------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
        CGFloat pageWidth = CGRectGetWidth(fuctionModelScrollView.frame);
        NSInteger page = floor((scrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
        fuctionChangeControl.currentPage = page;
   
}
#pragma mark ------------------------------按钮点击------------------------------------------
-(void)didClickModelButton:(UIButton *)btn{
    NSInteger tag = btn.tag;
    switch (tag) {
        case 1:
            myWaitVC = [[MyWaitIndexViewController alloc] init];
            [self presentViewController:myWaitVC animated:YES completion:nil];
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            myMissonVC = [[MyMissonIndexViewController alloc] init];
            myMissonVC.titleString = @"我的任务";
            [self presentViewController:myMissonVC animated:YES completion:nil];
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
        case 9:
            break;
        default:
            break;
    }
}

@end
