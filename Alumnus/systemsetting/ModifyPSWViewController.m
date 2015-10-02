//
//  ModifyPSWViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/30.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "ModifyPSWViewController.h"
#import "ZCCommonTextField.h"
#import "KSYCommonButtonWithGreen.h"

@interface ModifyPSWViewController ()<UIAlertViewDelegate>{
    ZCCommonTextField *beforePswTextField;
    UITextField *newPswTextField;
    UITextField *confirmNewPswTextField;
}

@end

@implementation ModifyPSWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR_Light;
    [self setupSubview];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupSubview{
    beforePswTextField = [[ZCCommonTextField alloc] initWithFrame:CGRectMake(0, self.nav.frame.size.height+TOPEDGE, SIZEWIDTH, 50) title:@"旧密码" width: SIZEWIDTH/4];
    beforePswTextField.backgroundColor = COMMON_INNER_BG_COLOR;
    beforePswTextField.textAlignment = NSTextAlignmentLeft;
    beforePswTextField.placeholder = @"请输入旧密码";
    
    [self.view addSubview:beforePswTextField];
    
    newPswTextField = [[ZCCommonTextField alloc] initWithFrame:CGRectMake(0, beforePswTextField.frame.size.height+beforePswTextField.frame.origin.y+1, SIZEWIDTH, 50) title:@"新密码" width: SIZEWIDTH/4];
    newPswTextField.backgroundColor = COMMON_INNER_BG_COLOR;
    newPswTextField.textAlignment = NSTextAlignmentLeft;
    newPswTextField.placeholder = @"请输入新密码";
    
    [self.view addSubview:newPswTextField];
    
    confirmNewPswTextField = [[ZCCommonTextField alloc] initWithFrame:CGRectMake(0,newPswTextField.frame.size.height+newPswTextField.frame.origin.y+1, SIZEWIDTH, 50) title:@"确认密码" width: SIZEWIDTH/4];
    confirmNewPswTextField.backgroundColor = COMMON_INNER_BG_COLOR;
    confirmNewPswTextField.textAlignment = NSTextAlignmentLeft;
    confirmNewPswTextField.placeholder = @"请再次输入新密码";
    
    [self.view addSubview:confirmNewPswTextField];
    
    KSYCommonButtonWithGreen *enterButton = [[KSYCommonButtonWithGreen alloc] initWithFrame:CGRectMake(LEFTEDGE/2, confirmNewPswTextField.frame.origin.y+confirmNewPswTextField.frame.size.height+3*TOPEDGE,SIZEWIDTH-LEFTEDGE,40) Color:DOCK_BG_COLOR Title:@"确认修改"];
    [enterButton addTarget:self action:@selector(didClickEnterButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:enterButton];
    
}

- (void)didClickReturnButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didClickEnterButton{
    if (beforePswTextField.text.length==0||newPswTextField.text.length==0||confirmNewPswTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"输入信息不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    else if(![newPswTextField.text isEqual:confirmNewPswTextField.text]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次密码输入不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    else{
#pragma mark 网络请求
        
        
    }
}
#pragma mark --uialert delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        if (buttonIndex == 0) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}



@end
