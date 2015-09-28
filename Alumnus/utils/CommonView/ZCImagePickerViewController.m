//
//  ZCImagePickerViewController.m
//  AntiquepPie
//
//  Created by 张超 on 15/6/12.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "ZCImagePickerViewController.h"

@interface ZCImagePickerViewController ()

@end

@implementation ZCImagePickerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //修改背景色为白色
    self.navigationController.navigationBarHidden = NO;
    self.navigationBar.barTintColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
