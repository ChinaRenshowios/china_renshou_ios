//
//  LoginViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/18.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "LoginViewController.h"
#import "ZCCommonTextField.h"
#import "KSYCommonButtonWithGreen.h"
#import "ViewController.h"

@interface LoginViewController (){
    UILabel *titleLabel;
    ZCCommonTextField *nameTextField;
    ZCCommonTextField *pswTextField;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR;
    [self setupSubview];
    // Do any additional setup after loading the view.
}
- (void)setupSubview{
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0,20, SIZEWIDTH, SIZEHEIGHT-20)];
    mainView.backgroundColor = [UIColor whiteColor];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH, SIZEHEIGHT-20)];
    UIImage *BgImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user_login_bg" ofType:@"png"]];
    bgImageView.image = BgImage;
    [mainView addSubview:bgImageView];
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(LEFTEDGE,bgImageView.frame.size.height/4, SIZEWIDTH-2*LEFTEDGE,bgImageView.frame.size.height/2)];
    shadowView.backgroundColor = [UIColor whiteColor];
    shadowView.alpha = 0.6;
    [mainView addSubview:shadowView];
    UIView *loginView = [[UIView alloc] initWithFrame:CGRectMake(LEFTEDGE*4/3,shadowView.frame.origin.y+LEFTEDGE/3,shadowView.frame.size.width-LEFTEDGE*2/3,shadowView.frame.size.height-LEFTEDGE*2/3)];
    loginView.backgroundColor = [UIColor whiteColor];
    loginView.alpha = 0.8;
    [mainView addSubview:loginView];
    
    //
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,loginView.frame.size.width, loginView.frame.size.height/6)];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //titleLabel.textColor = COMMON_FONT_COLOR;
    titleLabel.text = @"北京大学校友系统";
    [loginView addSubview:titleLabel];
    
    CGFloat width = (loginView.frame.size.width-2*LEFTEDGE)/6;
    nameTextField = [[ZCCommonTextField alloc] initWithFrame:CGRectMake(LEFTEDGE,titleLabel.frame.size.height+TOPEDGE/2, loginView.frame.size.width-2*LEFTEDGE,loginView.frame.size.height/7) pic:@"user_login_name" width:width];
    //nameTextField.leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    [nameTextField setPadding:YES top:0 right:5 bottom:0 left:width+5];
    nameTextField.placeholder = @"请输入账号";
    
    [loginView addSubview:nameTextField];
    
    pswTextField = [[ZCCommonTextField alloc] initWithFrame:CGRectMake(LEFTEDGE,nameTextField.frame.origin.y+nameTextField.frame.size.height+TOPEDGE/2, loginView.frame.size.width-2*LEFTEDGE,loginView.frame.size.height/7) pic:@"user_login_psw" width:width];
    //nameTextField.leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    [pswTextField  setPadding:YES top:0 right:5 bottom:0 left:width+5];
    pswTextField .placeholder = @"请输入密码";
    pswTextField.secureTextEntry = YES;
    [loginView addSubview:pswTextField];
    
    KSYCommonButtonWithGreen *loginButton = [[KSYCommonButtonWithGreen alloc] initWithFrame:CGRectMake(LEFTEDGE,pswTextField.frame.origin.y+pswTextField.frame.size.height+TOPEDGE,loginView.frame.size.width-2*LEFTEDGE, loginView.frame.size.height/7) Color:BUTTON_BG_COLOR Title:@"登录"];
    [loginButton addTarget:self action:@selector(didClickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [loginView addSubview:loginButton];
    
    UITapGestureRecognizer *tapgs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [mainView addGestureRecognizer:tapgs];
    
    UIButton *forgetPswButton = [[UIButton alloc] initWithFrame:CGRectMake(LEFTEDGE, loginButton.frame.origin.y+loginButton.frame.size.height+TOPEDGE,80, 20)];
    [forgetPswButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPswButton setTitleColor:COMMON_FONT_COLOR forState:UIControlStateNormal];
    forgetPswButton.titleLabel.font = [UIFont systemFontOfSize:15];
    forgetPswButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [forgetPswButton addTarget:self action:@selector(didClickForgetButton) forControlEvents:UIControlEventTouchUpInside];
    
    [loginView addSubview:forgetPswButton];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(loginView.frame.size.width-LEFTEDGE-80, loginButton.frame.origin.y+loginButton.frame.size.height+TOPEDGE,80, 20)];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:COMMON_FONT_COLOR forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [loginView addSubview:registerButton];
    
    
    [self.view addSubview:mainView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickLoginButton{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:YES forKey:@"login"];
    [userDefault setObject:@"1" forKey:@"uid"];
    [userDefault synchronize];
    ViewController *viewVC = [[ViewController alloc] init];
    [[[UIApplication sharedApplication] delegate] window].rootViewController = viewVC;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    return YES;
}
-(void)didTap{
    [pswTextField resignFirstResponder];
    [nameTextField resignFirstResponder];
}
-(void)didClickForgetButton{
   
    
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
