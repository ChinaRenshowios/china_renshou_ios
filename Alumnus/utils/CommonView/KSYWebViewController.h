//
//  KSYWebViewController.h
//  AntiquepPie
//
//  Created by ksy on 15/7/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJKWebViewProgress.h"
#import "KSYCommonViewController.h"

@interface KSYWebViewController : KSYCommonViewController<UIWebViewDelegate, NJKWebViewProgressDelegate>

@property (strong,nonatomic) NSString *url;
@property (strong,nonatomic) NSString *titleName;
@end
