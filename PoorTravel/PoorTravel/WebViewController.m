//
//  WebViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
    [self indicator];
    [_indicator startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)createWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:
                          
                       self.view.frame];
    webView.delegate = self;
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    [webView loadRequest:request];
}

- (UIActivityIndicatorView*)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc]
                      initWithFrame:CGRectMake(0, 0, 100, 100)];
        _indicator.center = self.view.center;
        _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self.view addSubview:_indicator];
    }
    return _indicator;

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

   
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_indicator stopAnimating];
    [_indicator removeFromSuperview];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
