//
//  MyWaitIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MyWaitIndexViewController.h"

@interface MyWaitIndexViewController (){
    UIScrollView *chooseSegView;     //可滑动的选项卡view
    //  下选中边缘
    UIView *downEdgeView;
}

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
//  按钮
    //内网按钮
    UIButton *innerNetButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH/4,chooseSegView.frame.size.height)];
    [innerNetButton setTitle:@"内网" forState:UIControlStateNormal];
    [innerNetButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    innerNetButton.tag = 1;
    [innerNetButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:innerNetButton];
    //OA按钮
    UIButton *oaButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/4,0, SIZEWIDTH/4,chooseSegView.frame.size.height)];
    [oaButton setTitle:@"OA" forState:UIControlStateNormal];
    [oaButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    oaButton.tag = 2;
    
    [oaButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:oaButton];
    
    //SAP按钮
    UIButton *sapButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH*2/4,0, SIZEWIDTH/4,chooseSegView.frame.size.height)];
    [sapButton setTitle:@"SAP报销" forState:UIControlStateNormal];
    [sapButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    sapButton.tag = 3;
    [sapButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:sapButton];
    
    //诉讼案件按钮
    UIButton *caseButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH*3/4,0, SIZEWIDTH/4,chooseSegView.frame.size.height)];
    [caseButton setTitle:@"诉讼案件" forState:UIControlStateNormal];
    [caseButton setTitleColor:DOCK_BG_COLOR forState:UIControlStateNormal];
    caseButton.tag = 4;
    [sapButton addTarget:self action:@selector(didClickChooseButton:) forControlEvents:UIControlEventTouchUpInside];
    [chooseSegView addSubview:caseButton];
    
    
    //  下选中边缘
    downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,chooseSegView.frame.size.height-2,SIZEWIDTH/4, 2)];
    downEdgeView.backgroundColor = [UIColor orangeColor];
    [chooseSegView addSubview:downEdgeView];
    [self.view addSubview:chooseSegView];
}
#pragma mark 选项卡点击
-(void)didClickChooseButton:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            downEdgeView.frame = CGRectMake(0,chooseSegView.frame.size.height-2, SIZEWIDTH/4, 2);
            break;
        case 2:
            downEdgeView.frame = CGRectMake(SIZEWIDTH/4,chooseSegView.frame.size.height-2, SIZEWIDTH/4, 2);
            break;
        case 3:
            downEdgeView.frame = CGRectMake(SIZEWIDTH/2,chooseSegView.frame.size.height-2, SIZEWIDTH/4, 2);
            break;
        case 4:
            downEdgeView.frame = CGRectMake(SIZEWIDTH*3/4,chooseSegView.frame.size.height-2, SIZEWIDTH/4, 2);
            break;
        default:
            break;
    }
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
