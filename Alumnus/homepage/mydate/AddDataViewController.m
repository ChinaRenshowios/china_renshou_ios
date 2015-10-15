//
//  AddDataViewController.m
//  Alumnus
//
//  Created by ksy on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "AddDataViewController.h"
#import "ZCCommonTextField.h"
#import "KSYViewWithImageAndButton.h"

@interface AddDataViewController ()

@end

@implementation AddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR_Light;
#pragma mark 右上添加按钮
    UIView *addView = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH-50,23,40,40)];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [addButton setTitle:@"完成" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addView addSubview:addButton];
    [addButton addTarget:self action:@selector(didClickFinish) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:addView];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickFinish{
    
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
