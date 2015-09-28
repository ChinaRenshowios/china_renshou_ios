//
//  SystemSetingViewController.m
//  Alumnus
//
//  Created by ksy on 15/8/19.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "SystemSetingViewController.h"
#import "KSYViewWithImageAndButton.h"
#import "ZCImagePickerViewController.h"
#import "LoginViewController.h"


@interface SystemSetingViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate>{
    
    UIImageView *logoImageView;     //头像
}

@end

@implementation SystemSetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景颜色
    self.view.backgroundColor = VIEW_BG_COLOR_Light;
    [self setupSubview];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupSubview{
// 上边缘
    UIView *upEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,63+2*TOPEDGE,SIZEWIDTH,1)];
    upEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
    [self.view addSubview:upEdgeView];
//  修改密码
    KSYViewWithImageAndButton *modifyPSWView = [[KSYViewWithImageAndButton alloc] initWithFrame:CGRectMake(0,64+2*TOPEDGE,SIZEWIDTH, 60) title:@"修改密码" pic:@"i1"];
    [modifyPSWView.goToButton addTarget:self action:@selector(didClickModifyPSW) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modifyPSWView];
    
//  更换头像
    KSYViewWithImageAndButton *modifyLogoView = [[KSYViewWithImageAndButton alloc] initWithFrame:CGRectMake(0,modifyPSWView.frame.origin.y+modifyPSWView.frame.size.height,SIZEWIDTH, 60) title:@"更换头像" pic:@"i1"];
    [modifyLogoView.goToButton addTarget:self action:@selector(didClickModifyLogo) forControlEvents:UIControlEventTouchUpInside];
    logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(modifyLogoView.arowImageview.frame.origin.x-modifyLogoView.frame.size.height*5/6-5, modifyLogoView.frame.size.height/12, modifyLogoView.frame.size.height*5/6, modifyLogoView.frame.size.height*5/6)];
    logoImageView.backgroundColor =[UIColor grayColor];
    [modifyLogoView addSubview:logoImageView];
    [self.view addSubview:modifyLogoView];
    
//  界面设置
    KSYViewWithImageAndButton *modifyUI = [[KSYViewWithImageAndButton alloc] initWithFrame:CGRectMake(0,modifyLogoView.frame.origin.y+modifyLogoView.frame.size.height,SIZEWIDTH, 60) title:@"界面设置" pic:@"i1"];
    [modifyUI.goToButton addTarget:self action:@selector(didClickModifyUI) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modifyUI];
    
// 使用统计
    KSYViewWithImageAndButton *userDataGet = [[KSYViewWithImageAndButton alloc] initWithFrame:CGRectMake(0,modifyUI.frame.origin.y+modifyUI.frame.size.height,SIZEWIDTH, 60) title:@"使用统计" pic:@"i1"];
    [userDataGet.goToButton addTarget:self action:@selector(didClickUserData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:userDataGet];
// 下边缘
    UIView *downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,userDataGet.frame.size.height-1,SIZEWIDTH, 1)];
    downEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
    [userDataGet addSubview:downEdgeView];
    
// 退出登录
    UIButton *quitButton = [[UIButton alloc]initWithFrame:CGRectMake(-1,userDataGet.frame.origin.y+userDataGet.frame.size.height+2*TOPEDGE,SIZEWIDTH+2,60)];
    quitButton.layer.borderColor = [LOGIN_EDGE_COLOR CGColor];
    quitButton.layer.borderWidth = 1;
    [quitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [quitButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [quitButton addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quitButton];

}
-(void)didClickModifyPSW{
    KSYPresentCommonViewController *vc = [[KSYPresentCommonViewController alloc] init];
    vc.titleString = @"修改密码";
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)didClickModifyLogo{
    UIActionSheet *sheet;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍摄",@"从相册选择", nil];
    }
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    [sheet showInView:self.view];
    

}
-(void)didClickModifyUI{
    KSYPresentCommonViewController *vc = [[KSYPresentCommonViewController alloc] init];
    vc.titleString = @"界面设置";
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)didClickUserData{
    KSYPresentCommonViewController *vc = [[KSYPresentCommonViewController alloc] init];
    vc.titleString = @"用户统计";
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)quit{
    LoginViewController *vc = [[LoginViewController alloc] init];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:NO forKey:@"login"];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark ------------UIActionSheetDelegate------------
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    NSUInteger sourceType = 0;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        switch (buttonIndex) {
            case 0:
                // 取消
                return;
            case 1:
                // 相机
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
                
            case 2:
                // 相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
        }
    }
    else {
        if (buttonIndex == 0) {
            
            return;
        } else {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        
        
        
        // 跳转到相机或相册页面
        ZCImagePickerViewController *imagePickerController = [[ZCImagePickerViewController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}


#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = nil;
    if ([picker allowsEditing]){
        //获取用户编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
        // 照片的元数据参数
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    [self saveImage:image withName:@"treasure_homepage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"treasure_homepage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [self methodUpload];
    
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}




#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

//上传（以表单方式上传，以图片为例）
- (void)methodUpload
{
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"treasure_homepage.png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    logoImageView.image = savedImage;
/*
    NSData *imageData = UIImageJPEGRepresentation(savedImage, 0.5);
    NSString *type = @"2";
    NSString *type_sha = [ZCNSStringUtil sha1:type];
    NSLog(@"%@",fullPath);
    NSDictionary *dic = @{@"img":imageData};
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *uid = [userDefault valueForKey:@"uid"];
    NSString *source_sha = [ZCNSStringUtil sha1:SOURCE];
    NSString *vcode = [NSString stringWithFormat:@"%@%@",type_sha,source_sha];
    vcode = [ZCNSStringUtil md5:vcode];
    
    NSDictionary *pra = @{@"type":@"2",@"userid":uid,@"source":SOURCE,@"vcode":vcode};
    [KSYCommonNetWork requestURL:UPLOADUSERPHOTOAPI httpMethod:@"POST" params:pra file:dic success:^(id data){
        NSLog(@"data == %@",data);
        NSDictionary *dic = data;
        if([[dic valueForKey:@"status"] isEqual:@"ok"]){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"头像修改成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            alertView.tag = -1;
            [alertView show];
            
        }
        
        
        
        
    }fail:^(NSError *error){
        
    }];
  */
    
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
