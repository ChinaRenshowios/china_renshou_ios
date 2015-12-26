//
//  KSYWebViewController.m
//  AntiquepPie
//
//  Created by ksy on 15/7/14.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

#import "KSYWebViewController.h"
#import "NJKWebViewProgressView.h"

@interface KSYWebViewController ()<UIWebViewDelegate>{
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
    UIView *nav;
    UIWebView *webView;
}

@end

@implementation KSYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"loadddddddd");
    self.view.backgroundColor = [UIColor whiteColor];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,64, SIZEWIDTH, SIZEHEIGHT-64)];
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
  //  [webView loadRequest:request];
   // webView.delegate = self;
    [self.view addSubview:webView];
    _progressProxy = [[NJKWebViewProgress alloc] init];
    webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigaitonBarBounds = nav.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view bringSubviewToFront:self.nav];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [nav addSubview:_progressView];
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
    [_progressView removeFromSuperview];
    [webView loadHTMLString:@" " baseURL:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)didClickReturnButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //NSLog(@"url为%@",[[NSBundle mainBundle] pathForResource:@"mgmt_d_order_s2" ofType:@"htm"]);
    //NSString *path = [[NSBundle mainBundle] resourcePath];
    
   // NSLog(@"newpath = %@",newpath);
    NSLog(@"%@",request.mainDocumentURL.relativePath);
    if([request.mainDocumentURL.relativePath isEqualToString:@"/trunk/_html/_wechat/album_detail.html"]){
        NSLog(@"1111111");
        _url = nil;
        return NO;
    }
    else if ([request.mainDocumentURL.relativePath isEqualToString:@"/trunk/_html/_wechat/index.html"]){
        [self dismissViewControllerAnimated:YES completion:nil];
        _url = nil;
        return NO;
    }
    else if ([request.mainDocumentURL.relativePath isEqualToString:@"/app/index.php"]){
        [self dismissViewControllerAnimated:YES completion:nil];
        _url = nil;
        return NO;
    }
    else
        return YES;
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
