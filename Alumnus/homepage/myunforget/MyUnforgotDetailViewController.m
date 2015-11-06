//
//  MyUnforgotDetailViewController.m
//  Alumnus
//
//  Created by ksy on 15/11/6.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyUnforgotDetailViewController.h"

@interface MyUnforgotDetailViewController ()

@end

@implementation MyUnforgotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE,64+TOPEDGE,SIZEWIDTH-2*LEFTEDGE, [_detailStr boundingRectWithSize:CGSizeMake(SIZEWIDTH-2*LEFTEDGE,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height)];
    detailLabel.numberOfLines = 0;
    detailLabel.text = [ZCNSStringUtil filterHTML:_detailStr];
    detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
    NSLog(@"%@",_detailStr);
    [self.view addSubview:detailLabel];
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
